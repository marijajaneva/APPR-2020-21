# 3. faza: Vizualizacija podatkov

graf_po_starostnih_skupinah <- ggplot(selitve_po_starostnih_skupinah %>% filter(starostna_skupina == "20-24")) + aes(x=leto, y=stevilo, group=starostnaskupina)+ geom_point() + geom_line() + theme(panel.grid.major.y =element_line(color="red"))



