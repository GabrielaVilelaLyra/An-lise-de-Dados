
## Faça todos os gráficos utilizando um tema que você ache mais adequado
## e nomeie os eixos x e y da maneira adequada

## Carregue o banco world do pacote poliscidata

library(poliscidata)

banco <- world

## Observe o banco de dados com as funções adequadas

glimpse(world)

?world

str(banco)

head(banco)

tail(banco)

summary(banco)

## A variável democ_regime08 indica se um país é democrático.
## Usando as ferramentas de manipulacao de bancos de dados, verifique
## quantos paises sao democraticos ou nao, e apresente esta variável 
## graficamente

banco$democ_regime08

banco_democ <- banco %>%
  count(democ_regime08)

banco_democ


# 95 países são democráticos e 69 não-democráticos.


ggplot(banco, aes(democ_regime08)) +
  geom_bar()+
labs(title = "Países democráticos",
     x = "Regime democrático",
     y = "Número de casos")

## Teste a relação entre a variável democ_regime08 e a variável
## muslim (que indica se um país é muçulmano ou não). E represente
## visualmente as variáveis para visualizar se esta religião
## aumenta ou diminui a chance de um país ser democrático
## Qual seria sua conclusão com relação a associação destas duas
## variáveis?

library(tidyverse)

banco <- world %>% filter(!is.na(democ_regime08),
                          !is.na(muslim), !is.na(gdppcap08))

banco$muslim

banco_recodificado <- banco %>%
  
  mutate(democ_regime08  = recode(democ_regime08,
                                  Yes = "Democráticos",
                                  No = "Não-democráticos"), muslim  = recode(muslim,
                                                                             Yes = "Muçulmanos",
                                                                             No = "Não-muçulmanos"))

tabela <- table(banco_recodificado$democ_regime08, banco_recodificado$muslim)


tabela

# não-muçulmanos e não-democráticos: 35 países
# democráticos e não-muçulmanos: 84 países
# muçulmanos e não-democráticos: 34 países
# muçulmanos e democráticos: 11 países


chisq.test(tabela)


library(graphics)

mosaicplot(tabela, shade = TRUE)


ggplot(banco_recodificado, aes(democ_regime08, fill = muslim)) +
  geom_bar(position = "fill") + 

# O resultado do teste Chi-quadrado indica grande probabilidade de associação entre as varíaveis, 
#pois possui valor alto para X^2, e um baixo p-valor, de modo que se pode afirmar ser uma relação 
#estatisticamente significante. Isso, no entanto, não é suficiente para afirmar a existência de uma
#relação forte entre as variáveis, ou mesmo de uma relação causal.
# Pela análise da tabela e dos gráficos, é possível observar que os países muçulmanos são,
#majoritatiamente, não-democráticos, ainda que não se possa apontar relação de causalidade.
  




## A variável gdppcap08 possui informação sobre o PIB per capta
## dos países. Faça uma representação gráfica desta variável

banco$gdppcap08

library(scales)

ggplot(banco, aes(gdppcap08)) +
  geom_histogram() +
  labs(title = "PIB per capta",
       x = "Renda per capita",
       y = "Número de casos")

## Faça um sumario com a média, mediana e desvio padrão do pib per capta
## para cada tipo de regime politico, represente a associação destas
## variáveis graficamente, e faça o teste estatístico adequado para
## chegar a uma conclusão. Existe associaçào entre as variáveis?


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
       subtitle = "Gráfico de curva de densidade",
       x = "PIB per capita",
       y = "Regime Democrático")

ggplot(banco_recodificado, aes(democ_regime08, gdppcap08)) +
  geom_boxplot() + 
  labs(title = "Democracia x Desenvolvimento",
       x = "Regime Democrático",
       y = "PIB per capita")

ggplot(banco_recodificado, aes(democ_regime08, gdppcap08)) +
  geom_violin(draw_quantiles = c(0.25, 0.5, 0.75)) +
  labs(title = "Democracia x Desenvolvimento",
       x = "Regime Democrático",
       y = "PIB per capita")



