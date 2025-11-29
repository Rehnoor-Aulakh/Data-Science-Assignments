#dplyr practice

library(dplyr)

mtcars %>%
  filter(cyl==6) %>%
  select(mpg, cyl, hp) %>%
  arrange(desc(mpg))

iris %>% filter(Species == "setosa", Sepal.Length > 5)
iris %>% select(newName = Sepal.Length) 
iris %>% select(starts_with("Sepal"))   

#arrange first in descending order of hp, then for the same hp, arrange in ascending order of mpg
mtcars %>%
  arrange(desc(hp),mpg)

#mutate- to add/transform columns

mtcars %>%
  mutate(kmpl= mpg*0.425144)

mtcars %>% mutate(hp_per_wt = hp / wt)

#transmute- only returns new columns

mtcars %>% transmute(model = rownames(mtcars), hp_per_wt = hp/wt)

#group by and then summarise to print the mean of each specie and the number of rows of each specie using n()
iris %>%
  group_by(Species) %>% #aggregate
  summarise(meanSL = mean(Sepal.Length,na.rm=TRUE),n=n())

#count() for quick counting
mtcars
#count how many rows belong to each value of cyl
mtcars %>%
  count(cyl)
#after group_by, you have to use summarise
#same as this one
mtcars %>%
  group_by(cyl) %>%
  summarise(n=n())
mtcars %>% count(cyl, wt = gear) 

#distinct()- unique rows/values

df %>%
  distinct(patientId)

#how to rename columns
iris %>%
  rename(sepal_len= Sepal.Length)

#slice()/ slice_head()/ slice_max()- select rows by position or by top values

iris %>%
  slice(1:5)
#group by species first, and then find the top 2 Sepal length for each specie
iris %>%
  group_by(Species) %>%
  slice_max(Sepal.Length, n=2)




