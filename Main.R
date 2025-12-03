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



library(readxl)
ibi_a <- read_excel("HRV_a.xlsx")
ibi_b <- read_excel("HRV_b.xlsx")

# TODO: calculate summary stats for IBI series

# TODO: plot IBI series