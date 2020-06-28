
library(tidyverse)

library(poliscidata)

library(scales)

# Utilizando o banco world do pacote poliscidata, faça um  
# histograma que também indique a média  e um boxplot 
# da variável gini10
# Descreva o que você pode observar a partir deles.

banco <- world

ggplot(banco, aes(gini10)) + 
  geom_histogram() +
  geom_vline(aes(xintercept = mean(gini10, na.rm = T))) + geom_boxplot()

#Descreva o que você pode observar a partir deles.


# Por meio dos gráficos é possível observar a frequência do coeficiente de gini em 167 países analisados
#no período compreendido entre os anos 2000 e 2010. Dos 167 países, 14 não puderam ser contabilizados 
#nessa variável para a construção dos referidos gráficos. Podemos observar, ainda, que a média do gini 
#nesse período é 40, e a maioria dos países encontra-se abaixo dessa média. Além disso, é de se notar que
#a maior frequência de casos está compreendida entre os valores 30 e 40 do coeficiente de gini. 
#Quanto ao boxplot, que representa os 50% dos casos mais próximos da média, podemos observar que 
#a mediana encontra-se um pouco abaixo dessa média, o que demonstra assimetria positiva dos dados.
#Uma vez que o boxplot desconsidera os extremos, como os outliers, a mediana parece ser a medida mais
#indicada para a medição de dados assimétricos.




# Utilizando as funções de manipulação de dados da aula passada,
# faça uma tabela que sumarize a media (função mean), 
# mediana (função median) e o desvio padrão (função sd) da 
# renda per capta (variável gdppcap08), agrupada por tipo de regime 
# (variável democ).
# Explique a diferença entre valores das médias e medianas.
# Ilustre com a explicação com gráfico de boxplot.
# Os dados corroboram a hipótese da relação entre democracia
# e desempenho econômico?


tabela <- banco %>%
  group_by(democ) %>%
  summarise(media = mean(gdppcap08, na.rm = TRUE), 
            mediana = median(gdppcap08, na.rm = TRUE),
            desvio_padrao = sd(gdppcap08, na.rm = TRUE))
 
tabela

?world


ggplot(banco, aes(x = democ, y = gdppcap08)) +
  geom_boxplot()


# Explique a diferença entre valores das médias e medianas.


# São distintos os valores nas colunas que apontam as médias e as medianas, 
#porque a média indica a média aritmética entre todos os valores correspondentes
#ao PIB per capita dos países analisados; enquanto a mediana separa a metade
#superior do conjunto do PIB per capita, da metade inferior, em dois subconjuntos
#com a mesma quantidade de elementos. Assim, enquanto a média considera todos os valores,
#a mediana considera apenas 50% dos casos mais próximos da média, desonsiderando os extremos.
#É de se observar que os dados são assimétricos, de modo que a mediana aproxima-se do
#primeiro quartil. O que significa dizer que a frequência de casos é maior para o PIB 
#per capita abaixo da média, no entanto, sabe-se que que há países com PIB per capita muito acima
#da média, o que faz a média ser maior do que a mediana.



# Os dados corroboram a hipótese da relação entre democracia
# e desempenho econômico?

#Como se pode observar a partir da análise da tabela e do boxplot, nos países democráticos a média 
#do PIB per capita foi de 16.351,enquanto nos países considerados não-democráticos, a média foi 
#de apenas 9.243. Já a mediana foi 11.660 para os países democráticos, e 4.388 para os não-democráticos. 
#Se forem analisados esses dados, de forma isolada, é possível acreditar que eles corroboram com a 
#hipóteses de que existe relação entre democracia e desempenho econômico. No entanto, tal conclusão não
#seria correta, haja vista que muitas outras variáveis influenciam nessa relação, e seria preciso
#controlá-las para que fosse, então, possível analisar uma relação entre essas variáveis.



# Carregue o banco states que está no pacote poliscidata 
# Mantenha apenas as variáveis obama2012, conpct_m, hs_or_more,
# prcapinc, blkpct10, south, religiosity3, state


banco2 <- states 

banco2 %>%
  select(obama2012, conpct_m, hs_or_more, prcapinc, blkpct10, south, religiosity3, state)


