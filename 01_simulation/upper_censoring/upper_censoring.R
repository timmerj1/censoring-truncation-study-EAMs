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
plot_defective_density(datLBA)

# sLBA <- make_emc(datLBA,designLBA,type="single")
# save(sLBA,file="01_simulation/upper_censoring/EMCs/sLBA.RData")

# * RDM ====

designRDM <- design(data=datLBA,model = RDM,
                    matchfun = function(d) d$S == d$lR,
                    formula = list(B ~ 1, v ~ lM, s ~ lM, t0 ~ 1),
                    constants = c(s = 0),
                    contrasts=list(lM=ADmat)
)

parsRDM <- sampled_p_vector(designRDM,doMap = F)
parsRDM[1:5] <- c(log(3),1,.4,log(.75),log(.2))
datRDM <- make_data(parsRDM, designRDM, n_trials = 10000)
plot_defective_density(datRDM)

# * LNR ====
designLNR <- design(data=datLBA,model = LNR,
                    matchfun = function(d) d$S == d$lR,
                    formula = list(m ~ lM, s ~ lM, t0 ~ 1),
                    contrasts=list(lM=ADmat)
)

# sLNR <- make_emc(datLBA,designLNR,type="single")
# save(sLNR,file="01_simulation/upper_censoring/sLNR.RData")
#
# load("sLNR.RData")
# exp(posterior_summary(sLNR)[[1]][,2])

parsLNR <- sampled_p_vector(designLNR,doMap = F)
parsLNR[1:5] <- c(log(.75),log(.65),log(.5),log(.8),log(.4))
datLNR <- make_data(parsLNR, designLNR, n_trials = 10000)
plot_defective_density(datLNR)


#### Upper Censored data for simulation

qLBA <- quantile(datLBA$rt,probs=c(.7,.9,.975))
datLBA975 <- make_data(parsLBA, designLBA, n_trials = 10000,UC=unname(qLBA[3]))
datLBA90 <- make_data(parsLBA, designLBA, n_trials = 10000,UC=unname(qLBA[2]))
datLBA70 <- make_data(parsLBA, designLBA, n_trials = 10000,UC=unname(qLBA[3]))

par(mfcol=c(2,3))
plot_defective_density(datLBA975,layout=NULL)
plot_defective_density(datLBA90,layout=NULL)
plot_defective_density(datLBA70,layout=NULL)

qRDM <- quantile(datRDM$rt,probs=c(.7,.9,.975))
datRDM975 <- make_data(parsRDM, designRDM, n_trials = 10000,UC=unname(qRDM[3]))
datRDM90 <- make_data(parsRDM, designRDM, n_trials = 10000,UC=unname(qRDM[2]))
datRDM70 <- make_data(parsRDM, designRDM, n_trials = 10000,UC=unname(qRDM[1]))

par(mfcol=c(2,3))
plot_defective_density(datRDM975,layout=NULL)
plot_defective_density(datRDM90,layout=NULL)
plot_defective_density(datRDM70,layout=NULL)

qLNR <- quantile(datLNR$rt,probs=c(.7,.9,.975))
datLNR975 <- make_data(parsLNR, designLNR, n_trials = 10000,UC=unname(qLNR[3]))
datLNR90 <- make_data(parsLNR, designLNR, n_trials = 10000,UC=unname(qLNR[2]))
datLNR70 <- make_data(parsLNR, designLNR, n_trials = 10000,UC=unname(qLNR[1]))

par(mfcol=c(2,3))
plot_defective_density(datLNR975,layout=NULL)
plot_defective_density(datLNR90,layout=NULL)
plot_defective_density(datLNR70,layout=NULL)

sLBA975 <- make_emc(datLBA975,designLBA,type="single")
sLBA90 <- make_emc(datLBA90,designLBA,type="single")
sLBA70 <- make_emc(datLBA70,designLBA,type="single")

save(sLBA975,file="01_simulation/upper_censoring/EMCs/sLBA975.RData")
save(sLBA90,file="01_simulation/upper_censoring/EMCs/sLBA90.RData")
save(sLBA70,file="01_simulation/upper_censoring/EMCs/sLBA70.RData")

sRDM975 <- make_emc(datRDM975,designRDM,type="single")
sRDM90 <- make_emc(datRDM90,designRDM,type="single")
sRDM70 <- make_emc(datRDM70,designRDM,type="single")

save(sRDM975,file="01_simulation/upper_censoring/EMCs/sRDM975.RData")
save(sRDM90,file="01_simulation/upper_censoring/EMCs/sRDM90.RData")
save(sRDM70,file="01_simulation/upper_censoring/EMCs/sRDM70.RData")

sLNR975 <- make_emc(datLNR975,designLNR,type="single")
sLNR90 <- make_emc(datLNR90,designLNR,type="single")
sLNR70 <- make_emc(datLNR70,designLNR,type="single")

save(sLNR975,file="01_simulation/upper_censoring/EMCs/sLNR975.RData")
save(sLNR90,file="01_simulation/upper_censoring/EMCs/sLNR90.RData")
save(sLNR70,file="01_simulation/upper_censoring/EMCs/sLNR70.RData")

