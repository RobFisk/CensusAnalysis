library(dplyr)

filename <- "data_2021"

# read in from file
county_dat <- read.delim(filename)

# filtering what we need
filtered <- county_dat %>%
  select(CenYear, Country, RegCnty, AdminCnty, Sex, Age, Cage, Cond, Occ, Occode) %>%    # nolint
  rename(RegCounty = RegCnty, AdmCounty = AdminCnty, Year= CenYear, MarStatus = Cond)    # nolint

saveRDS(filtered, file = "tester_2021")