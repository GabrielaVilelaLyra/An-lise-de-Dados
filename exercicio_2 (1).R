library(tidyverse)

library(poliscidata)


# Suponha que tenhamos o dataframe df abaixo
#
# x     y
# A     5
# A     3
# B     8
# B    12
#
# Complete o c?digo que obt?m o seguinte resultado:
#
#        z
#        7
#

#df %>%
#?(z = mean(y))

x <- c("A", "A", "B", "B")

y <- c(5, 3, 8, 12)


df_01 <- data.frame(x,y)

df_01

df_01%>%
summarise(z = mean(y))

z

        #######################################################################
          
          # Suponha que tenhamos o dataframe df abaixo
          #
          # y1    y2    y3    y4
          # 8.04  9.14  7.46  6.58
          # 6.95  8.14  6.77  5.76
          # 7.58  8.74  12.74 7.71
          #
          # Complete o c?digo que obt?m o seguinte resultado:
          #
          # y1    
          # 8.04  
          # 6.95  
          # 7.58  
          
          df %>%
            ?


y1 <- c(8.04,  6.95, 7.58)
y2 <- c(9.14,  8.14, 8.74)
y3 <- c(7.46, 6.77,  12.74) 
y4 <- c(6.58, 5.76, 7.71)

df_02 <- data.frame(y1, y2, y3, y4)

df_02 

df_02_selecionado <- df_02 %>%
select(y1)

df_02_selecionado


#######################################################################

# Suponha que tenhamos o dataframe df abaixo
#
#    x  y
#   1  10
#   6  8
#   2  3
#   4  5
#
# Complete o c?digo que obt?m o seguinte resultado, fazendo uma opera??o
# entre x e y
#
#    x  y   z
#   1  10  -9
#   6  8   -2
#   2  3   -1
#   4  5   -1
#

#df %>% ?
  
x <- c(1, 6, 2, 4)
y <- c(10, 8, 3, 5)

df_03 <- data.frame(x,y)

df_03

banco_adicionado <- df_03 %>%
mutate(z = x - y)

banco_adicionado

########################################################################

#
# Suponha que tenhamos o dataframe df abaixo
#
#    city sales
# Boston   220
# Boston   125
#    NYC   150
#    NYC   250
#
# Complete o c?digo que obt?m o seguinte resultado:
#
# city   avg_sales
# Boston      172
# NYC         200 

#df %>%
 # ? %>%
 # summarise(avg_sales = mean(sales))

city <- c("Boston", "Boston", "NYC", "NYC")
sales <- c(220, 125, 150, 250)

df_04 <- data.frame(city, sales)

df_04

df_04 %>%
 group_by(city) %>%
  summarise(avg_sales = mean(sales))


########################################################################

# Suponha que tenhamos o dataframe df abaixo
#
#week   min   max
#  3    55    60
#  2    52    56
#  1    60    63
#  4    65    67
#
# Complete o código que obtém o seguinte resultado:
#
#week   min   max
#  1    60    63
#  2    52    56
#  3    55    60
#  4    65    67

#df %>%
  ?

week <- c(3, 2, 1, 4)
min <- c(55, 52, 60, 65)
max <- c(60, 56, 63, 67)

df_05 <- data.frame(week, min, max)
  
df_05


banco_reorganizado <- df_05 %>%
  arrange(week)

banco_reorganizado


########################################################################

# Suponha que tenhamos o dataframe df abaixo
#
# x_b_1  x_b_2  y_c_1  y_c_2
#  A      2      W1     25
#  A      4      W2     21
#  B      6      W1     26
#  B      8      W2     30
#
# Complete o c?digo que obt?m o seguinte resultado:
#
# y_c_1  y_c_2
#  W1     25
#  W2     21
#  W1     26
#  W2     30

#df %>%
 # select(?(?))

x_b_1 <- c("A", "A", "B", "B")
x_b_2 <- c(2, 4, 6, 8)
y_c_1 <- c("W1", "W2", "W3", "W4")
y_c_2 <- c(25, 21, 26, 30)

