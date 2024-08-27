library(EMC2)
load("./01_simulation/censoring_both/EMCs/sMLNRupper30unknown.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsMLNRupper30unknown.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sMLNRupper30unknown.RData")
