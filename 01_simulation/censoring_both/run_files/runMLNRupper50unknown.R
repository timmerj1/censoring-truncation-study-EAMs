library(EMC2)
load("./01_simulation/censoring_both/EMCs/sMLNRupper50unknown.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsMLNRupper50unknown.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sMLNRupper50unknown.RData")