# Carregue o banco nes que está no pacote poliscidata
# Mantenha apenas as variáveis obama_vote, ftgr_cons, dem_educ3,
# income5, black, south, relig_imp, sample_state

banco3 <- nes

banco3 %>%
  select(obama_vote, ftgr_cons, dem_educ3, income5, black, south, relig_imp, sample_state)


# As variáveis medem os mesmos conceitos, voto no obama em 2012, 
# conservadorismo, educação, renda, cor, norte-sul, 
# religiosidade e estado. A diferença é que o nes é um banco de
# dados com surveys individuais e o states é um banco de dados
# com informações por estado
#
# Faça um gráfico para cada banco representando o nível de
# conservadorismo. Comente as conclusões que podemos ter
# a partir deles sobre o perfil do eleitorado estadunidense.
# Para ajudar, vocês podem ter mais informações sobre os bancos
# de dados digitando ?states e ?nes, para ter uma descrição das
# variáveis

?states
conpct_m

?nes
ftgr_cons

# Faça um gráfico para cada banco representando o nível de
# conservadorismo. Comente as conclusões que podemos ter
# a partir deles sobre o perfil do eleitorado estadunidense.

ggplot(states, aes(conpct_m)) + 
  geom_histogram() + 
  geom_vline(aes(xintercept = mean(conpct_m, na.rm = T))) +
  geom_boxplot()



ggplot(nes, aes(ftgr_cons)) + 
  geom_histogram() + 
  geom_vline(aes(xintercept = mean(ftgr_cons, na.rm = T))) +
  geom_boxplot()



#Conforme se pode observar da leitura dos gráficos, tanto na pesquisa por estados,
#como no survey individual, a média de conservadores é alta. O que indica um grande
#conservadorismo do eleitorado estadunidense. No entanto, o survey individual 
#demonstra uma média de conservadores muito maior do que a pesquisa por estados, 
#o que pode indicar a possibilidade de o survey não ter respeitado a proporcionalidade
#entre os estados.



# Qual é o tipo de gráfico apropriado para descrever a variável
# de voto em obama nos dois bancos de dados?
# Justifique e elabore os gráficos

#No banco nes, o voto em Obama constitui uma variável categórica, haja vista possuir dois tipos de resposta:
#1 = sim, 0 = não. Como tal, a melhor representação gráfica seria o gráfico de barras.
#Já no banco states, o voto em Obama constitui uma variável numérica em percentual, de modo que o gráfico tipo
#histograma seria a melhor forma de representação.


ggplot(states, aes(obama2012)) +
  geom_histogram() + 
  geom_vline(aes(xintercept = mean(obama2012, na.rm = T)))



ggplot(nes, aes(obama_vote, ..count../sum(..count..) )) +
  geom_bar(na.rm = T) +
  scale_y_continuous(labels = percent)



# Crie dois bancos de dados a partir do banco nes, um apenas com
# respondentes negros e outro com não-negros. A partir disso, faça
# dois gráficos com a proporção de votos no obama.
# O que você pode afirmar a partir dos gráficos?
# Você diria que existe uma relação entre voto em Obama e cor?
 

banco_black <- banco3 %>%
  mutate(black = recode(black, Yes = "negros", 
                        No = "não-negros"))

banco_black

banco_negros <- banco_black %>%
  filter(black == "negros")

banco_negros


banco_nao_negros <- banco_black %>%
  filter((black == "não-negros"))


banco_nao_negros 


ggplot(banco_negros, aes(obama_vote, ..count../sum(..count..) )) +
  geom_bar(na.rm = T) +
  scale_y_continuous(labels = percent)


ggplot(banco_nao_negros, aes(obama_vote, ..count../sum(..count..) )) +
  geom_bar(na.rm = T) +
  scale_y_continuous(labels = percent)


# O que você pode afirmar a partir dos gráficos?
# Você diria que existe uma relação entre voto em Obama e cor?

