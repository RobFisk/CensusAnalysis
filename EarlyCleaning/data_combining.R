library(dplyr)

files <- c("data_1891.rds", "data_1901.rds", "data_1911.rds", "data_1921.rds") # nolint
master_df <- data.frame()

# loop through all the files
for (filename in files) {
  print(filename)
  # read in from file
  year_dat <- readRDS(filename)
  
  # append to master_df
  master_df <- rbind(master_df, year_dat)
}

# saving to local rds in data folder
saveRDS(master_df, file = "CensusData.rds")
print("Done!")