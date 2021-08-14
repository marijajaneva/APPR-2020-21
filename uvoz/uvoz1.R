# 2. faza: Uvoz

library(tidyr)
library(readr)
library(dplyr)
library(rvest)
library(tidyverse)


#Tabela 1: Notranje selitve po regijah

selitve_po_regijah <- read.csv("podatki/selitve_po regijah.csv", 
                               skip = 2, sep =",",
                               locale = locale(encoding="Windows-1250"))



#Tabela 2: Notranje selitve po starostnih skupinah

selitve_po_starostnih_skupinah <- read.csv2("podatki/selitve_po starostnih skupinah.csv",
                                            header = TRUE, skip = 2, sep = ",",
                                            locale=locale(encoding="Windows-1250"))