df_06 <- data.frame(x_b_1, x_b_2, y_c_1, y_c_2)

df_06

df_06 %>%
  select(y_c_1, y_c_2)


#########################################################################

# Suponha que tenhamos o dataframe df abaixo
#
# Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
# 78           6.7         3.0          5.0         1.7 versicolor
# 121          6.9         3.2          5.7         2.3  virginica
# 11           5.4         3.7          1.5         0.2     setosa
# 92           6.1         3.0          4.6         1.4 versicolor
# 146          6.7         3.0          5.2         2.3  virginica
# 62           5.9         3.0          4.2         1.5 versicolor
# 50           5.0         3.3          1.4         0.2     setosa
# 17           5.4         3.9          1.3         0.4     setosa
# 69           6.2         2.2          4.5         1.5 versicolor
# 143          5.8         2.7          5.1         1.9  virginica
#
# Complete o c?digo que obt?m o seguinte resultado:
#
#Species      Sepal.Area
#versicolor      20.10
#virginica       22.08
#setosa          19.98
#versicolor      18.30
#virginica       20.10
#versicolor      17.70
#setosa          16.50
#setosa          21.06
#versicolor      13.64
#virginica      15.66


#df %>%
  ?(?)


Sepal.Length <- c(6.7, 6.9, 5.4, 6.1, 6.7, 5.9, 5.0, 5.4, 6.2, 5.8)
Sepal.Width <- c(3.0, 3.2, 3.7, 3.0, 3.0, 3.0, 3.3, 3.9, 2.2, 2.7)
Petal.Length <- c(5.0, 5.7, 1.5, 4.6, 5.2, 4.2, 1.4, 1.3, 4.5, 5.1)
Petal.Width <- c(1.7, 2.3, 0.2, 1.4, 2.3, 1.5, 0.2, 0.4, 1.5, 1.9)
Species <-c("versicolor", "virginica", "setosa", "versicolor", "virginica", "versicolor", "setosa", 
"setosa", "versicolor", "virginica")

df_07 <- data.frame(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width, Species)    

df_07

df_07 %>%
  transmute(Species, Sepal.Area = Sepal.Length * Sepal.Width)

########################################################################

# Suponha que tenhamos o dataframe df abaixo
#
#name         start       end         party     
#Eisenhower   1953-01-20  1961-01-20  Republican
#Kennedy      1961-01-20  1963-11-22  Democratic
#Johnson      1963-11-22  1969-01-20  Democratic
#Nixon        1969-01-20  1974-08-09  Republican
#Ford         1974-08-09  1977-01-20  Republican
#Carter       1977-01-20  1981-01-20  Democratic
#Reagan       1981-01-20  1989-01-20  Republican
#Bush         1989-01-20  1993-01-20  Republican
#Clinton      1993-01-20  2001-01-20  Democratic
#Bush         2001-01-20  2009-01-20  Republican
#Obama        2009-01-20  2017-01-20  Democratic
#
#Crie um código abaixo para que se altere a variável party
#deixando apenas a primeira letra dos partidos

#df %>%
 # ?

pres <- c("Kennedy", "Nixon")
party <- c("Democratic", "Republican")

df_08 <- data.frame(pres, party)

df_08                         
                         
banco_recodificado_8 <- df_08 %>%
  mutate(party = recode(party, Democratic = "D", Republican = "R"))  

banco_recodificado_8 
                         
                         
###############################################################################

# No pacote poliscidata existe um banco de dados chamado nes, com informa??es 
# do American National Election Survey. Para os exer?cicios a seguir, instale 
# o pacote poliscidata e tidyverse, carregue-os e crie um objeto chamado
# df com os dados do nes. 

df <- nes

df

nes

# Faça uma primeira exploração do banco de dados com todos os comandos
# passados até aqui que possuem esse objetivo


# Quantos respondentes possui na pesquisa?

                         
str(nes)                        

# 5916 respondentes


