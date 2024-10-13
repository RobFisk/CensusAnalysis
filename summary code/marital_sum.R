## file for creating age summaries from the data across years
# library(dplyr)

# read in the data
# fulldat <- readRDS("./CensusData.rds")
# print("reading complete")

# create summary of married percentage (# with "MARRIED" / # with "MARRIED" or "SINGLE") by regional county and year # nolint
marital_summaries <- fulldat %>%
  group_by(Year, RegCounty) %>%
  summarise(married = sum(grepl('MARRIED|MARIED', MarStatus)),
            total = sum(grepl('MARRIED|MARIED|SINGLE|ISNGLE|SNIGLE', MarStatus)), #nolint
            married_pct = married / total) %>%
  ungroup()

print(marital_summaries)
saveRDS(marital_summaries, "./Data/marriage_summaries.rds")