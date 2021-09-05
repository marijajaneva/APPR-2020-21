# 4. faza: Analiza podatkov

#LINEARNA REGRESIJA

#Linearen model za skupno število stanovanj s slabo kakovostjo v odvisnosti od leta

podatki <- stanovanjske_razmere %>% group_by(leto)  %>% 
  summarize(stanovanja_skupno = sum(stevilo_stanovanj))
podatki$leto <- as.numeric(podatki$leto)
fit <- lm(stanovanja_skupno ~ leto , data=podatki)


graf <- ggplot(podatki, aes(x = leto, y = stanovanja_skupno)) + 
  geom_point() + geom_smooth(method=lm, se=FALSE) + 
  labs(x = "Leto" , y = "SKupno število stanovanj" , title = "Ponazoritev premice linearne regresije - \n skupno število stanovanj v odvisnosti od leta")

predict(fit, data.frame(leto =c(2021, 2022)))





