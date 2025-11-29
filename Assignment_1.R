#Assignment 1

#Q1
A <- 23.4
B <- 45
C <- 678

A
B
C

#ls() command like in linux, prints the list structure
#which are the variables in memory of our R runtime
ls()
#ls() returns a list of variable names, we can get the values using either
#mget() or by manual loop
mget(ls())
for(var in ls()){
  print(var)
  print(get(var))
}

#R manages data types automatically
get("A")

#get function takes a string of variable name and gets its value from the memory

#Now remove the variable C and then display the list
remove(C)
ls()
mget(ls())

firstname <- "Rehnoor"
lastname <- "Aulakh"

firstname
lastname

#variable that can hold 0 or 1
flag <- FALSE
flag2 <- TRUE

as.numeric(flag)

D=A+B
D
E= A*B
E

exp(1)

log(exp(1))

pi

sqrt(16)

5^6