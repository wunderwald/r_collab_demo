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

# TODO: calculate summary stats for IBI series

# TODO: plot IBI series
t <- 1:min(length(ibi_a), length(ibi_b))

plot(t, ibi_a[t], type = "l", col = "blue", lwd = 2, xlab = "Beat index", ylab = "IBI (ms)", main = "Two IBI Signals")
lines(t, ibi_b[t], col = "red", lwd = 2)
