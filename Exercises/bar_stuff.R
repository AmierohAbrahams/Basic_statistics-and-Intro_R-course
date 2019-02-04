df <- data.frame(dose=c("D0.5", "D1", "D2"),
                 len=c(4.2, 10, 29.5))

p<-ggplot(data=df, aes(x=dose, y=len)) +
  geom_bar(stat="identity")
p

# stats = identity: takes actual numbers in the dataframe
# stats = bin : count of cases

p<-ggplot(data=df, aes(x=dose)) +
  geom_bar(stat="count")
p


library(tidyverse)

??geom_bar
