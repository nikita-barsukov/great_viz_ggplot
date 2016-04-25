require('dplyr')

gdp_per_capita = read.csv('datasets/gdp_per_capita_ppp.csv', 
                          dec = '.', 
                          na.strings = '..') %>%
  select(country = Country.Name, gdp_pc = X2013)
fertility = read.csv('datasets/fertility_rate.csv', 
                     dec = '.', 
                     na.strings = '..') %>%
  select(country = Country.Name, fertility = X2013..YR2013.)
population = read.csv('datasets/population.csv', 
                      dec = '.', 
                      na.strings = '..') %>%
  select(country = Country.Name, population = X2013)
metadata = read.csv('datasets/country_metadata.csv', na.strings = '') %>%
  select(country = Country.Name, region = Region)

ds = merge(gdp_per_capita, fertility, by='country') %>% 
  merge(population, by='country') %>%
  merge(metadata, by='country') %>%
  na.omit()