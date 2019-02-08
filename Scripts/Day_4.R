# Chapter 12
# Day 4
# 1 Feb 2019
# Final chapter

# load libraries
library(tidyverse)

load("data/SACTNmonthly_v4.0.RData")
SACTN <- SACTNmonthly_v4.0
rm(SACTNmonthly_v4.0)

SACTN_depth_mean <- SACTN %>% 
  group_by(depth) %>% 
  summarise(mean_temp = mean(temp, na.rm = TRUE),
            count = n())
SACTN_depth_mean

ggplot(data = SACTN_depth_mean, mapping = aes(x = depth, y = mean_temp)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE)

SACTN_30_years <- SACTN %>%
  group_by(site, src) %>%
  filter(n() > 360)

selected_sites <- c("Paternoster", "Oudekraal", "Muizenberg", "Humewood")

# Then calculate the statistics
SACTN %>% 
  filter(site %in% selected_sites) %>%
  group_by(site, src) %>% 
  summarise(mean_temp = mean(temp, na.rm = TRUE), 
            sd_temp = sd(temp, na.rm = TRUE))


SACTN %>% 
  filter(site == "Port Nolloth")

