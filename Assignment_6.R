library("dplyr")

#Q1
df=read.csv("continent_data.csv")
df

#1 how many unique countries per continent- we need to group by continent and find count of unique countries

df %>%
  group_by(Continent) %>%
  distinct(Country) %>%
  summarise(unique_c= n())
  
#Q2 which european nation had the lowest gdp per year

#filter european, group by year, find min of gdp

df %>%
  filter(Continent=="Europe") %>%
  group_by(Year) %>%
  summarise(min_gdp = min(gdpPerc_K))

#3 what is the average life expectancy across each continent in a given year
#group by continent,year, summarise avg

df %>%
  group_by(Continent, Year) %>%
  summarise(avg_life_exp= mean(LifeExp))

#4 what 5 countries have highest gdp over all the years combines
#find the total gdp per country and then arrange in descending order and pick 5 rows

df %>%
  group_by(Country) %>%
  summarise(total_gdp = sum(gdpPerc_K,na.rm=TRUE)) %>%
  arrange(desc(total_gdp)) %>%
  slice(1:5)

#5 what countries and years had life expectancy of at least 80 years

df %>%
  filter(LifeExp>=80) %>%
  select(Country,Year,LifeExp)
  
#6 what countries have strongest correlation between life exp and per capita gdp

df %>%
  group_by(Country) %>%
  summarise(corr= abs(cor(LifeExp,gdpPerc_K))) %>%
  slice_max(corr, n=10)

#7 which continent have highest average population 
#filter continent!=Asia, group_by continent, summarise the avg population, arrange

df %>%
  filter(Continent!="Asia") %>%
  group_by(Continent,Year) %>%
  summarise(avg_pop=mean(Pop_M)) %>%
  arrange(desc(avg_pop))
  
#8 which 3 countries have the lowest sd of population across the years
# group by country, find the sd, arrange

df %>%
  group_by(Country) %>%
  summarise(ans=sd(Pop_M)) %>%
  slice_min(ans,n=3)
  
#9 

df %>%
  arrange(Country,Year) %>%
  group_by(Country) %>%
  mutate(prev_pop = lag(Pop_M), prev_life= lag(LifeExp)) %>%
  #now apply the condition
  filter(Pop_M<prev_pop & LifeExp>prev_life)



#--------------------------------------------------------------------------------------------------------------



#Q2 Medical Stock dataset
#1 creating the dataset
MedID <- 1:10

Med_Name <- c(
  "Paracetamol", "Ibuprofen", "Cetirizine", "Amoxicillin", "Azithromycin",
  "Metformin", "Aspirin", "Omeprazole", "Vitamin C", "Cough Syrup"
)

Company <- c(
  "Cipla", "Sun Pharma", "Dr Reddy", "Abbott", "Pfizer",
  "Cipla", "Bayer", "Sun Pharma", "Himalaya", "Dabur"
)

Manf_year <- c(2021, 2020, 2021, 2019, 2022, 2020, 2018, 2021, 2023, 2022)

Exp_date <- c(
  "2025-12-31", "2024-06-30", "2025-01-15", "2023-12-31", "2026-03-20",
  "2024-10-10", "2023-05-30", "2025-03-01", "2026-12-31", "2024-09-09"
)

Quantity_in_stock <- c(150, 80, 200, 50, 120, 300, 90, 180, 500, 75)

Sales <- c(1200, 800, 1500, 600, 2000, 2500, 900, 1600, 5000, 700)

medicine<- data.frame(MedID, Med_Name, Company,Manf_year, Exp_date, Quantity_in_stock, Sales)
medicine

#save to csv
write.csv(medicine, "DataSet.csv",row.names=FALSE)

#2 read the dataset and show the first 4 records

df = read.csv("DataSet.csv")
head(df,n=4)
tail(df,n=4)

#4 find the correlation between the Quantity_in_stock and Exp_date
#date is in characters, so first need to convert it to numeric date

df$Exp_date = as.Date(df$Exp_date)

#now to get numeric value, us as.numeric, you will get the number of days since 1970

df$Exp_num = as.numeric(df$Exp_date)
df

#now let us find the correlation

cor(df$Quantity_in_stock, df$Exp_num)

#5 Plot the bar graph for the Sales with year of manufacturing

barplot(df$Sales,names.arg= df$Manf_year, xlab = "Manufacturing Year", ylab= "Sales", col = "skyblue", main= "Sales vs Manufacturing Year")

#6 Find the company having more than one type of medicine

df %>% 
  group_by(Company) %>%
  #n() counts number of rows per group
  summarise(count_meds = n()) %>%
  filter(count_meds>1)

#even shorter version

df %>%
  count(Company) %>%
  filter(n > 1)

df %>%
  distinct(Med_Name)

#8 find which medicines are expiring
# first we need to sort in descending according to date

expiry = df %>%
  arrange(Exp_date) %>%
  filter(Exp_date<as.Date("2025-11-15"))
  #now draw the box plot

boxplot(Exp_date ~ Med_Name, data = expiry,
          main = "Expiry Dates by Medicine",
          xlab = "Medicine",
          ylab = "Expiry Date (numeric)",
          col = "lightblue",
          las = 2)

library(ggplot2)

ggplot(expiry, aes(x = Med_Name, y = Exp_date)) +
  geom_boxplot(fill = "skyblue") +
  labs(title = "Expiry Dates by Medicine",
       x = "Medicine",
       y = "Expiry Date") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#9 average stock in the store
mean(df$Quantity_in_stock)

#10 regression line between manufacturing year and sales

linearModel = lm(df$Sales ~ df$Manf_year)
plot(df$Manf_year, df$Sales)
abline(linearModel,lwd=2)
predicted = predict(linearModel)
