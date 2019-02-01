# Day_4
# Chapter 10
# Tidy data
# 1Feb 2019

load("data/SACTN_mangled.RData")

ggplot(SACTN1, aes(x = date, y = temp)) +
  geom_line(aes(colour = site, group = paste0(site, src))) +
  labs(x = "Date", y = "Temp")

SACTN2_tidy <- SACTN2 %>% 
  gather(DEA, KZNSB,SAWS, key = "src", value = "temp")


SACTN3_tidy <- SACTN3 %>% 
  spread(key = var, value = val)

SACTN4a_tidy <- SACTN4a %>% 
  separate(col = index, into = c("site", "src"), sep = "/ ")

SACTN4b_tidy <- SACTN4b %>% 
  # Here we use unite
  unite(year, month, day, col = "date", sep = "-")

SACTN4_tidy <- left_join(SACTN4a_tidy, SACTN4b_tidy)


