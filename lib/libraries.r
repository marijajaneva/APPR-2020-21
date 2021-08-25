library(knitr)
library(rvest)
library(gsubfn)
library(tidyr)
library(tmap)
library(shiny)
library(readr)
library(dplyr)
library(tidyverse)

#Tabela 1: Notranje selitve po regijah

selitve_po_regijah <- read.csv("podatki/selitve_po_regijah.csv", 
                               skip = 2, sep =",")


#Tabela 2: Notranje selitve po starostnih skupinah

selitve_po_starostnih_skupinah <- read.csv("podatki/selitve_po_starostnih_skupinah.csv", 
                                           header = TRUE, skip = 2, sep = ",")

selitve_starost <- c("leto","starostna_skupina")

leto <- c("2000","2002","2004","2005","2006","2008","2009","2011",
          "2012","2013","2014","2015","2016","2017","2018","2019","2020")

starostna_skupina <- c("0-4","5-9","10-14","15-19","20-24","25-29","30-34","35-39","40-49",
                       "50-54","55-59","60-64","65-69","70-74","75-79","80-84","85+")
#Tabela 3: Stanovanjske razmere

stanovanjske_razmere <- read.csv("podatki/stanovanjske_razmere.csv",
                                 header = TRUE, skip = 2, sep = ",")

#Tabela 4: Stanovanjski stroški

stanovanjski_stroski <- read.csv("podatki/stanovanjski_stroski.csv", 
                                 header = TRUE, skip = 2, sep =",")

