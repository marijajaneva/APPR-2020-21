# 3. faza: Vizualizacija podatkov

#Graf selitve po regijah
graf_selitve_po_regijah <- ggplot(selitve_po_regijah, aes(REGIJA.ODSELITVE, value)) + geom_point()
print(graf_selitve_po_regijah)

graf_priselitve <- ggplot(selitve_po_regijah, aes(regija_priselitve, value)) + geom_point()
print(graf_priselitve)


#Graf po starostnih skupinah

graf_po_starostnih_skupinah <- ggplot(selitve_po_starostnih_skupinah %>%filter(leto=="2000"), aes(starostna_skupina, stevilo_selitev)) + geom_point() + geom_line() 

print(graf_po_starostnih_skupinah)

#Graf stanovanjskih razmer

graf_stanovanjske_razmere <- ggplot(stanovanjske_razmere,
                                    aes(kakovost_stanovanja, value)) + geom_point() 
print(graf_stanovanjske_razmere)
