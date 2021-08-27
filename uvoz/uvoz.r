# 2. faza: Uvoz

library(tidyr)
library(readr)
library(dplyr)
library(rvest)
library(tidyverse)
library(stringr)

#Tabela 1: Notranje selitve po regijah

selitve_po_regijah <- read.csv("podatki/selitve_po_regijah.csv", skip = 2, 
                               header = TRUE, na.string = "-", fileEncoding = "Windows-1250", 
                               encoding = "UT-8")


selitve_po_regijah <- selitve_po_regijah%>%
  pivot_longer(cols = -1, 
               names_to = c('leto', 'regija_priselitve'), 
               names_sep = "\\.v\\.")

colnames(selitve_po_regijah) <- c("regija_odselitve", "leto", "regija_priselitve", "stevilo_preseljencev")

index <- is.na(selitve_po_regijah)
selitve_po_regijah[index] <- 0

selitve_po_regijah$leto <- str_replace(selitve_po_regijah$leto, "X", " ")

selitve_po_regijah$regija_odselitve <- str_replace(selitve_po_regijah$regija_odselitve, "iz", " ")

selitve_po_regijah$regija_odselitve <- str_replace(selitve_po_regijah$regija_odselitve, "Pomurske", "Pomurska")
selitve_po_regijah$regija_odselitve <- str_replace(selitve_po_regijah$regija_odselitve, "Podravske", "Podravska")
selitve_po_regijah$regija_odselitve <- str_replace(selitve_po_regijah$regija_odselitve, "Koroške", "Koroška")
selitve_po_regijah$regija_odselitve <- str_replace(selitve_po_regijah$regija_odselitve, "Savinjske", "Savinjska")
selitve_po_regijah$regija_odselitve <- str_replace(selitve_po_regijah$regija_odselitve, "Zasavske", "Zasavska")
selitve_po_regijah$regija_odselitve <- str_replace(selitve_po_regijah$regija_odselitve, "Posavske", "Posavska")
selitve_po_regijah$regija_odselitve <- str_replace(selitve_po_regijah$regija_odselitve, "Jugovzhodne Slovenije", "Jugovzhodna Slovenija")
selitve_po_regijah$regija_odselitve <- str_replace(selitve_po_regijah$regija_odselitve, "Osrednjeslovenske", "Osrednjeslovenska")
selitve_po_regijah$regija_odselitve <- str_replace(selitve_po_regijah$regija_odselitve, "Gorenjske", "Gorenjska")
selitve_po_regijah$regija_odselitve <- str_replace(selitve_po_regijah$regija_odselitve, "Primorsko-notranjske", "Primorsko-notranjska")
selitve_po_regijah$regija_odselitve <- str_replace(selitve_po_regijah$regija_odselitve, "Goriške", "Goriška")
selitve_po_regijah$regija_odselitve <- str_replace(selitve_po_regijah$regija_odselitve, "Obalno-kraške", "Obalno-kraška")

selitve_po_regijah$regija_priselitve <- str_replace(selitve_po_regijah$regija_priselitve, "Pomursko", "Pomurska")
selitve_po_regijah$regija_priselitve <- str_replace(selitve_po_regijah$regija_priselitve, "Podravsko", "Podravska")
selitve_po_regijah$regija_priselitve <- str_replace(selitve_po_regijah$regija_priselitve, "Koroško", "Koroška")
selitve_po_regijah$regija_priselitve <- str_replace(selitve_po_regijah$regija_priselitve, "Savinjsko", "Savinjska")
selitve_po_regijah$regija_priselitve <- str_replace(selitve_po_regijah$regija_priselitve, "Zasavsko", "Zasavska")
selitve_po_regijah$regija_priselitve <- str_replace(selitve_po_regijah$regija_priselitve, "Posavsko", "Posavska")
selitve_po_regijah$regija_priselitve <- str_replace(selitve_po_regijah$regija_priselitve, "Jugovzhodno.Slovenijo", "Jugovzhodna Slovenija")
selitve_po_regijah$regija_priselitve <- str_replace(selitve_po_regijah$regija_priselitve, "Osrednjeslovensko", "Osrednjeslovenska")
selitve_po_regijah$regija_priselitve <- str_replace(selitve_po_regijah$regija_priselitve, "Gorenjsko", "Gorenjska")
selitve_po_regijah$regija_priselitve <- str_replace(selitve_po_regijah$regija_priselitve, "Primorsko.notranjsko", "Primorsko-notranjska")
selitve_po_regijah$regija_priselitve <- str_replace(selitve_po_regijah$regija_priselitve, "Goriško", "Goriška")
selitve_po_regijah$regija_priselitve <- str_replace(selitve_po_regijah$regija_priselitve, "Obalno.kraško", "Obalno-kraška")



