## Convert_to_Orange

# This script will convert the Goodreads reviews
# (hosted in the .csv files in the "corpora" folder)
# into a Orange corpus file

# only thing you need to do, is to
# define the language of your reviews
my_language <- "en"

# then you can run the rest of the script with no worries :)
install.packages("cld2")
library(cld2)

my_files <- list.files("corpora/", pattern = ".csv", full.names = T)

newfile <- "corpora/my_Orange_corpus.tab"

for(i in 1:length(my_files)){
  
  df <- read.csv(my_files[i], stringsAsFactors = F, row.names = 1)
  df <- df[which(!is.na(df$review)),]
  
  df$lang <- cld2::detect_language(df$review)
  df <- df[which(df$lang == my_language),]
  
  
  if(i == 1)
    cat("Book\tReview\tContent\ndiscrete\tstring\tstring\n\tinclude=True\n\n", file = newfile)
  
  for(n in 1:length(df$book))
    cat(df$book[n], "\t", paste("review", n, sep = "_"), "\t", gsub(pattern = "\n|\t", replacement = " ", df$review[n]), "\n", sep = "", file = newfile, append = T)
  
}