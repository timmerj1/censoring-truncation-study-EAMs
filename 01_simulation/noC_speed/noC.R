rm(list=ls())
# remotes::install_github("ampl-psych/EMC2-advanced",ref="dev_rename")
library(EMC2)

ADmat <- matrix(c(-1/2,1/2),ncol=1,dimnames=list(NULL,"d")); ADmat

dat <-

# MLBA ----

designMLBA <- design(
  factors = list(S = c("left", "right"),
                 subjects = "Jeroen"),
  Rlevels = c("left", "right"),
  model = MLBAnoC,
  matchfun = function(d) d$S == d$lR,
  formula = list(B ~ 1, v ~ lM, A ~ 1, sv ~ lM, t0 ~ 1, pContaminant ~ 1),
  constants = c(sv = 0, pContaminant = qnorm(0)),
  contrasts=list(lM=ADmat)
)

parsMLBA <- sampled_p_vector(designMLBA,doMap = F)
parsMLBA[1:6] <- c(log(2),3,1,log(2),log(.75),log(.2))
datMLBA <- make_data(parsMLBA, designMLBA, n_trials = 10000)
UC <- quantile(datMLBA$rt, 0.7)
datMLBA$rt[datMLBA$rt > UC] <- Inf
attr(datMLBA, "UC") <- unname(UC)

sMLBAnoC <- make_emc(datMLBA, designMLBA)
save(sMLBAnoC,file="01_simulation/noC_speed/EMCs/sMLBAnoC.RData")

# MRDM ----

designMRDM <- design(
  factors = list(S = c("left", "right"),
                 subjects = "Jeroen"),
  Rlevels = c("left", "right"),
  model = MRDMnoC,
  matchfun = function(d) d$S == d$lR,
  formula = list(B ~ 1, v ~ lM, s ~ lM, t0 ~ 1, pContaminant ~ 1),
  constants = c(s = 0, pContaminant = qnorm(0)),
  contrasts=list(lM=ADmat)
)

parsMRDM <- sampled_p_vector(designMRDM,doMap = F)
parsMRDM[1:5] <- c(log(3),1,.4,log(.75),log(.2))
datMRDM <- make_data(parsMRDM, designMRDM, n_trials = 10000)
UC <- quantile(datMRDM$rt, 0.7)
datMRDM$rt[datMRDM$rt > UC] <- Inf
attr(datMRDM, "UC") <- unname(UC)

sMRDMnoC <- make_emc(datMRDM, designMRDM)
save(sMRDMnoC,file="01_simulation/noC_speed/EMCs/sMRDMnoC.RData")

# MLNR ----

designMLNR <- design(
  factors = list(S = c("left", "right"),
                 subjects = "Jeroen"),
  Rlevels = c("left", "right"),
  model = MLNRnoC,
  matchfun = function(d) d$S == d$lR,
  formula = list(m ~ lM, s ~ lM, t0 ~ 1, pContaminant ~ 1),
  constants = c(pContaminant = qnorm(0)),
  contrasts=list(lM=ADmat)
)

parsMLNR <- sampled_p_vector(designMLNR,doMap = F)
parsMLNR[1:5] <- c(log(.75),log(.65),log(.5),log(.8),log(.4))
datMLNR <- make_data(parsMLNR, designMLNR, n_trials = 10000)
UC <- quantile(datMLNR$rt, 0.7)
datMLNR$rt[datMLNR$rt > UC] <- Inf
attr(datMLNR, "UC") <- unname(UC)

sMLNRnoC <- make_emc(datMLNR, designMLNR)
save(sMLNRnoC,file="01_simulation/noC_speed/EMCs/sMLNRnoC.RData")
