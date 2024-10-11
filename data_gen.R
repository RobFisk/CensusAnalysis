library(dplyr)

files <- c("EngAG_1921_filtered", "EngHN_1921_filtered", "EngLL_1921_filtered", "EngOY_1921_filtered", "EngYY_1921_filtered", "RoUK_1921_filtered") # nolint
master_df <- data.frame()

# loop through all the files
for (filename in files) {
  print(filename)
  # read in from file
  county_dat <- readRDS(filename)

  # filtering what we need
  #filtered <- county_dat %>%
  #  select(CenYear, Country, RegCnty, AdminCnty, Sex, Age, Cage, Cond, Occ, Occode) %>%    # nolint
  #  rename(RegCounty = RegCnty, AdmCounty = AdminCnty, Year= CenYear, MarStatus = Cond)    # nolint

  # append to master_df
  master_df <- rbind(master_df, filtered)
}

# saving to local rds
saveRDS(master_df, file = "data.rds")