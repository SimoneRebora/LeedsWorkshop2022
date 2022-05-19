## Convert_txt_to_Orange

# This script will convert the text file
# (hosted in the .txt file in the "corpora" folder)
# into a Orange corpus file
# Note: if there is more than one, it will take just the first

my_file <- list.files("corpora/", pattern = ".txt", full.names = T)

newfile <- "corpora/my_Orange_txt_corpus.tab"

my_text <- readLines(my_file[1])
my_text <- paste(my_text, collapse = " ")

cat("Title\tContent\nstring\tstring\n\tinclude=True\n\nMy text", "\t", gsub(pattern = "\t", replacement = " ", my_text), "\n", sep = "", file = newfile)
