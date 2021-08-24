# 3. faza: Vizualizacija podatkov

graf_po_starostnih_skupinah <- ggplot(selitve_po_starostnih_skupinah %>% filter(starostna_skupina == "20-22 let")) + aes(x=starostna_skupina, y=leto, group=stevilo_selitev)+ geom_point() + geom_line() + theme(panel.grid.major.y =element_line(color="red"))

print(graf_po_starostnih_skupinah)

