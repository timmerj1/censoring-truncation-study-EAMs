rm(list = ls())
# remotes::install_github("ampl-psych/EMC2-advanced",ref="dev_rename")
library(EMC2)

ADmat <- matrix(c(-1/2,1/2),ncol=1,dimnames=list(NULL,"d")); ADmat

n_trials = 200
n_samples = 10

# Standard models ----
# * LBA ====
designLBA <- design(
  factors = list(S = c("left", "right"),
                 subjects = 1:n_samples),
  Rlevels = c("left", "right"),
  model = LBA,
  matchfun = function(d) d$S == d$lR,
  formula = list(B ~ 1, v ~ lM, A ~ 1, sv ~ lM, t0 ~ 1),
  constants = c(sv = 0),
  contrasts=list(lM=ADmat)
)

parsLBA <- sampled_p_vector(designLBA,doMap = F)
parsLBA[1:6] <- c(log(2),3,1,log(2),log(.75),log(.2))
datLBA <- make_data(parsLBA, designLBA, n_trials = n_trials)

# * RDM ====

designRDM <- design(data=datLBA,model = RDM,
                    matchfun = function(d) d$S == d$lR,
                    formula = list(B ~ 1, v ~ lM, s ~ lM, t0 ~ 1),
                    constants = c(s = 0),
                    contrasts=list(lM=ADmat)
)

parsRDM <- sampled_p_vector(designRDM,doMap = F)
parsRDM[1:5] <- c(log(3),1,.4,log(.75),log(.2))
datRDM <- make_data(parsRDM, designRDM, data = datLBA)

# * LNR ====
designLNR <- design(data=datLBA,model = LNR,
                    matchfun = function(d) d$S == d$lR,
                    formula = list(m ~ lM, s ~ lM, t0 ~ 1),
                    contrasts=list(lM=ADmat)
)

parsLNR <- sampled_p_vector(designLNR,doMap = F)
parsLNR[1:5] <- c(log(.75),log(.65),log(.5),log(.8),log(.4))
datLNR <- make_data(parsLNR, designLNR, data = datLBA)

# Simulation ----

type = c("upper", "lower", "both")
modeltype = c("LBA", "LNR", "RDM")
missing = c("", "M")
responseknown = c("known", "unknown")
level = c(2, 10, 30, 50)

cases <- expand.grid(
  missing = missing,
  modeltype = modeltype,
  type = type,
  level = level,
  response_known = responseknown
)

run_txt <- "library(EMC2)
load(\"./01_simulation/censoring_both/EMCs/s%1$s%2$s%3$s%4$s%5$s.RData\")
s <- fit(s, fileName = \"./01_simulation/censoring_both/tmp_files/tmps%1$s%2$s%3$s%4$s%5$s.RData\")
save(s, file = \"./01_simulation/censoring_both/EMCs/s%1$s%2$s%3$s%4$s%5$s.RData\")"

form <- list(
  "LBA" = list(B ~ 1, v ~ lM, A ~ 1, sv ~ lM, t0 ~ 1),
  "RDM" = list(B ~ 1, v ~ lM, s ~ lM, t0 ~ 1),
  "LNR" = list(m ~ lM, s ~ lM, t0 ~ 1),
  "MLBA" = list(B ~ 1, v ~ lM, A ~ 1, sv ~ lM, t0 ~ 1, pContaminant ~ 1),
  "MRDM" = list(B ~ 1, v ~ lM, s ~ lM, t0 ~ 1, pContaminant ~ 1),
  "MLNR" = list(m ~ lM, s ~ lM, t0 ~ 1, pContaminant ~ 1)
)

constants <- list(
  "LBA" = c(sv = 0),
  "RDM" = c(s = 0),
  "LNR" = NULL,
  "MLBA" = c(sv = 0, pContaminant = qnorm(0)),
  "MRDM" = c(s = 0, pContaminant = qnorm(0)),
  "MLNR" = c(pContaminant = qnorm(0))
)

params <- list(
  "LBA" = c(log(2),3,1,log(2),log(.75),log(.2)),
  "RDM" = c(log(3),1,.4,log(.75),log(.2)),
  "LNR" = c(log(.75),log(.65),log(.5),log(.8),log(.4))
)

for (i in 1:nrow(cases)) {
  run_file <- sprintf(run_txt, cases[i,1], cases[i,2], cases[i,3], cases[i,4],
                      cases[i,5])

  file_name <- sprintf(
    "./01_simulation/censoring_both/run_files/run%1$s%2$s%3$s%4$s%5$s.R",
    cases[i,1], cases[i,2], cases[i,3], cases[i,4], cases[i,5]
  )

  write(run_file, file = file_name)

  dat <- get(paste0("dat", cases[i,2]))

  model_design <- design(
    data = dat,
    model = get(paste0(cases[i,1], cases[i,2])),
    matchfun = function(d) d$S == d$lR,
    formula = form[[ paste0(cases[i,1], cases[i,2]) ]],
    constants = constants[[ paste0(cases[i,1], cases[i,2]) ]],
    contrasts = list(lM=ADmat)
  )

  if (cases[i,3] == "lower") {
    LC = unname(quantile(dat$rt, cases[i,4] / 100))
    UC = NULL
  } else if (cases[i,3] == "upper") {
    LC = NULL
    UC = unname(quantile(dat$rt, 1 - cases[i,4] / 100))
  } else {
    LC = unname(quantile(dat$rt, cases[i,4] / 200))
    UC = unname(quantile(dat$rt, 1 - cases[i,4] / 200))
  }

  if (cases[i,5] == "unknown") {
    LCresponse <- UCresponse <- FALSE
  } else {
    LCresponse <- UCresponse <- TRUE
  }

  pars <- sampled_p_vector(model_design, doMap = F)
  pars[1:length(pars)] <- params[[ cases[i,2] ]]
  datcensor <- make_data(pars, model_design, data = dat, LC = LC, UC = UC,
                         LCresponse = LCresponse, UCresponse = UCresponse)

  s_file_name <- sprintf(
    "./01_simulation/censoring_both/EMCs/s%1$s%2$s%3$s%4$s%5$s.RData",
    cases[i,1], cases[i,2], cases[i,3], cases[i,4], cases[i,5]
  )
  s <- make_emc(datcensor, model_design)
  save(s, file = s_file_name)
}
