#install.packages("tm")
#install.packages("fpc")
#install.packages("proxy")
library(proxy)
library(tm)
library(fpc)

#docsfolder <- file.path("D:\\KDD\\Rajesh_Assign2", "TotalSet")
#dir(docsfolder);

inputfile <-read.csv("D:\\KDD\\Rajesh_Assign2\\DocumentTermMatrix.csv");

#summary(inputfile)
#print(inputfile)

matrix<-data.matrix(inputfile)
#print(matrix)

ekcinput <- proxy::dist(matrix, method = "euclidean")
#print(ekcinput)

ckcinput <- proxy::dist(matrix, method = "cosine")
#print(ckcinput)

jkcinput  <- proxy::dist(matrix, method = "jaccard")
#print(jkcinput)
x <- as.matrix(jkcinput);
write.csv(x, file="jaccardmatrix.csv")
ekcoutput <-kmeans(ekcinput,centers=5)
ckcoutput <-kmeans(ckcinput,centers=5)
jkcoutput <-kmeans(jkcinput,centers=5)

print(ekcoutput)
#plotcluster(ekcinput, ekcoutput$cluster)

#print(ckcoutput)
#plotcluster(ckcinput, ckcoutput$cluster)

print(jkcoutput)
plotcluster(jkcinput, jkcoutput$cluster)



