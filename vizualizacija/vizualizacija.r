# 3. faza: Vizualizacija podatkov

plot(leto,starostna_skupina)

graf_selitve_po_starosti <- ggplot(selitve_po_starostnih_skupinah, aes(x=leto, y=starostna_skupina))

print(graf_selitve_po_starosti)

