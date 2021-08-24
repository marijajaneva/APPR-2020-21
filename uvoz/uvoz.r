# 2. faza: Uvoz

library(tidyr)
library(readr)
library(dplyr)
library(rvest)
library(tidyverse)


#Tabela 1: Notranje selitve po regijah

selitve_po_regijah <- read.csv("podatki/selitve_po_regijah.csv", skip = 2, 
                               header = TRUE, na.string = "-", fileEncoding = "Windows-1250", 
                               encoding = "UT-8")

colnames(selitve_po_regijah) <- c("regija_odselitve", "regija_priselitve", "leto")

gather(selitve_po_regijah, "leto", "stevilo_odselitev")

#Tabela 2: Notranje selitve po starostnih skupinah

selitve_po_starostnih_skupinah <- read.csv("podatki/selitve_po_starostnih_skupinah.csv", 
                                           header = TRUE, skip = 2)

colnames(selitve_po_starostnih_skupinah) <- c("starostna_skupina", 2000:2020)

selitve_po_starostnih_skupinah <- selitve_po_starostnih_skupinah %>% pivot_longer(-1, names_to="leto", values_to ="stevilo_selitev")

#Tabela 3: Stanovanjske razmere

stanovanjske_razmere <- read.csv("podatki/stanovanjske_razmere.csv",
                                 header = TRUE, skip = 2, sep =",", fileEncoding = "Windows-1250", encoding = "UT-8")

#Tabela 4: Stanovanjski stroški

stanovanjski_stroski <- read.csv("podatki/stanovanjski_stroski.csv", 
                                 header = TRUE, skip = 2, sep =",", fileEncoding = "Windows-1250", encoding = "UT-8")

