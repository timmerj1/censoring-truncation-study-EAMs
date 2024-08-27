library(EMC2)
load("./01_simulation/censoring_both/EMCs/sLNRupper30unknown.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsLNRupper30unknown.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sLNRupper30unknown.RData")
