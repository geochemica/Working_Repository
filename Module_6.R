df<-file.choose()
dfread <- read.csv(df, sep = ",", header = TRUE, stringsAsFactors = FALSE)
# only print select columns
dfread[, c(1, 3, 4, 11, 12)]
str(dfread)
dfread[, 3]
dfread$name.last
str
dfread[3]
str(dfread[3])
dfread["name.last"]
str(dfread["name.last"])
dfread <- cbind(dfread, id = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 
                       17, 18, 19, 20))
dfread <- cbind(dfread, school = c("BU", "BU", "Harvard", "Harvard", "BU", "Boston College", 
                           "MIT", "BU", "BU", "UMASS Boston", "Harvard", "BU", "Boston College", "BU", 
                           "Harvard", "MIT", "Harvard", "BU", "UMASS Boston", "Harvard"))
dfread
new_dfread <- dfread[dfread$school == "BU", ]
new_dfread
new_dfread <- dfread[dfread$school == "BU", c("name.last", "name.first", "school")]
new_dfread