banco_recodificado %>%
  group_by(democ_regime08) %>%
  summarise(mediana = median(gdppcap08),
            media = mean(gdppcap08),
            desvio = sd(gdppcap08),
            n = n())


t.test(gdppcap08 ~ democ_regime08, data = banco_recodificado)



# Da análise dos gráficos, é possível notar que os países democráticos contam maiores valores de PIB per capita,
# em relação aos países não democráticos. Já o teste t demonstrou que o valor zero não está contido no intervalo de 
# confiança da diferença entre as médias, de modo que se pode observar que as variáveis gdppcap08 e democ_regime08 
# estão associadas. Assim, é possível concluir que existe diferença com significância estatística entre as médias 
# de PIB per capita dos países democráticos e dos não-democráticos. 



## Por fim, ao invés de utilizar uma variável binária de democracia,
## utilize a variável dem_score14 para avaliar se existe uma associação
## entre regime político e desenvolvimento econômico. Represente
## a associação graficamente, faça o teste estatístico e explica sua
## conclusão

banco$dem_score14

ggplot(banco, aes(dem_score14, gdppcap08)) +
  geom_jitter() + 
  labs(title = "Democracia x Desenvolvimento",
       x = "Índice de democracia",
       y = "PIB per capita")

cor.test(banco$dem_score14, banco$gdppcap08)


# A análise do gráfico permite concluir que se trata de uma relação de covariança positiva, haja vista que,
#na maioria dos casos, um maior PIB per capita está relacionado a um maior índice de democracia. O teste de
#correlação, por sua vez, apresentou um baixo p-valor, o que demonstra a existência de uma relação
#estatisticamente relevante entre as variáveis.


## Teste a associação entre renda perca capta e religiao (com a variável
## muslim) e represente graficamente. Qual é sua conclusão? 


ggplot(banco_recodificado, aes(gdppcap08, fill = muslim)) +
  geom_density(alpha = 0.3) +
  labs(title = "Desenvolvimento x Países Islâmicos",
       subtitle = "Gráfico de densidade",
       x = "PIB per capita",
       y = "Casos em análise")

ggplot(banco_recodificado, aes(muslim, gdppcap08)) +
  geom_boxplot() +
  labs(title = "Desenvolvimento x Países Islâmicos",
       x = "Países",
       y = "Renda per capita")

ggplot(banco_recodificado, aes(muslim, gdppcap08)) +
  geom_violin(draw_quantiles = c(0.25, 0.5, 0.75)) +
  labs(title = "Desenvolvimento x Países Islâmicos",
      x = "Países",
      y = "PIB per capita")



t.test(gdppcap08 ~ muslim, data = banco_recodificado)


#A análise gráfica permite observar que, em média, os países islâmicos possuem menor renda per capita
# do que os não-islâmicos. O teste t, por sua vez, apresentou um p-valor que embora não tão baixo, 
#ainda permite dizer que há uma relação com significância estatística entre as variáveis, não sendo
#possível, no entanto, afirmar a existência de causalidade entre elas.



## Comparando suas conclusões anteriores, é possível afirmar qual
## das duas variáveis possui maior impacto no desenvolvimento economico?
## Por que? 

# O índice de democracia parece causar maior impacto no desenvolvimento econômico do país do 
# que a religião islâmica de sua população, com base na análise dos resultados dos testes
#estatísticos realizados. Isso porque, a sigificância estatística entre o PIB per capita e
# índice de democracia é maior, haja vista que apresenta p-valor consideravelmente menor
# que em relação à variável muslim, o que garante um grau de certeza mais elevado da relação
#entre aquelas variáveis.


##########################################################################

## Exercício teórico
## Levando em consideração as variáveis de seu trabalho final,
## qual dos 3 testes estatísticos utilizados seria adequado utilizar?
