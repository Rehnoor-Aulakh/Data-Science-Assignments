#Q1

vec= seq(from =1.3, to = 4.9, by=0.3)
vec

n= rep(c(1,2,3,4),times=5)
n

nvec= seq(from = 14, to =0, by= -2)
nvec

nnvec= rep(c(5,12,13,20), each=2)
nnvec

#Q2

df=iris
df

class(df)
cat("Number of observations is ",nrow(df))
ncol(df)
cols= ncol(df)
#find which feature is a factor
names(df)
for(i in names(df)){
  if(is.factor(df[[i]])){
    print(i)
  }
}

#So we have found that Species is a factor
unclass(df[["Species"]])

#it has 3 levels setosa, versicolor, virginica

#Q3

#for each type of species, find the mean and standard deviation
for(i in levels(df[["Species"]])){
  cat("Mean of Sepal Length for ",i," is ", mean(df$Sepal.Length[df$Species==i]),"\n")
  cat("SD of Sepal Length for ",i," is ", sd(df$Sepal.Length[df$Species==i]),"\n")
  cat("Mean of Sepal Width for ",i," is ", mean(df$Sepal.Width[df$Species==i]),"\n")
  cat("SD of Sepal Width for ",i," is ", sd(df$Sepal.Width[df$Species==i]),"\n")
  
}

#using aggregate function to find mean and sd of sepal width and sepal length


aggregate(cbind(iris$Sepal.Length,iris$Sepal.Width,iris$Petal.Length,iris$Petal.Width)~iris$Species,data=iris,FUN=mean)
aggregate(.~Species, data = iris,FUN= mean)

#this can be much more simplified and cleaned using tapply()

iris.class= df
iris.class

#add a new column in iris.class df called Calyx.Width
cal= c()

for(i in iris.class$Sepal.Length){
  #for each row, find the Sepal.Length
  print(i)
  if(i<5){
    cal= c(cal,c("short"))
  }else{
    cal = c(cal,c("long"))
  }
}

cal

#add this cal to iris.class
iris.class$Calyx.Width=cal

#This method is quite inefficient

#we can do it more easily

iris.class= df
iris.class$Calyx.Width=ifelse(df$Sepal.Length>5,"long","short")
iris.class

#or we can initialise length first
iris.class=df
Calyx.Width = character(length = nrow(iris.class))
for(i in 1:nrow(df)){
  if(df$Sepal.Length[i]<5){
      Calyx.Width[i]="short"
  }else{
    Calyx.Width[i]="long"
  }
}

iris.class$Calyx.Width=Calyx.Width
iris.class

#Q4

mtcars
#structure of mtcars
str(mtcars)
#column names
names(mtcars)
#select the cars whose cyl value is no smaller than 5
subset(mtcars, cyl>=5)

head(mtcars,n=10)

#Find all the cars matching Honda
grepl("Honda",rownames(mtcars))
subset(mtcars,grepl("Honda",rownames(mtcars)))
#even easier
mtcars[grepl("Honda",rownames(mtcars)),]
