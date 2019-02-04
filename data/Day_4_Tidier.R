# Day4
# Tidy data 2.0
# 1 Feb 2019
# Amieroh Abrahams

# Load libraries
library(tidyverse)
library(lubridate)

library(tidyverse)
library(lubridate)

# Load the data from a .RData file
load("data/SACTNmonthly_v4.0.RData")
SACTN <- SACTNmonthly_v4.0
rm(SACTNmonthly_v4.0)

SACTN %>% 
  filter(site == "Amanzimtoti")

SACTN %>% 
  filter(site == "Pollock Beach", month(date) == 12 | month(date) == 1)

SACTN %>% 
  arrange(depth, temp)

SACTN %>% 
  arrange(desc(temp))

SACTN %>% 
  filter(site == "Humewood", year(date) == 1990)

# Select columns individually by name
try1 <- SACTN %>% 
  select(site, src, date, temp)

# Select all columns between site and temp like a sequence
try2 <- SACTN %>% 
  select(site:temp)

try3 <- SACTN %>% 
  select(-date, -depth)

try4 <- SACTN %>% 
  select(-(date:depth))

try5 <- SACTN %>% 
  mutate(kelvin = temp + 273.15) # Fix error in document # final plot remove error in document


SACTN %>% 
  summarise(mean_temp = mean(temp, na.rm = T),
            sd_temp = sd(temp, na.rm = T),
            min_temp = min(temp, na.rm = T),
            max_temp = max(temp, na.rm = T))







