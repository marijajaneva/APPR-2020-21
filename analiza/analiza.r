# 4. faza: Analiza podatkov

#LINEARNA REGRESIJA

#Linearen model med stanovanjskimi razmerami in regije izselitve
fit <- lm(stevilo_stanovanj ~ kakovost_stanovanja , data=stanovanjske_razmere)
summary(fit)
graf <- ggplot(stanovanjske_razmere, aes(x = kakovost_stanovanja  , y = stanovanjske_razmere$stevilo_stanovanj)) + 
  geom_point() + 
  geom_smooth(method=lm, se=FALSE) + labs(x = "Kakovost stanovanja", y = "Število stanovanj v slabem stanju", fill = NULL)


print(graf)