# Caso queiram ter mais informa??es sobre as vari?veis do nes, basta rodar
# o c?digo `?nes`, que no canto inferior direito aparecer? uma descri??o.
# Como temos muitas vari?veis, deixe apenas as colunas
# ftgr_cons, dem_raceeth, voted2012, science_use, preknow3, obama_vote
# income5, gender.

?nes


df_selected<- df%>%
  select(ftgr_cons, dem_raceeth, voted2012, science_use, preknow3, obama_vote, income5, gender)


# Se quisermos ter informa??es apenas de pessoas que votaram na
# elei??o de 2012, podemos usar a vari?vel voted2012. Tire do banco
# os respondentes que n?o votaram

                         
df_voted2012 <- df_selected%>%
  filter(voted2012 == "Voted")

df_voted2012

# Quantos respondentes sobraram?

str(df_voted2012) 


# Sobraram 4404 respondentes

# Crie uma variável chamada white que indica se o respondente é branco
# ou não a partir da variável dem_raceeth, crie a variável ideology a
# partir da variável ftgr_cons (0-33 como liberal, 34 a 66 como centro,
# e 67 a 100 como conservador), ao mesmo tempo em que muda
# a vari?vel obama_vote para trocar o 1 por "Sim" e 0 por "não"


df_variaveis.alteradas <- df_selected %>%
  mutate(white = dem_raceeth == "1. White non-Hispanic", ideology = case_when(ftgr_cons < 34 ~ "liberal", ftgr_cons >= 34 & ftgr_cons < 67 ~ "centro", ftgr_cons >= 67 ~ "conservador"), obama_vote = recode(obama_vote, "1" = "sim", "0" = "não"))
   
  

  # Demonstre como observar a quantidade de pessoas em cada uma das
  # categorias de science_use
  
df_voted2012 %>%
  count(science_use)
  
  
  # Demonstre como observar a m?dia de conservadorismo (vari?vel 
  # ftgr_cons) para cada categoria de science_use



df.science_use <- df %>%
  select(science_use, ftgr_cons)


df.science_use %>%
  group_by(science_use) %>%
  summarise(avg_ftgr_cons = mean(ftgr_cons, na.rm = TRUE))

###############################################################################

# Responder as quest?es te?ricas da aula abaixo
#Artigo selecionado: DESAFIOS NO ACESSO À ÁGUA E SANEAMENTO BÁSICO NO BRASIL E O CONTROLE DA COVID-19
#Autores: Rafel Reis Pereira Bandeira de Mello, Rafael Marques Villardi, Silvia Conceição Reis Pereira Mello, 
#Maria Geralda de Miranda

#1.	Qual é a questão de pesquisa?
#Como a desigualdade na distribuição dos recursos hídricos e de saneamento básico refletem no impacto da Covid-19 
#sobre as populações vulneráveis do Brasil?
  
  
#2.	Qual é a teoria? O artigo foi construído com base na teoria de que existe correlação entre a falta de saneamento, 
#incluindo acesso à água potável e esgotamento sanitário,  e a dificuldade no controle da Covid-19 no Brasil.


#3.	Qual é o desenho de pesquisa?
 # Trata -se de um artigo de revisão, que buscou,  por  meio  de  informações  em  artigos  científicos, documentos 
#técnicos   e   legislações   apresentar   e   discutir   os   impactos   trazidos   pela desigualdade no acesso aos
#recursos hídricos e de esgotamento sanitário, e suas implicações na prevenção da Covid-19. 


#4.	Como o artigo se sai nos 4 quesitos de avaliação de causalidade?

#a)	Existe uma explicação causal razoável para que a falta de acesso à água encanada e potável venha a ocasionar 
#maior número de contaminação pelo novo coronavírus, uma vez que uma das medidas de prevenção orientadas pela OMS
#é a higienização constante das mãos, bem como das compras e objetos que sejam trazidos para casa. Da mesma forma, 
#no que tange ao saneamento básico, visto que a falta de acesso ao esgotamento  sanitário costuma estar relacionada
#com  o  aumento  das  taxas  de  morbidade  e  mortalidade  por  doenças infecciosas.

