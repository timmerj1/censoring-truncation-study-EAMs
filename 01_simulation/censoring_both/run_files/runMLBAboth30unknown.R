library(EMC2)
load("./01_simulation/censoring_both/EMCs/sMLBAboth30unknown.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsMLBAboth30unknown.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sMLBAboth30unknown.RData")
