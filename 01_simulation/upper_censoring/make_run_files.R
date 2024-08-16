
models <- c("LBA","RDM", "LNR")
missing <- c("", "M")
mm <- apply(expand.grid(missing, models),1, paste, collapse = "")
censor_levels <- c("70","90","975")
type <- apply(expand.grid(mm, censor_levels),1, paste, collapse = "")
fn <- paste0("./01_simulation/upper_censoring/run_files/run", type, ".R")

multiplelines <- "library(EMC2)
load(\"./01_simulation/upper_censoring/EMCs/s%1$s.RData\")
s%1$s <- fit(s%1$s, fileName = \"./01_simulation/upper_censoring/run_files/tmps%1$s.RData\")
save(s%1$s, file = \"./01_simulation/upper_censoring/EMCs/s%1$s.RData\")"

runs <- sprintf(multiplelines, type)

for (i in 1:length(type)) write(runs[i], fn[i])
