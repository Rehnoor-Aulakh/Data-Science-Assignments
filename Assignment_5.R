df= read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/daily-show-guests/daily_show_guests.csv")

df

#Q1
#printing the first 10 records
head(df,n=10)

#Q2
colnames(df)=c("year","job","date","category","guest_name")
df

#Q3 create a report having year,date,guest_name

new.df= subset(df,select=c("year","date","guest_name"))
write.csv(new.df, file="my_first_report.csv")

#Q4 use select() in dplyr to print all records except year

library("dplyr")

df %>%
  select(-year)

df %>%
  filter(job=="actor" & guest_name=="ABC")

#sort in order of date

df %>%
  arrange(date)

df %>%
  mutate(Experience= 2025-year) %>%
  write.csv("my_second.csv")

