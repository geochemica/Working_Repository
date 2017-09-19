rm(list=ls())
#I can't clear the variables#
f <- "~/Desktop/CPDS-1960-2014-reduced.txt"
d <- read.table(f, header = TRUE, sep = "\t", stringsAsFactors = FALSE)
d
head(d)  # lists the first 6 lines of data
#It's saying that head(d): object 'd' not found
tail(d)  # shows the last 6 lines of data
#It's saying that head(d): object 'd' not found
class(d)  # shows that tables are typically loaded as data frames
d <- read.delim(f, header = TRUE, stringsAsFactors = FALSE)
head(d)

f <- "~/Desktop/CPDS-1960-2014-reduced.csv"
d <- read.table(f, header = TRUE, sep = ",", stringsAsFactors = FALSE)
head(d)
#again it's still saying that it cannot locate object 'd'
d <- read.csv(f, header = TRUE, stringsAsFactors = FALSE)
head(d)
#same error message agin about not finding object 'd'
f <- "~/Desktop/CPDS-1960-2014-reduced.txt"
d <- read_tsv(f, col_names = TRUE)  # for tab-separated files
#The files are on the desktop so I don't understand what's wrong. Do I need to change the file path?#
head(d)
class(d)
d <- read_delim(f, delim = "\t", col_names = TRUE)
head(d)
require(readr)
f <- "~/Desktop/CPDS-1960-2014-reduced.csv"
d <- read_csv(f, col_names = TRUE)  # for comma-separated files
#The error message about not being able to locate object 'd' continues#
head(d)
d <- read_delim(f, delim = ",", col_names = TRUE)
head(d)
#I DON'T HAVE EXCEL, DO I NEED IT FOR THIS CLASS OR CAN I CONVERT IT?#
#SO I WON'T BE ABLE TO DO THE XLCONNECT PORTION EITHER#

library(curl)
f <- curl("https://raw.githubusercontent.com/fuzzyatelin/fuzzyatelin.github.io/master/AN597_Fall17/CPDS-1960-2014-reduced.csv")
d <- read.csv(f, header = TRUE, sep = ",", stringsAsFactors = FALSE)
head(d)
f <- curl("https://raw.githubusercontent.com/fuzzyatelin/fuzzyatelin.github.io/master/AN597_Fall17/CPDS-1960-2014-reduced.txt")
d <- read.table(f, header = TRUE, sep = "\t", stringsAsFactors = FALSE)
head(d)
library(readr)
f <- "https://raw.githubusercontent.com/fuzzyatelin/fuzzyatelin.github.io/master/AN597_Fall17/CPDS-1960-2014-reduced.csv"
d <- read_csv(f, col_names = TRUE)
head(d)
f <- "https://raw.githubusercontent.com/fuzzyatelin/fuzzyatelin.github.io/master/AN597_Fall17/CPDS-1960-2014-reduced.txt"
d <- read_tsv(f, col_names = TRUE)
head(d)


require(rdrop2)
drop_auth()  # opens a browser dialog box to ask for authorization...
drop_dir()  # lists the contents of your dropbox folder
f <- "CPDS-1960-2014-reduced.csv"  # name of the file to read from
f <- drop_search(f)  # searches your dropbox directory for file or directory names; this can be slow
f <- f$path  # $path is the location of the results returned above
d <- drop_read_csv(f, header = TRUE, sep = ",", stringsAsFactors = FALSE)
head(d)
str(d)
link <- "https://www.dropbox.com/s/hft09jnpjepy1a1/CPDS-1960-2014-reduced.csv?dl=0"
link <- gsub(pattern = "dl=0", replacement = "dl=1", x = link)
d <- read.csv(link, header = TRUE, sep = ",", stringsAsFactors = FALSE)
head(d)
str(d)

require(repmis)
d <- source_data(link, header = TRUE, sep = ",")
head(d)
str(d)
#This one did not work and the error message says "Unknown reply."

require(googlesheets)
gs_ls()  # gives you the option to log in to a google sheets account and see options for download
get_title("CPDS-1960-2014-reduced")  # shows you worksheets from the file to which you have access
d <- gs_read("CPDS-1960-2014-reduced")
head(d)
#This one also came up with the unknown reply message#

filename <- "CPDS-1960-2014-reduced.csv"  # name of file to download
f <- drop_search(filename)  # searches your dropbox directory for that file or directory name
f <- f$path  # $path is the location of the results returned above
drop_get(f, local_file = paste0("~/Desktop/", filename), overwrite = TRUE, progress = TRUE)
# this will save the file to the desktop

filename <- "CPDS-1960-2014-reduced.xlsx"
f <- drop_search(filename)  # searches your dropbox directory for file or directory names
f <- f$path  # $path is the location of the results returned above
drop_get(f, local_file = paste0("~/Desktop/", filename), overwrite = TRUE, progress = TRUE)
# again, saves to the desktop

gs_title("CPDS-1960-2014-reduced")  #identifies the sheet you wish to download
gs_download("CPDS-1960-2014-reduced", to = "CPDS-1960-2014-reduced.xlsx")
# in this case, should save to your working directory
str(d)