#Pela simples análise dos gráficos, sem considerar outras variáveis, aparentemente há
#uma estreita relação entre a cor dos respondentes e a declaração de voto em Obama.
#Como se pode observar, quase a totalidade daqueles que se declararam negros, também
#declararam voto em Obama. Enquanto que entre aqueles que se declararam não-negros, 
#a declaração de voto em Obama foi cerca de 50%.




# A partir do banco de dados states, faça uma comparação semelhante.
# Faça um gráfico com as porcentagens de votos em Obama para estados
# que estão acima da mediana da porcentagem de população negra nos estados,
# e outro gráfico com as porcentagens de votos em Obama para os estados
# que estão abaixo da mediana de população negra.
# O que você pode afirmar a partir dos gráficos?
# Podemos chegar a mesma conclusão anterior?


negros_mediana <- banco2 %>%
  summarise(
    mediana = median(blkpct10, na.rm = TRUE))


negros_mediana

         
negros_mediana_filtrado <- banco2 %>%
 filter(blkpct10 > 8.25)
  
negros_mediana_filtrado

negros_abaixo_mediana_filtrado <- banco2 %>%
  filter(blkpct10 < 8.25)

negros_abaixo_mediana_filtrado

ggplot(negros_mediana_filtrado, aes(obama2012)) +
  geom_histogram() + 
  geom_vline(aes(xintercept = mean(obama2012, na.rm = T)))



ggplot(negros_abaixo_mediana_filtrado, aes(obama2012)) +
  geom_histogram() + 
  geom_vline(aes(xintercept = mean(obama2012, na.rm = T)))





# O que você pode afirmar a partir dos gráficos?
# Podemos chegar a mesma conclusão anterior?


# A partir da análise dos gráficos, observa-se que os estados com porcentagem 
#de população negra acima da mediana e os estados com porcentagem de população
# negra abaixo da mediana obtiveram resultados semelhantes. Assim, chega-se a
#uma conclusão diferente da que obtivemos anteriormente, isto é, não há relação
#entre o voto em Obama e a cor declarada pelo respondente.


# A partir da variável X do banco df abaixo

df <- data.frame(x = cos(seq(-50,50,0.5)))


# Faça os tipos de gráficos que representem esse tipo de variável
# comentando as diferenças entre elas e qual seria a mais adequada

# Para variáveis categóricas devemos utilizar o gráfico de barras, como a questão trata
#de uma variável contínua, podemos utilizar os gráficos tipo histograma, boxplot, 
#curva de densidade e de pontos. Vejamos.

ggplot(df, aes(x)) +
  geom_histogram()


#O histograma mostra a frequência de valores da variável por meio de barras.
#Cada coluna que compõe o histograma é chamado de bin. Por padrão, o ggplot 
#especifica que o número de bins a serem exibidos é 30. Parece ser o melhor
#para a representação dessa variável, por permitir uma análise mais clara e
#detlhada dos pontos, quanto maior o número de bins.


ggplot(df, aes(x)) + 
  geom_boxplot()

# O boxplot é um modo mais informativo de observar a variação em dados contínuos.
#O boxplot informa os valores da mediana, primeiro e terceiro quartis, e os valores mínimos e máximos, 
# no entanto, não se sabe muito bem como os dados estão distribuídos. Uma possibilidade para solucionar
#esse problema é o uso do violinplot, com a função geom_violin():


ggplot(df, aes(x = x, y = "")) + 
  geom_violin(draw_quantiles = c(0.25, 0.5, 0.75)) 


ggplot(df, aes(x)) +
  geom_density()


#O gráfico por curva de densidade (função density), em vez de representar a 
#distribuição com barras, uma linha curva descreve a distribuição dos dados 
#ao longo de seus valores. 


install.packages("ggbeeswarm")

library(ggbeeswarm)


ggplot(df, aes("",x)) +
  geom_beeswarm()

#Outra possibilidade é o gráfico de pontos, em que a própria concentração 
#dos pontos em seus valores correspondentes mostra a distribuição dos dados.
#Também é possível juntar o violinplot com o gráfico de pontos.

ggplot(df, aes("",x)) +
  geom_violin(draw_quantiles = c(0.25, 0.5, 0.75)) +
  geom_beeswarm()





# responsa as questões teóricas abaixo