#Tabela 2: Notranje selitve po starostnih skupinah

selitve_po_starostnih_skupinah <- read.csv("podatki/selitve_po_starostnih_skupinah.csv", 
                                           header = TRUE, skip = 2)

colnames(selitve_po_starostnih_skupinah) <- c("starostna_skupina", 2000:2020)

selitve_po_starostnih_skupinah <- selitve_po_starostnih_skupinah %>% pivot_longer(-1, names_to="leto", values_to ="stevilo_selitev")

selitve_po_starostnih_skupinah$starostna_skupina <- str_replace(selitve_po_starostnih_skupinah$starostna_skupina, "let", " ")

#Tabela 3: Stanovanjske razmere

stanovanjske_razmere <- read.csv("podatki/stanovanjske_razmere.csv",
                                 header = TRUE, skip = 2, sep =",", fileEncoding = "Windows-1250", encoding = "UT-8")

stanovanjske_razmere <- stanovanjske_razmere%>%
  pivot_longer(cols = -1, 
               names_to = c('leto', 'kakovost_stanovanja'), 
               names_sep = "\\.v\\.")

colnames(stanovanjske_razmere) <- c("regija", "leto", "kakovost_stanovanja", "stevilo_stanovanj")

stanovanjske_razmere <- separate(stanovanjske_razmere, col = leto, into = c("leto", "kakovost_stanovanja"))

stanovanjske_razmere$leto <- str_replace(stanovanjske_razmere$leto, "X", " ")

stanovanjske_razmere$kakovost_stanovanja <- str_replace(stanovanjske_razmere$kakovost_stanovanja, "Slabo", "Slabo stanje stanovanja")
stanovanjske_razmere$kakovost_stanovanja <- str_replace(stanovanjske_razmere$kakovost_stanovanja, "Ni", "Ni primernega ogrevanja")
stanovanjske_razmere$kakovost_stanovanja <- str_replace(stanovanjske_razmere$kakovost_stanovanja, "Premalo", "Premalo svetlobe")
stanovanjske_razmere$kakovost_stanovanja <- str_replace(stanovanjske_razmere$kakovost_stanovanja, "Težave", "Težave s hrupom")
stanovanjske_razmere$kakovost_stanovanja <- str_replace(stanovanjske_razmere$kakovost_stanovanja, "Onesnaženost", "Onesnaženost okolja")
stanovanjske_razmere$kakovost_stanovanja <- str_replace(stanovanjske_razmere$kakovost_stanovanja, "Prisotnost", "Prisotnost kriminala")

#Tabela 4: Stanovanjski stroški

stanovanjski_stroski <- read.csv("podatki/stanovanjski_stroski.csv", 
                                 header = TRUE, skip = 2, sep =",", fileEncoding = "Windows-1250", encoding = "UT-8")

stanovanjski_stroski <- stanovanjski_stroski%>%
  pivot_longer(cols = -1, 
               names_to = c('leto', 'breme_stroskov'), 
               names_sep = "\\.v\\.")

colnames(stanovanjski_stroski) <- c("regija", "leto", "breme_stroskov", "stevilo_gospodinjstev")

stanovanjski_stroski <- separate(stanovanjski_stroski, col = leto, into = c("leto", "breme_stroskov"))

stanovanjski_stroski$leto <- str_replace(stanovanjski_stroski$leto, "X", " ")

stanovanjski_stroski$breme_stroskov <- str_replace(stanovanjski_stroski$breme_stroskov, "Niso", "Nizko")

