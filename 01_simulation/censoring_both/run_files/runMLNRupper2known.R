library(EMC2)
load("./01_simulation/censoring_both/EMCs/sMLNRupper2known.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsMLNRupper2known.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sMLNRupper2known.RData")
