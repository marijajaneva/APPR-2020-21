# 3. faza: Vizualizacija podatkov

#Graf 
graf_selitve_po_regijah <- ggplot(selitve_po_regijah %>% filter(leto == "2000")) + aes(x = REGIJA.ODSELITVE, y = value, group=leto)
                                  

print(graf_selitve_po_regijah)


#Graf po starostnih skupinah

graf_po_starostnih_skupinah <- ggplot(selitve_po_starostnih_skupinah, aes(starostna_skupina, stevilo_selitev, leto == 2000))+ geom_point()


print(graf_po_starostnih_skupinah)


