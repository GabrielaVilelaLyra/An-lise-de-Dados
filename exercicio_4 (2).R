
## Fa�a todos os gr�ficos utilizando um tema que voc� ache mais adequado
## e nomeie os eixos x e y da maneira adequada

## Carregue o banco world do pacote poliscidata

library(poliscidata)

banco <- world

## Observe o banco de dados com as fun��es adequadas

glimpse(world)

?world

str(banco)

head(banco)

tail(banco)

summary(banco)

## A vari�vel democ_regime08 indica se um pa�s � democr�tico.
## Usando as ferramentas de manipulacao de bancos de dados, verifique
## quantos paises sao democraticos ou nao, e apresente esta vari�vel 
## graficamente

banco$democ_regime08

banco_democ <- banco %>%
  count(democ_regime08)

banco_democ


# 95 pa�ses s�o democr�ticos e 69 n�o-democr�ticos.


ggplot(banco, aes(democ_regime08)) +
  geom_bar()+
labs(title = "Pa�ses democr�ticos",
     x = "Regime democr�tico",
     y = "N�mero de casos")

## Teste a rela��o entre a vari�vel democ_regime08 e a vari�vel
## muslim (que indica se um pa�s � mu�ulmano ou n�o). E represente
## visualmente as vari�veis para visualizar se esta religi�o
## aumenta ou diminui a chance de um pa�s ser democr�tico
## Qual seria sua conclus�o com rela��o a associa��o destas duas
## vari�veis?

library(tidyverse)

banco <- world %>% filter(!is.na(democ_regime08),
                          !is.na(muslim), !is.na(gdppcap08))

banco$muslim

banco_recodificado <- banco %>%
  
  mutate(democ_regime08  = recode(democ_regime08,
                                  Yes = "Democr�ticos",
                                  No = "N�o-democr�ticos"), muslim  = recode(muslim,
                                                                             Yes = "Mu�ulmanos",
                                                                             No = "N�o-mu�ulmanos"))

tabela <- table(banco_recodificado$democ_regime08, banco_recodificado$muslim)


tabela

# n�o-mu�ulmanos e n�o-democr�ticos: 35 pa�ses
# democr�ticos e n�o-mu�ulmanos: 84 pa�ses
# mu�ulmanos e n�o-democr�ticos: 34 pa�ses
# mu�ulmanos e democr�ticos: 11 pa�ses


chisq.test(tabela)


library(graphics)

mosaicplot(tabela, shade = TRUE)


ggplot(banco_recodificado, aes(democ_regime08, fill = muslim)) +
  geom_bar(position = "fill") + 

# O resultado do teste Chi-quadrado indica grande probabilidade de associa��o entre as var�aveis, 
#pois possui valor alto para X^2, e um baixo p-valor, de modo que se pode afirmar ser uma rela��o 
#estatisticamente significante. Isso, no entanto, n�o � suficiente para afirmar a exist�ncia de uma
#rela��o forte entre as vari�veis, ou mesmo de uma rela��o causal.
# Pela an�lise da tabela e dos gr�ficos, � poss�vel observar que os pa�ses mu�ulmanos s�o,
#majoritatiamente, n�o-democr�ticos, ainda que n�o se possa apontar rela��o de causalidade.
  




## A vari�vel gdppcap08 possui informa��o sobre o PIB per capta
## dos pa�ses. Fa�a uma representa��o gr�fica desta vari�vel

banco$gdppcap08

library(scales)

ggplot(banco, aes(gdppcap08)) +
  geom_histogram() +
  labs(title = "PIB per capta",
       x = "Renda per capita",
       y = "N�mero de casos")

## Fa�a um sumario com a m�dia, mediana e desvio padr�o do pib per capta
## para cada tipo de regime politico, represente a associa��o destas
## vari�veis graficamente, e fa�a o teste estat�stico adequado para
## chegar a uma conclus�o. Existe associa��o entre as vari�veis?


tabela_2 <- banco_recodificado %>% 
  filter(!is.na(democ_regime08),
         !is.na(gdppcap08)) %>% group_by(democ_regime08) %>%
  summarise(media = mean(gdppcap08, na.rm = TRUE), 
            mediana = median(gdppcap08, na.rm = TRUE), 
            desvio_padrao = sd(gdppcap08, na.rm = TRUE))

tabela_2


ggplot(banco_recodificado, aes(gdppcap08, fill = democ_regime08)) +
  geom_density(alpha = 0.3)+
  labs(title = "Democracia x Desenvolvimento",
       subtitle = "Gr�fico de curva de densidade",
       x = "PIB per capita",
       y = "Regime Democr�tico")

