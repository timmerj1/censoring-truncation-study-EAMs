library(EMC2)
load("./01_simulation/censoring_both/EMCs/sLNRlower2known.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsLNRlower2known.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sLNRlower2known.RData")
