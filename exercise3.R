# Open the data in R an view it
# What do we see in the dataset that is unusual?
# How would you improve this dataset?
# Did you notice now why keeping a good, neat spreadsheet is good habit

# Load the libraries
library(tidyverse)
library(lubridate)
library(ggpubr)

# This could be done in excel prior to loading in the data
# So for those of you who are not comfortable with R, you are most welcome to
# fix things in excel and prepare it better, making things easier to analyse in R
# In the exam (QE) 
# Especially now that you guys are learning stick to a format similar to the datasets in the INTRO_R course
# Half the code already exist and can be manipulated easily to fit your data
# Also creates less of a panic and stress
# If you guys are unsure how to load in data do it this way....click on the dataset in the files pane
egg <- read_delim("data/YearlyEggBreadths.csv", ";", escape_double = FALSE, trim_ws = TRUE)

# Here we create a clean dataframe. removed all the unwanted rows and words
new_egg <- egg %>%
  slice(1:12) %>% 
  mutate(months = c(1:12)) # Here we add in a month column

# Creating a plot
# Which function do we use to create plots?
# Marks are assigned not only to the outcome of the graph but using the appropriate functions,
# Writing neat code, having comments and trying different things other than the question also adds in your fav.
# Like simple functions whee you explore the data, cut and paste it from old scripts even, try different things
# This adds to the marks, so even though you may not get the actual question, you are scoring the bonus marks.

## Plotting with ggplot
ggplot(new_egg, aes(x = month)) +
  geom_path(aes(y = AveragesMinBreadth1)) +
  geom_path(aes(y = AveragesMinBreadth2), colour = "orange") +
  geom_errorbar(aes(ymax = AveragesMinBreadth1 + as.numeric(StdDevMinBreadth1),
                    ymin = AveragesMinBreadth1 - as.numeric(StdDevMinBreadth1)), width = 0.1) +
  geom_errorbar(aes(ymax = AveragesMinBreadth2 + as.numeric(StdDevMinBreadth2),
                    ymin = AveragesMinBreadth2 - as.numeric(StdDevMinBreadth2)), width = 0.1, colour = "orange") +
  scale_x_continuous(breaks = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12), labels = c("Jan", "Feb", "Mar", 
                                                                                   "Apr", "May", "Jun", "
                                                                                   Jul","Aug", "Sepr", 
                                                                                   "Oct", "Nov", "Dec"))+
  scale_y_continuous(breaks = c(10, 20, 30, 40, 50, 60, 70),
                     labels = c("10", "20", "30", "40","50", "60", "70"))
  
  
                    