# plot_pars(sLNR)
# fitpar <- posterior_summary(sLNR)[[1]][,2]
# #     B B_Espeed        v    v_lMd    s_lMd       t0
# # 1.300   -0.472    1.250    0.505   -0.046   -1.573
# parsLNR <- sampled_p_vector(designLNR ,doMap = F)
# parsLNR[1:6] <- fitpar
# datLNR <- make_data(parsLNR, designLNR, n_trials = 1000)
# plot_defective_density(dat)
#
#
#
#
#
#
# load("sLNR.RData")
# check(sLNR)
#
# plot_pars(sLNR)
# fitpar <- posterior_summary(sLNR)[[1]][,2]
# #     m m_Espeed    m_lMd        s    s_lMd       t0
# # 0.151   -0.405   -0.383   -1.405   -0.293   -2.938
#
# parsLNR <- sampled_p_vector(designLNR ,doMap = F)
# parsLNR[1:6] <- c(log(.6),log(.6),log(1),log(.25),log(1.25),log(.2))
# datLNR <- make_data(parsLNR, designLNR, n_trials = 1000)
# plot_defective_density(datLNR)


#### Censoring models ----

# * MLBA ====
designMLBA <- design(
  factors = list(S = c("left", "right"),
                 subjects = "Jeroen"),
  Rlevels = c("left", "right"),
  model = MLBA,
  matchfun = function(d) d$S == d$lR,
  formula = list(B ~ 1, v ~ lM, A ~ 1, sv ~ lM, t0 ~ 1,pContaminant~1),
  constants = c(sv = 0),
  contrasts=list(lM=ADmat)
)

# parsMLBA <- sampled_p_vector(designMLBA,doMap = F)
# parsMLBA[1:7] <- c(log(3),log(.5),4,2,log(2),log(.75),log(.2),)
#
#
# dat <- make_data(parsMLBA, designMLBA, n_trials = 10000)
# plot_defective_density(dat)

# * MRDM ====
designMRDM <- design(data=datRDM,model = MRDM,
                     matchfun = function(d) d$S == d$lR,
                     formula = list(B ~ 1, v ~ lM, s ~ lM, t0 ~ 1,pContaminant~1),
                     constants = c(s = 0),
                     contrasts=list(lM=ADmat)
)

# sMRDM <- make_emc(dat,designMRDM,type="single")
# save(sMRDM,file="sMRDM.RData")
#
# load("sMRDM.RData")
# check(sMRDM)
#
# plot_pars(sMRDM)
# fitpar <- posterior_summary(sMRDM)[[1]][,2]
#
#
#
# parsMRDM <- sampled_p_vector(designMRDM ,doMap = F)
# parsMRDM[1:6] <- c(log(.6),log(.6),log(1),log(.25),log(1.25),log(.2))
# datMRDM <- make_data(parsMRDM, designMRDM, n_trials = 1000)
# plot_defective_density(dat)

# * MLNR ====
designMLNR <- design(data=datLNR,model = MLNR,
                     matchfun = function(d) d$S == d$lR,
                     formula = list(m ~ lM, s ~ lM, t0 ~ 1,pContaminant~1),
                     contrasts=list(lM=ADmat)
)

# sMLNR <- make_emc(dat,designMLNR,type="single")
# save(sMLNR,file="sMLNR.RData")
#
# load("sMLNR.RData")
# check(sMLNR)
#
# plot_pars(sMLNR)
# fitpar <- posterior_summary(sMLNR)[[1]][,2]
#
# parsMLNR <- sampled_p_vector(designMLNR ,doMap = F)
# parsMLNR[1:6] <- c(log(.6),log(.6),log(1),log(.25),log(1.25),log(.2))
# datMLNR <- make_data(parsMLNR, designMLNR, n_trials = 1000)
# plot_defective_density(datMLNR)

sMLBA975 <- make_emc(datLBA975,designMLBA,type="single")
sMLBA90 <- make_emc(datLBA90,designMLBA,type="single")
sMLBA70 <- make_emc(datLBA70,designMLBA,type="single")

save(sMLBA975,file="01_simulation/upper_censoring/EMCs/sMLBA975.RData")
save(sMLBA90,file="01_simulation/upper_censoring/EMCs/sMLBA90.RData")
save(sMLBA70,file="01_simulation/upper_censoring/EMCs/sMLBA70.RData")

sMRDM975 <- make_emc(datRDM975,designMRDM,type="single")
sMRDM90 <- make_emc(datRDM90,designMRDM,type="single")
sMRDM70 <- make_emc(datRDM70,designMRDM,type="single")

save(sMRDM975,file="01_simulation/upper_censoring/EMCs/sMRDM975.RData")
save(sMRDM90,file="01_simulation/upper_censoring/EMCs/sMRDM90.RData")
save(sMRDM70,file="01_simulation/upper_censoring/EMCs/sMRDM70.RData")

sMLNR975 <- make_emc(datLNR975,designMLNR,type="single")
sMLNR90 <- make_emc(datLNR90,designMLNR,type="single")
sMLNR70 <- make_emc(datLNR70,designMLNR,type="single")

save(sMLNR975,file="01_simulation/upper_censoring/EMCs/sMLNR975.RData")
save(sMLNR90,file="01_simulation/upper_censoring/EMCs/sMLNR90.RData")
save(sMLNR70,file="01_simulation/upper_censoring/EMCs/sMLNR70.RData")
