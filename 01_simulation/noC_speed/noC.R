rm(list=ls())
# remotes::install_github("ampl-psych/EMC2-advanced",ref="dev_rename")
library(EMC2)

ADmat <- matrix(c(-1/2,1/2),ncol=1,dimnames=list(NULL,"d")); ADmat

# Standard models ----
# * LBA ====
designLBA <- design(
  factors = list(S = c("left", "right"),
                 subjects = "Jeroen"),
  Rlevels = c("left", "right"),
  model = LBA,
  matchfun = function(d) d$S == d$lR,
  formula = list(B ~ 1, v ~ lM, A ~ 1, sv ~ lM, t0 ~ 1),
  constants = c(sv = 0),
  contrasts=list(lM=ADmat)
)

parsLBA <- sampled_p_vector(designLBA,doMap = F)
parsLBA[1:6] <- c(log(2),3,1,log(2),log(.75),log(.2))
datLBA <- make_data(parsLBA, designLBA, n_trials = 10000)

designRDM <- design(data=datLBA,model = RDM,
                    matchfun = function(d) d$S == d$lR,
                    formula = list(B ~ 1, v ~ lM, s ~ lM, t0 ~ 1),
                    constants = c(s = 0),
                    contrasts=list(lM=ADmat)
)

parsRDM <- sampled_p_vector(designRDM,doMap = F)
parsRDM[1:5] <- c(log(3),1,.4,log(.75),log(.2))
datRDM <- make_data(parsRDM, designRDM, n_trials = 10000)

# * LNR ====
designLNR <- design(data=datLBA,model = LNR,
                    matchfun = function(d) d$S == d$lR,
                    formula = list(m ~ lM, s ~ lM, t0 ~ 1),
                    contrasts=list(lM=ADmat)
)

parsLNR <- sampled_p_vector(designLNR,doMap = F)
parsLNR[1:5] <- c(log(.75),log(.65),log(.5),log(.8),log(.4))
datLNR <- make_data(parsLNR, designLNR, n_trials = 10000)


# Missing noC ----
# * MLBA ====

designMLBA <- design(
  data = datLBA,
  model = MLBA,
  matchfun = function(d) d$S == d$lR,
  formula = list(B ~ 1, v ~ lM, A ~ 1, sv ~ lM, t0 ~ 1, pContaminant ~ 1),
  constants = c(sv = 0, pContaminant = qnorm(0)),
  contrasts=list(lM=ADmat)
)

designMLBAnoC <- design(
  data = datLBA,
  model = MLBAnoC,
  matchfun = function(d) d$S == d$lR,
  formula = list(B ~ 1, v ~ lM, A ~ 1, sv ~ lM, t0 ~ 1, pContaminant ~ 1),
  constants = c(sv = 0, pContaminant = qnorm(0)),
  contrasts=list(lM=ADmat)
)

parsMLBA <- sampled_p_vector(designMLBA,doMap = F)
parsMLBA[1:6] <- c(log(2),3,1,log(2),log(.75),log(.2))
UC <- quantile(datLBA$rt, 0.7)
datMLBA <- make_data(parsMLBA, designMLBA, n_trials = 10000, UC = unname(UC))

sMLBA <- make_emc(datMLBA, designMLBA, type = "single")
sMLBAnoC <- make_emc(datMLBA, designMLBAnoC, type = "single")
save(sMLBAnoC, sMLBA, file="01_simulation/noC_speed/EMCs/sMLBAnoC.RData")

system.time(EMC2::init_chains(sMLBA, cores_for_chains = 1))
system.time(EMC2::init_chains(sMLBAnoC, cores_for_chains = 1))

# * MRDM ====

designMRDM <- design(
  data = datRDM,
  model = MRDM,
  matchfun = function(d) d$S == d$lR,
  formula = list(B ~ 1, v ~ lM, s ~ lM, t0 ~ 1, pContaminant ~ 1),
  constants = c(s = 0, pContaminant = qnorm(0)),
  contrasts=list(lM=ADmat)
)

designMRDMnoC <- design(
  data = datRDM,
  model = MRDMnoC,
  matchfun = function(d) d$S == d$lR,
  formula = list(B ~ 1, v ~ lM, s ~ lM, t0 ~ 1, pContaminant ~ 1),
  constants = c(s = 0, pContaminant = qnorm(0)),
  contrasts=list(lM=ADmat)
)

parsMRDM <- sampled_p_vector(designMRDM,doMap = F)
parsMRDM[1:5] <- c(log(3),1,.4,log(.75),log(.2))
UC <- quantile(datRDM$rt, 0.7)
datMRDM <- make_data(parsMRDM, designMRDM, n_trials = 10000, UC = unname(UC))

sMRDM <- make_emc(datMRDM, designMRDM, type = "single")
sMRDMnoC <- make_emc(datMRDM, designMRDMnoC, type = "single")
save(sMRDMnoC, sMRDM,file="01_simulation/noC_speed/EMCs/sMRDMnoC.RData")

system.time(EMC2::init_chains(sMRDM, cores_for_chains = 1))
system.time(EMC2::init_chains(sMRDMnoC, cores_for_chains = 1))

# MLNR ====

designMLNR <- design(
  data = datLNR,
  model = MLNR,
  matchfun = function(d) d$S == d$lR,
  formula = list(m ~ lM, s ~ lM, t0 ~ 1, pContaminant ~ 1),
  constants = c(pContaminant = qnorm(0)),
  contrasts=list(lM=ADmat)
)

designMLNRnoC <- design(
  data = datLNR,
  model = MLNRnoC,
  matchfun = function(d) d$S == d$lR,
  formula = list(m ~ lM, s ~ lM, t0 ~ 1, pContaminant ~ 1),
  constants = c(pContaminant = qnorm(0)),
  contrasts=list(lM=ADmat)
)

parsMLNR <- sampled_p_vector(designMLNR,doMap = F)
parsMLNR[1:5] <- c(log(.75),log(.65),log(.5),log(.8),log(.4))
UC <- quantile(datLNR$rt, 0.7)
datMLNR <- make_data(parsMLNR, designMLNR, n_trials = 10000, UC = unname(UC))

sMLNR <- make_emc(datMLNR, designMLNR, type = "single")
sMLNRnoC <- make_emc(datMLNR, designMLNRnoC, type = "single")
save(sMLNRnoC, sMLNR, file="01_simulation/noC_speed/EMCs/sMLNRnoC.RData")

system.time(EMC2::init_chains(sMLNR, cores_for_chains = 1))
system.time(EMC2::init_chains(sMLNRnoC, cores_for_chains = 1))
