library(dplyr)

files <- c("UK_1891", "OY_1891", "AG_1891", "HN_1891", "LL_1891") # nolint
master_df <- data.frame()

# loop through all the files
for (filename in files) {
  print(filename)
  # read in from file
  county_dat <- read.delim(filename)

  # filtering what we need
  filtered <- county_dat %>%
    select(CenYear, Country, RegCnty, AdminCnty, Sex, Age, Cage, Cond, Occ, Occode) %>%    # nolint
    rename(RegCounty = RegCnty, AdmCounty = AdminCnty, Year= CenYear, MarStatus = Cond)    # nolint

  # save filtered to local rds
  saveRDS(filtered, file = paste0(filename, "_filtered.rds"))

  # append to master_df
  master_df <- rbind(master_df, filtered)
}

# saving to local rds in data folder
saveRDS(master_df, file = "data_1901.rds")
print("Done!")