ggplot(banco_recodificado, aes(democ_regime08, gdppcap08)) +
  geom_boxplot() + 
  labs(title = "Democracia x Desenvolvimento",
       x = "Regime Democr�tico",
       y = "PIB per capita")

ggplot(banco_recodificado, aes(democ_regime08, gdppcap08)) +
  geom_violin(draw_quantiles = c(0.25, 0.5, 0.75)) +
  labs(title = "Democracia x Desenvolvimento",
       x = "Regime Democr�tico",
       y = "PIB per capita")



banco_recodificado %>%
  group_by(democ_regime08) %>%
  summarise(mediana = median(gdppcap08),
            media = mean(gdppcap08),
            desvio = sd(gdppcap08),
            n = n())


t.test(gdppcap08 ~ democ_regime08, data = banco_recodificado)



# Da an�lise dos gr�ficos, � poss�vel notar que os pa�ses democr�ticos contam maiores valores de PIB per capita,
# em rela��o aos pa�ses n�o democr�ticos. J� o teste t demonstrou que o valor zero n�o est� contido no intervalo de 
# confian�a da diferen�a entre as m�dias, de modo que se pode observar que as vari�veis gdppcap08 e democ_regime08 
# est�o associadas. Assim, � poss�vel concluir que existe diferen�a com signific�ncia estat�stica entre as m�dias 
# de PIB per capita dos pa�ses democr�ticos e dos n�o-democr�ticos. 



## Por fim, ao inv�s de utilizar uma vari�vel bin�ria de democracia,
## utilize a vari�vel dem_score14 para avaliar se existe uma associa��o
## entre regime pol�tico e desenvolvimento econ�mico. Represente
## a associa��o graficamente, fa�a o teste estat�stico e explica sua
## conclus�o

banco$dem_score14

ggplot(banco, aes(dem_score14, gdppcap08)) +
  geom_jitter() + 
  labs(title = "Democracia x Desenvolvimento",
       x = "�ndice de democracia",
       y = "PIB per capita")

cor.test(banco$dem_score14, banco$gdppcap08)


# A an�lise do gr�fico permite concluir que se trata de uma rela��o de covarian�a positiva, haja vista que,
#na maioria dos casos, um maior PIB per capita est� relacionado a um maior �ndice de democracia. O teste de
#correla��o, por sua vez, apresentou um baixo p-valor, o que demonstra a exist�ncia de uma rela��o
#estatisticamente relevante entre as vari�veis.


## Teste a associa��o entre renda perca capta e religiao (com a vari�vel
## muslim) e represente graficamente. Qual � sua conclus�o? 


ggplot(banco_recodificado, aes(gdppcap08, fill = muslim)) +
  geom_density(alpha = 0.3) +
  labs(title = "Desenvolvimento x Pa�ses Isl�micos",
       subtitle = "Gr�fico de densidade",
       x = "PIB per capita",
       y = "Casos em an�lise")

ggplot(banco_recodificado, aes(muslim, gdppcap08)) +
  geom_boxplot() +
  labs(title = "Desenvolvimento x Pa�ses Isl�micos",
       x = "Pa�ses",
       y = "Renda per capita")

ggplot(banco_recodificado, aes(muslim, gdppcap08)) +
  geom_violin(draw_quantiles = c(0.25, 0.5, 0.75)) +
  labs(title = "Desenvolvimento x Pa�ses Isl�micos",
      x = "Pa�ses",
      y = "PIB per capita")



t.test(gdppcap08 ~ muslim, data = banco_recodificado)


#A an�lise gr�fica permite observar que, em m�dia, os pa�ses isl�micos possuem menor renda per capita
# do que os n�o-isl�micos. O teste t, por sua vez, apresentou um p-valor que embora n�o t�o baixo, 
#ainda permite dizer que h� uma rela��o com signific�ncia estat�stica entre as vari�veis, n�o sendo
#poss�vel, no entanto, afirmar a exist�ncia de causalidade entre elas.



## Comparando suas conclus�es anteriores, � poss�vel afirmar qual
## das duas vari�veis possui maior impacto no desenvolvimento economico?
## Por que? 

# O �ndice de democracia parece causar maior impacto no desenvolvimento econ�mico do pa�s do 
# que a religi�o isl�mica de sua popula��o, com base na an�lise dos resultados dos testes
#estat�sticos realizados. Isso porque, a sigific�ncia estat�stica entre o PIB per capita e
# �ndice de democracia � maior, haja vista que apresenta p-valor consideravelmente menor
# que em rela��o � vari�vel muslim, o que garante um grau de certeza mais elevado da rela��o
#entre aquelas vari�veis.


##########################################################################

## Exerc�cio te�rico
## Levando em considera��o as vari�veis de seu trabalho final,
## qual dos 3 testes estat�sticos utilizados seria adequado utilizar?
