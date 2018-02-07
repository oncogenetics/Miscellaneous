# About -------------------------------------------------------------------
# Author: Tokhir Dadaev
# Date: 31/10/2013 - first commit
#       07/02/2018 - update
# Download Reactome pathways, seperate them into files per pathway. To be used
# for pseq.

# Workspace ---------------------------------------------------------------
#setwd("C:/Users/tdadaev/Desktop/reactome")

# Data --------------------------------------------------------------------
#get reactome file and unzip
download.file(url = "http://www.reactome.org/download/current/ReactomePathways.gmt.zip",
              destfile = "ReactomePathways.gmt.zip")
unzip(zipfile = "ReactomePathways.gmt.zip", files = "ReactomePathways.gmt")

r <- readLines("ReactomePathways.gmt")

# Output ------------------------------------------------------------------
# loop through rows, split on tab, write 1 file per 1 pathway(row)
for(i in seq(length(r))){
  # split by tab
  x <- unlist(strsplit(r[i],"\t"))
  # pathway name is on 1st item - use gsub to exclude nonalpanumeric characters
  pathname <- gsub(" ", "_", gsub("[^[:alnum:] ]", "", x[1]))
  # exclude 1,2 items - pathway name and pathway type
  x <- sort(as.matrix(x[c(-1, -2)]))
  # output to a file
  writeLines(x, paste0("REACTOME_", pathname, ".txt"))
}

# Tidy up -----------------------------------------------------------------
file.remove("ReactomePathways.gmt","ReactomePathways.gmt.zip")
