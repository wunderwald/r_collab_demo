# install packages if this is important
library(tidyverse)
library(readxl)

df <- read_xlsx("HRV_a.xlsx")

df_2 <- read_xlsx("HRV_b.xlsx")

# TODO: calculate summary stats for IBI series

# TODO: plot IBI series