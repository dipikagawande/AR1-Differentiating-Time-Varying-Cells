
#' **Install packages**
#'---------------------------------------------

library(readxl)
library(tidyverse)


#' **Store file names of raw data**
#'---------------------------------------------

filenames <- c("MT220412_AllSpk_WT_K189_K326",
              "MT220819_AllSpk_WT_K189_K326",
              "MT220412_SelSpk_WT_K189_K326",
              "MT220819_SelSpk_WT_K189_K326")


#' **For each file, merge sheets**
#'---------------------------------------------

for (file in filenames) {
  
  ## Convert each sheet to a data_frame
  sheet <- excel_sheets(paste0("i. Raw Data/", file, ".xlsx"))
  ## Apply sheet names to data frame names
  data_frame <- 
    lapply(setNames(sheet, sheet), 
           function(x) read_excel(paste0("i. Raw Data/", file, ".xlsx"), 
                                  sheet = x))
  ## Append all data frames together
  data_frame <- data.frame(bind_rows(data_frame, .id = "Sheet"))
  ## Set ID column name as Cell.Type
  names(data_frame)[1] <- "Cell.Type"
  
  ## Save this file as a data frame in the global environment
  assign(file, data_frame, envir = .GlobalEnv)
}

#' **Outsheet each merged dataframe as csv**
#'---------------------------------------------

## Outsheet each file to the Working Data folder as a csv 
write.csv(MT220412_AllSpk_WT_K189_K326, 
          file = ("ii. Working Data/AllSpikes_LongStim_Merged.csv"), 
          row.names = FALSE)
write.csv(MT220819_AllSpk_WT_K189_K326, 
          file = ("ii. Working Data/AllSpikes_ShortStim_Merged.csv"), 
          row.names = FALSE)
write.csv(MT220412_SelSpk_WT_K189_K326, 
          file = ("ii. Working Data/SelSpikes_LongStim_Merged.csv"), 
          row.names = FALSE)
write.csv(MT220819_SelSpk_WT_K189_K326, 
          file = ("ii. Working Data/SelSpikes_ShortStim_Merged.csv"), 
          row.names = FALSE)

## EOF
