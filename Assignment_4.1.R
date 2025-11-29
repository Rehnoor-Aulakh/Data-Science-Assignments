#Assignment 4.1

#Q1

patientId=1:4
AdmDate=c("10/15/2009","11/01/2009","10/21/2009","10/28/2009")
Age=c(25,34,28,52)
Diabetes=factor(c("Type1","Type2","Type1","Type1"))
Status=factor(c("Poor","Improved","Excellent","Poor"),levels=(c("Poor","Improved","Excellent")))
df= data.frame(patientId= patientId, AdmDate = AdmDate, Age=Age, Diabetes=Diabetes, Status=Status)

df

#Q2

Subset1 = df[c("patientId","Age")]
Subset1

subset1= df[df$Status=="Poor",c("patientId","Age")]
subset1

type1=df$Diabetes=="Type1"
df[type1,]

df[df$Diabetes=="Type1",]

#itentifying the type1 patients from df
#iterate over all patients
for(i in 1:nrow(df)){
  if(df$Diabetes[i]=="Type1"){
    print(df$patientId[i])
  }
}

subset(df,Status=="Poor", select = c("patientId","Age"))

#count the number of poor status patients
df$Status=="Poor"
poor.status= sum(df$Status=="Poor")
poor.status

summary(df)

#average age of patient having diabetes

mean(df$Age)

#adding new input from keyboard

new.patient= list()
#empty list to store new patient

new.patient$patientId= as.integer(readline("Enter Patient Id: "))
new.patient$AdmDate=readline("Enter Admission Date: ")
new.patient$Age = as.integer(readline("Enter Age: " ))
new.patient$Diabetes= readline("Enter Diabetes Type (Type 1/2)")
new.patient$Status = readline("Enter Status (Poor/Improved/Excellent)")

new.patient = as.data.frame(new.patient)
new.patient

df = rbind(df,new.patient)
df

summary(df)

#Q3

a=c(12,14,16,20)
m=matrix(1:5,nrow=5,ncol=1)
s=c("First","Second","Third")
criteria = list(Age=a, Matrix=m, Score=s)
MyList = list(title = "My First List",criteria=criteria)
MyList

MyList$criteria

MyList$criteria$Age
