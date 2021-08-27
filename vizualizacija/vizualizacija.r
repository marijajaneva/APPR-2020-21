# 3. faza: Vizualizacija podatkov

#Graf selitve po regijah
graf_selitve_po_regijah <- ggplot(selitve_po_regijah,
                                  aes(regija_odselitve, stevilo_preseljencev)) + geom_point()
print(graf_selitve_po_regijah)

graf_priselitve <- ggplot(selitve_po_regijah, aes(regija_priselitve, stevilo_preseljencev)) + geom_point()
print(graf_priselitve)


#Graf po starostnih skupinah

graf_po_starostnih_skupinah <- ggplot(selitve_po_starostnih_skupinah %>%filter(leto=="2000"), aes(starostna_skupina, stevilo_selitev)) + geom_point() + geom_line() 

print(graf_po_starostnih_skupinah)

#Graf stanovanjskih razmer

graf_stanovanjske_razmere <- ggplot(stanovanjske_razmere, aes(kakovost_stanovanja, stevilo_stanovanj))
                                       + geom_point() 
print(graf_stanovanjske_razmere)

#Graf stanovanjskih stroškov

graf_stanovanjski_stroski <- ggplot (stanovanjski_stroski%>%filter(leto == "2020"),
                                     aes(breme_stroskov, stevilo_gospodinjstev))+geom_point()
print(graf_stanovanjski_stroski)

