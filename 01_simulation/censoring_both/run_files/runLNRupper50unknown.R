library(EMC2)
load("./01_simulation/censoring_both/EMCs/sLNRupper50unknown.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsLNRupper50unknown.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sLNRupper50unknown.RData")
