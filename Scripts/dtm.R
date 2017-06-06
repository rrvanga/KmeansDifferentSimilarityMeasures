
library(proxy)
library(tm)
library(fpc)

setwd("D:\\KDD\\Rajesh_Assign2\\Totalset");

cname <- file.path("D:\\KDD\\Rajesh_Assign2" , "Totalset");

#dir(cname)

docs <- Corpus(DirSource(cname));
#docs <- Corpus(VectorSource(docs))
docs <- tm_map(docs, removePunctuation);
docs <- tm_map(docs, removeNumbers);
docs <- tm_map(docs, content_transformer(tolower)) ;
docs <- tm_map(docs, removeWords, stopwords("english")) ;
docs <- tm_map(docs, stripWhitespace);
doctermmat <- DocumentTermMatrix(docs)
m <- as.matrix(doctermmat)
dim(m)
write.csv(m, file="dtm.csv")



