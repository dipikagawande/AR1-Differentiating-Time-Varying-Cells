
## Install packages
library(qpdf)


#' **Split the Main Report**
#'---------------------------------------------

## Front of Main Report
pdf_subset(input = "iv. PDF Knits/2. Report_Main.pdf",
           pages = 1:9,
           output = "iv. PDF Knits/2a. Report_Main_Front.pdf")
## End of Main Report
pdf_subset(input = "iv. PDF Knits/2. Report_Main.pdf",
           pages = 10:12,
           output = "iv. PDF Knits/2b. Report_Main_End.pdf")


#' **Merge Results into Main Report**
#'---------------------------------------------

pdf_combine(c("iv. PDF Knits/2a. Report_Main_Front.pdf",
              "iv. PDF Knits/3. AllSpikesLongStim_DG.pdf",
              "iv. PDF Knits/4. AllSpikesShortStim_SC.pdf",
              "iv. PDF Knits/5. SelSpikesLongStim_JZ.pdf",
              "iv. PDF Knits/6. SelSpikesShortStim_TR.pdf",
              "iv. PDF Knits/2b. Report_Main_End.pdf"),
            output = "FINAL REPORT.pdf")

#' **Merge Appendix Files**
#'---------------------------------------------

pdf_combine(c("iv. PDF Knits/7. Appendix_Title.pdf", 
              "iv. PDF Knits/8. Appendix_DG_v2.pdf",
              "iv. PDF Knits/9. Appendix_SC.pdf",
              "iv. PDF Knits/10. Appendix_JZ.pdf",
              "iv. PDF Knits/11. Appendix_TR.pdf"),
            output = "FINAL APPENDIX.pdf")

## EOF