#b)	Não há possibilidade de uma causalidade reversa, posto que o controle do contágio pelo coronavírus não tem meios
#de ocasionar a falta de acesso democrático à água e ao esgotamento sanitário.

#c)	O artigo não traz uma análise empírica entre as variáveis, apenas as relaciona teoricamente, e devido à novidade
#do tema, ainda não há pesquisas empíricas nas quais se possa embasar o artigo.

#d)	O artigo é de revisão, não realiza experimentos ou estudos empíricos, além de que não foram mencionadas outras
#variáveis que pudessem vir a fazer desaparecer a correlação entre as variáveis apontadas no artigo.

#5.	O que ele conclui?
  
#Entendo que o artigo acabou por não responder de forma robusta à pergunta de pesquisa, concluindo de forma 
#superficial que se faz necessária uma política descentralizada de acesso à água, com participação dos municípios 
#nessa gestão, visando à democratização do acesso para populações carentes. 
#Além disso aponta a preocupação com a velocidade de contágio do coronavírus em muitos locais, onde não se  tem  
#água para  a  prevenção  mais  básica  da  doença,  reafirmando a necessidade urgente de democratização dos recursos
#hídricos, visando à prevenção da contaminação pelo vírus e mitigando seus trágicos efeitos.

#6.	Como a sua pesquisa dá um passo a mais para o desenvolvimento teórico presente nesse artigo?
#O tema é novo e está na ordem dia, de modo que ainda não conta com muita literatura a respeito. Nesse sentido,
#o estudo já seria válido para aprofundar a discussão sobre o tema. No entanto, com artigo pretendo analisar dados 
#efetivos da contaminação por coronavírus no Estado de Pernambuco, no intuito de concluir por meio da observação dos 
#números de casos se existe, de fato, relação entre a falta de acesso à água e a contaminação pelo coronavírus. 
#É, portanto, um aprofundamento da teoria do artigo ora analisado, uma vez que esse resume-se a revisar literaturas
#para afirmar seu entendimento de que essas variáveis estariam correlacionadas, sem análise de dados comprobatórios 
#da teoria.

#7.	Elabore a sua pergunta de pesquisa em uma frase.
#Em que medida o déficit no abastecimento de água impacta a contaminação pelo novo coronavírus no Estado de 
#Pernambuco


#8.	Em que medida seu trabalho passa pelas 4 avaliações de relações causais e quais problemas ele pode ter em cada 
#uma delas?
  
#a)	Existe uma explicação causal razoável para que a falta de acesso à água encanada e potável venha a ocasionar 
#maior número de contaminação pelo novo coronavírus, uma vez que uma das medidas de prevenção orientadas pela OMS 
#é a higienização constante das mãos, bem como das compras e objetos que sejam trazidos para casa.

#b)	Não há possibilidade de uma causalidade reversa, posto que a contaminação por coronavírus não tem meios de 
#ocasionar o déficit no abastecimento de água.

#c)	Existe aparente covariação entre as variáveis, o que o estudo pretende é, justamente, avaliar a associação entre 
#elas de forma empírica, utilizando para isso os números de abastecimento de água e contágio por coronavírus no Estado
#de Pernambuco.

#d)	Algumas variáveis, como possibilidade de cumprir isolamento social, grau de instrução ou condição financeira 
#podem interferir no resultado da correlação entre essas variáveis, no entanto, entendo que dificilmente a variável
#dependente poderia desaparecer no implemento de alguma variável externa como as mencionadas.
#Além da questão da existência de outras variáveis que precisarão ser controladas, um problema que pode ser 
#observado nesse trabalho seria em relação à generalidade, visto que o coronavírus afeta todo o Planeta, assim 
#como o déficit no abastecimento de água é uma realidade para muitos países, porém se pretende fazer o estudo 
#apenas com os números relativos ao Estado de Pernambuco.

