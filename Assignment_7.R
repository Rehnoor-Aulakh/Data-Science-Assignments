#Q1

set.seed(123)

SUB1 = sample(40:100, 20, replace = TRUE)
SUB2 = sample(40:100, 20, replace = TRUE)
SUB3 = sample(40:100, 20, replace = TRUE)

MARKS = cbind(SUB1, SUB2, SUB3)

MARKS

#Now finding the total for every student, meaning apply sum over the rows

MARKS = cbind(MARKS, Total = rowSums(MARKS))

st.err = function(x){
  sd(x)/sqrt(length(x))
}

#find the standard error in sub1, sub2,sub3, so for column, we need to apply this function

apply(MARKS[,1:3], 2, st.err)

#add 0.25 bonus mark to each mark in sub1,sub2, sub3

inc = function(x){
  x=x+0.25
}


MARKS[,1:3]=apply(MARKS[,1:3], 2, inc)

#we need to find total again
MARKS[,4]=rowSums(MARKS[,1:3])

V1=as.vector((MARKS[,1]))
V2= as.vector(MARKS[,2])
V3= as.vector(MARKS[,3])

#Put these into list

my_list = list(V1,V2,V3)
lapply(my_list,sum)

TOTAL_SUM = sapply(my_list, sum)

#square of each value of marks in V1, V2, V3

square = function(x){
  x*x
}

compute_square = sapply(my_list, square)

#5

I = rep(c(1,2,3,4), each= 5)
MARKS= cbind(MARKS, I = I)

#now that they are divided into groups, let us use tapply to find mean() and sd() of sub1 based on index I
means= tapply(MARKS[,1], MARKS[,5], mean)
sds = tapply(MARKS[,1], MARKS[,5],sd)

#6

fun = function(x,y){
  x/y
}

mapply(fun, V1, V2)

#Practice on seatbelts dataset

df = Seatbelts

#apply function to find mean of every column

apply(df, 2, mean)

#apply function to find sd of all numeric columns

apply(df,2,sd)

# return the class of each column 

sapply(df,class)

# return the minimum value in every column
apply(df,2,min)

fun = function(x){
  sum(x>100)
}

sapply(df,fun)


