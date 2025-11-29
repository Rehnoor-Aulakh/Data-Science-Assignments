A=c(12, 13, 14, 15, 16)
A
B=sort(A)
C=sort(A,decreasing=TRUE)
row_names=c('1','2','3')
col_names=c('1','2','3','4')

M=matrix(data = 1:12, nrow=3,ncol=4,byrow = TRUE,dimnames = list(row_names,col_names))
M

#Combine A,B,C Row wise
RW=rbind(A,B,C)
CW=cbind(A,B,C)

#Find the 2 and 3 row element of RW
RW[c(2,3),]
#This means give me the 2nd and 3rd row of RW, with all the columns

#Find 1st and 4th column of CW
RW[,c(1,4)]
RW

RW[2,3]