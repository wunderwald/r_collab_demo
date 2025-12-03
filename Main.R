# install.packages("XLConnect")
library(XLConnect)


# reads IBI values from XLSX (one sheet, one column, no header)
parse_ibi <- function(path) {
  ibi <- readWorksheet(loadWorkbook(path),sheet=1, header=FALSE)
  colnames(ibi) <- c("IBI")
  return(ibi$IBI)
}

# parse IBI data
ibi_a <- parse_ibi("HRV_a.xlsx")
ibi_b <- parse_ibi("HRV_b.xlsx")



#read xlsx
library(readxl)

ibi_a <- read_excel("HRV_a.xlsx")
ibi_b <- read_excel("HRV_b.xlsx")

# TODO: calculate summary stats for IBI series


library(dplyr)
ibi_a <- ibi_a |> rename(var_a = '446')


# install.packages("psych")
library(psych)
describe(ibi_a$var_a)


ibi_b <- ibi_b |> rename(var_b = '510')

describe(ibi_b$var_b)



# TODO: plot IBI series

# Load packages 
packages <- c("ggplot2", "dplyr", "tidyverse")

# Install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

# Packages loading
invisible(lapply(packages, library, character.only = TRUE))

# Start plotting: ibi_a
ibi_a_plot <- ibi_a %>%
  rename(HRV = '446') %>%      # rename column
  mutate(time = row_number())  # time from row index

ggplot(ibi_a_plot, aes(x = time, y = HRV)) +
  geom_line() +
  geom_point() +
  theme_minimal() +
  labs(title = "Longitudinal HRV for Subject 446",
       x = "Time point in ms",
       y = "HRV")

# Start plotting: ibi_b
ibi_b_plot <- ibi_b %>%
  rename(HRV = '510') %>%      # rename column
  mutate(time = row_number())  # time from row index

ggplot(ibi_b_plot, aes(x = time, y = HRV)) +
  geom_line() +
  geom_point() +
  theme_minimal() +
  labs(title = "Longitudinal HRV for Subject 510",
       x = "Time point in ms",
       y = "HRV")


