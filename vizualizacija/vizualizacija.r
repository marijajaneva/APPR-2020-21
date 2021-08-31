# 3. faza: Vizualizacija podatkov

#Graf selitve po regijah
izseljeni <- selitve_po_regijah %>% group_by(regija_odselitve, leto) %>%
  
  summarize(izseljeni_sum = sum(stevilo_preseljencev))

graf_izseljencev <- ggplot(izseljeni, aes(leto, izseljeni_sum)) +
  geom_line(aes(group = regija_odselitve, colour = factor(regija_odselitve)))+
  theme(axis.text.x = element_text(angle = 90))+
  scale_color_discrete("Regija odselitve")+
  labs(title = "Graf notranjih selitev")+
  xlab("Leto")
  ylab("število izseljencev")


print(graf_izseljencev)

izseljeni <- selitve_po_regijah %>% group_by(regija_odselitve, leto) %>%
  
  summarize(izseljeni_sum = sum(stevilo_preseljencev))

leto2020 <- izseljeni[izseljeni$leto == "2020" , c(1,3)]

graf_iseljencev2020 <- ggplot(leto2020, aes(regija_odselitve, izseljeni_sum)) +
  geom_col()+
  theme(axis.text.x = element_text(angle = 90))+
  labs(title = "Graf notranjih selitev leta 2020")+
  xlab("Regija")+
  ylab("Število izseljencev")
  

print(graf_iseljencev2020)

priseljeni <- selitve_po_regijah %>% group_by(regija_priselitve, leto) %>%
  
  summarize(priseljeni_sum = sum(stevilo_preseljencev))

graf_priseljencev <- ggplot(priseljeni, aes(leto, priseljeni_sum)) +
  geom_line(aes(group=regija_priselitve, colour = factor(regija_priselitve)))+
  theme(axis.text.x = element_text(angle = 90))+
  scale_color_discrete("Regija priselitve")+
  labs(title = "Graf notranjih selitev")+
  xlab("Leto")+
  ylab("Število priseljencev")

print(graf_priseljencev)

#Graf po starostnih skupinah

#graf_starostna_skupina <- ggplot(data = selitve_po_starostnih_skupinah, aes(x=starostna_skupina,y=stevilo_selitev, color = leto)) + 
#  geom_point() + facet_grid(~leto)

#(graf_starostna_skupina)


starost <- selitve_po_starostnih_skupinah %>% group_by(starostna_skupina, leto) %>%
  
  summarize(starost_sum = sum(stevilo_selitev))

leto2000 <- starost[starost$leto == "2000", c(1:3)]

graf_starost2000 <- ggplot(leto2000, aes(starostna_skupina, starost_sum)) +
  geom_col() + labs(title = "Selitve po starostnih skupinah leta 2000")+
  xlab("Starostna skupina")+
  ylab("Število selitev") 
  
print(graf_starost2000)

leto2007 <- starost[starost$leto == "2007", c(1:3)]

graf_starost2007 <- ggplot(leto2007, aes(starostna_skupina, starost_sum)) +
  geom_col(color = "red") + labs(title = "Selitve po starostnih skupinah leta 2007") +
  xlab("Starostna skupina")+
  ylab("Število selitev")
  

print(graf_starost2007)

leto2008 <- starost[starost$leto == "2008", c(1:3)]

graf_starost2008 <- ggplot(leto2008, aes(starostna_skupina, starost_sum)) +
  geom_col(color = "blue") + labs(title = "Selitve po starostnih skupinah leta 2008")+
  xlab("Starostna skupina")+
  ylab("Število selitev")

print(graf_starost2008)


leto2020 <- starost[starost$leto == "2020", c(1:3)]

graf_starost2020 <- ggplot(leto2020, aes(starostna_skupina, starost_sum)) +
  geom_col() + labs(title = "Selitve po starostnih skupinah leta 2020")+
  xlab("Starostna skupina")+
  ylab("Število selitev")

print(graf_starost2020)

#Graf stanovanjskih razmer

razmere <- stanovanjske_razmere %>% group_by(regija, kakovost_stanovanja) %>%
  
  summarize(razmere_sum = sum(stevilo_stanovanj))

graf_stanovanjskih_razmer <- ggplot(razmere, aes(regija, razmere_sum)) +
  geom_line(aes(group = kakovost_stanovanja, colour = factor(kakovost_stanovanja)))+
  theme(axis.text.x = element_text(angle = 90))+
  scale_color_discrete("Kakovost stanovanja") +
  labs(title = "Kakovost stanovanja po regijah") +
  xlab("Regija")+
  ylab("Število stanovanj")


print(graf_stanovanjskih_razmer)


#Graf stanovanjskih stroškov

graf_stroski <- ggplot(stanovanjski_stroski, aes(x=leto,y=stevilo_gospodinjstev, fill=breme_stroskov))+
  geom_bar(stat="identity", position = "dodge") + 
  scale_color_discrete("Breme stroškov")+
  labs(title = "Kakšno breme prebivalcem predstavljajo stanovanjski stroški po letih")+
  xlab("Leto")+
  ylab("Število gospodinjstev")

print(graf_stroski)

#Zemljevid

zemljevid <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2.8/shp/SVN_adm_shp.zip",
                             "SVN_adm1", encoding = "UTF-8")

print(zemljevid)
