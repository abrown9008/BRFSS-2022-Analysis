## YRBSS 2021 Data Analysis ##

library(tidyverse)

## Read in the data ##

library(haven)

df <- read_sas('yrbs2021.sas7bdat')

## Create ID Variable ##

df <- df |>
  mutate(ID = row_number())

## Select Variables of Interest for Xiao, Romanelli, & Lindsey
## study replication ##

##### First Set: Diet ####

## Breakfast eating (Q76); fruits (Q69); fruit juices (Q68);
## vegetables (Q70-Q73); milk (Q75); water (Q91); soda (Q74) ##

diet <- df |>
  select(ID,Q68:Q76,Q91)

## Confirm coding for Q76 - Breakfast Eating ##

diet |>
  group_by(Q76) |>
  count()

## Recode Q76 into eating 0 days, eating less than
## everyday, and eating everyday ##

diet <- diet |>
  mutate(Breakfast = if_else(Q76 == 1, "0 Days",
                             if_else(Q76 == 8, "Everyday",
                                     if_else(Q76 %in% c(2:7),"Less than Everyday",NA))))

## Check ##

diet |>
  group_by(Breakfast) |>
  count()

#### Second Set: Physical Activities ####

## moderate and vigorous physical activity
## muscle-strengthening exercise
## Sports Team Participation ##

#### Third Set: Sleep ####

#### Fourth Set: Media Use ####

## television; computer/video games ##

df1 <- df |>
  select()