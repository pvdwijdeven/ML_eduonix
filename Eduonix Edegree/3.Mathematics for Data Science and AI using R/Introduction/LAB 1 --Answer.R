library(tidyverse)

data.mpg <- mpg

head(data.mpg)

data.mpg[1:6,]

data.mpg %>%
  filter(class == "compact") %>%
#  group_by(class) %>%
  summarise(avg.cty = mean(cty))


data.mpg.short <- data.mpg %>%
  group_by(manufacturer) %>%
  group_by(class,add=TRUE) %>%
  group_by(cyl,add=TRUE) %>%
  summarise(mean.hwy = mean(hwy)) %>%  
  mutate(hwy.per.cyl = mean.hwy / cyl)

data.mpg.2008 <- data.mpg %>%
  filter(year == "2008")

plot(x = data.mpg.2008$cty, y = data.mpg.2008$hwy, xlab = 'city miles per gallon', ylab = 'hiway miles per gallon',
     col = 'blue', main = 'city miles per gallon by highway miles per gallon (2008 cars)')

  