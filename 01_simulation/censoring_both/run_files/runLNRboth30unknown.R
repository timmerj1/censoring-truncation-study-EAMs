library(EMC2)
load("./01_simulation/censoring_both/EMCs/sLNRboth30unknown.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsLNRboth30unknown.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sLNRboth30unknown.RData")
