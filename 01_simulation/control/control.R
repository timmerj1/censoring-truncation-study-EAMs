rm(list = ls())
# remotes::install_github("timmerj1/EMC2-advanced",ref="dev_rename_jeroen")
library(EMC2)

ADmat <- matrix(c(-1/2,1/2),ncol=1,dimnames=list(NULL,"d")); ADmat

n_trials_small = 200
n_samples_small = 10
n_trials_large = 10000
n_samples_large = 1

# Standard models ----
# * LBA ====
designLBA_small <- design(
  factors = list(S = c("left", "right"),
                 subjects = 1:n_samples_small),
  Rlevels = c("left", "right"),
  model = LBA,
  matchfun = function(d) d$S == d$lR,
  formula = list(B ~ 1, v ~ lM, A ~ 1, sv ~ lM, t0 ~ 1),
  constants = c(sv = 0),
  contrasts=list(lM=ADmat)
)

designLBA_large <- design(
  factors = list(S = c("left", "right"),
                 subjects = 1:n_samples_large),
  Rlevels = c("left", "right"),
  model = LBA,
  matchfun = function(d) d$S == d$lR,
  formula = list(B ~ 1, v ~ lM, A ~ 1, sv ~ lM, t0 ~ 1),
  constants = c(sv = 0),
  contrasts=list(lM=ADmat)
)

parsLBA <- sampled_p_vector(designLBA,doMap = F)
parsLBA[1:6] <- c(log(2),3,1,log(2),log(.75),log(.2))
datLBA_small <- make_data(parsLBA, designLBA, n_trials = n_trials_small)
datLBA_large <- make_data(parsLBA, designLBA, n_trials = n_trials_small)

# * RDM ====

designRDM_small <- designRDM_large <-
  design(data=datLBA,model = RDM,
         matchfun = function(d) d$S == d$lR,
         formula = list(B ~ 1, v ~ lM, s ~ lM, t0 ~ 1),
         constants = c(s = 0),
         contrasts=list(lM=ADmat)
  )

parsRDM <- sampled_p_vector(designRDM,doMap = F)
parsRDM[1:5] <- c(log(3),1,.4,log(.75),log(.2))
datRDM_large <- make_data(parsRDM, designRDM, data = datLBA_large)
datRDM_small <- make_data(parsRDM, designRDM, data = datLBA_small)

# * LNR ====
designLNR_small <- designLNR_large <-
  design(data=datLBA,model = LNR,
         matchfun = function(d) d$S == d$lR,
         formula = list(m ~ lM, s ~ lM, t0 ~ 1),
         contrasts=list(lM=ADmat)
  )

parsLNR <- sampled_p_vector(designLNR,doMap = F)
parsLNR[1:5] <- c(log(.75),log(.65),log(.5),log(.8),log(.4))
datLNR_large <- make_data(parsLNR, designLNR, data = datLBA_large)
datLNR_small <- make_data(parsLNR, designLNR, data = datLBA_small)

# Simulation ----

run_txt <- "library(EMC2)
load(\"./01_simulation/control/EMCs/s%1$s_%2$s.RData\")
s <- fit(s, fileName = \"./01_simulation/control/tmp_files/tmps%1$s_%2$s.RData\")
save(s, file = \"./01_simulation/control/EMCs/out%1$s_%2$s.RData\")"


cases <- expand.grid(
  model = c("LBA", "LNR", "RDM"),
  size = c("large", "small")
)

run_files <- sprintf(run_txt, cases[,1], cases[,2])

file_names <- sprintf(
  "./01_simulation/control/run_files/run%1$s_%2$s.R",
  cases[,1], cases[,2]
)

s_file_names <- sprintf(
  "./01_simulation/control/EMCs/s%1$s_%2$s.Rdata",
  cases[,1], cases[,2]
)

for (i in 1:nrow(cases)) {
  write(run_files[i], file = file_names[i])
  make_emc(get(paste0("dat", as.character(cases[i,1]), "_", cases[i,2])),
           get(paste0("design", as.character(cases[i,1]), "_", cases[i,2])),
           type = "single")
  save(s, file = s_file_names[i])
}
