## file for creating age summaries from the data across years
#library(dplyr)

# read in the data
#fulldat <- readRDS("CensusData.rds")

# create age summaries for each census year, using 5 year gaps in age up to 90+
# including a seperate category for unknown ages (200+)
age_summaries <- fulldat %>%
  mutate(Age = ifelse(Age == "u", 200, as.numeric(Age))) %>%
  mutate(Age = ifelse(Age > 90, 90, Age)) %>%
  mutate(Age = cut(Age, breaks = c(0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 200, 10^10), labels = c("0-4", "5-9", "10-14", "15-19", "20-24", "25-29", "30-34", "35-39", "40-44", "45-49", "50-54", "55-59", "60-64", "65-69", "70-74", "75-79", "80-84", "85-89", "90+", "unknown"))) %>%
  group_by(Year, Age) %>%
  summarise(n = n()) %>%
  ungroup()

print(age_summaries)