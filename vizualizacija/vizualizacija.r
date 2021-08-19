# 3. faza: Vizualizacija podatkov

graf_selitve_po_starosti <- ggplot(selitve_po_starostnih_skupinah, aes(x=leto, y=starostna_skupina) + geom_line() + xlab("leto") + ylab("Starostna skupina"))



