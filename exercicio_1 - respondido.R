
# Entre no seguinte link:
# https://pt.wikipedia.org/wiki/Eleição_presidencial_no_Brasil_em_2002
# Vá até o tópico RESUMO DAS ELEICOES
# Crie um vetor com o nome dos seis candidatos a presidência

candidatos <- 

# Crie um vetor com a sigla do partido de cada candidato

partido <- 

# Crie um vetor com o total de votos de cada candidato
  
votos_candidatos <- 

# Crie um objeto calculando a soma do votos dos candidatos no 1o turno
  
total_votos <- 

# Crie um vetor com a porcentagem de votos de cada candidato
# fazendo uma operação aritmética entre o objeto votos_candidatos
# e o objeto total_votos

porcentagem_votos <- 

# Crie uma matriz que conste uma coluna com o total de votos de cada candidato
# e outra com a porcentagem dos votos de cada candidato

matriz_votos <- 

# Nomeie as linhas da matriz com o nome dos candidatos


# Nomeie também as colunas


# Crie um dataframe com o nome dos candidatos, o partido,
# a quantidade de votos e o percentual


# Crie um vetor lógico, indicado TRUE ou FALSE, com a informacao se
# o candidato foi para o segundo turno


# Adicione esta coluna no dataframe


# Calcule a soma da porcentagem dos dois candidatos que obtiveram mais votos


# Exiba as informações do dataframe dos dois candidatos com mais votos


###############################################################################

# Substitua o símbolo de interrogação por um 
# código que retorne o seguinte resultado:
#
# [1] 24 18 31

q <- c(47, 24, 18, 33, 31, 15)
q[?]

###############################################################################

# Substitua o símbolo de interrogação por um 
# código que retorne o seguinte resultado:
#
# Out Nov
#  24   2

x <- c(5, 4, 24, 2)
y <- c("Ago", "Set", "Out", "Nov")
names(x) <- y

x[?]

###############################################################################

# Substitua o símbolo de interrogação por um 
# código que retorne o seguinte resultado:
#
# 'data.frame':	2 obs. of  2 variables:
# $ x: Factor w/ 2 levels "d","e": 1 2
# $ y: num  1 4

df <- data.frame(?,
                 y = c(1,4)
)

str(df)

###############################################################################

# Crie a seguinte matriz
#
#       [,1] [,2] [,3]
# [1,]   19   22   25
# [2,]   20   23   26
# [3,]   21   24   27




###############################################################################

# Se Z é uma matriz 4 por 4, qual é o resultado de Z[1,4] ?

###############################################################################

# Substitua o símbolo de interrogação por um 
# código que retorne o seguinte resultado:
#
#  W3 W4 W1 W2 
#  20 69  5 88 

y <- c(20, 69, 5, 88)
q <- c("W3", "W4", "W1", "W2")
names(?) <- ?
  
  ###############################################################################

# Substitua o símbolo de interrogação por um 
# código que retorne o seguinte resultado:
#
#       [,1] [,2]
# [1,]    4    6
# [2,]    3    7
# [3,]    1    8


cbind(c(4, 3, 1), ?)



###############################################################################

# Substitua o símbolo de interrogação por um 
# código que retorne o seguinte resultado:
#       [,1] [,2] [,3] [,4]
# [1,]    1    3   13   15
# [2,]    2    4   14   16

x <- 1:4
y <- 13:26

matrix(?,
       nrow = 2,
       byrow = FALSE)

###############################################################################

# Crie o seguinte dataframe df
#
# df
#    x  y    z
# 1 17  A  Sep
# 2 37  B  Jul
# 3 12  C  Jun
# 4 48  D  Feb
# 5 19  E  Mar




# Ainda utilizando o dataframe df,
# qual código produziria o seguinte resultado?
#
#    x  y
# 1 17  A
# 2 37  B
# 3 12  C



###############################################################################

# Responder o exercício teórico abaixo

candidatos <- c("Luiz Inácio Lula da Silva","José Serra", "Anthony Garotinho", "Ciro Gomes", "José Maria de Almeida", "Rui Costa Pimenta")

partido <- c("PT", "PSDB", "PSB", "PPS", "PSTU", "PCO")

votos_candidatos <- c(39455233, 19705445, 15180097, 10170882, 402236, 38619)

sum(votos_candidatos)

total_votos <- c(sum(votos_candidatos))

total_votos

porcentagem_votos <- c(votos_candidatos / total_votos) * 100

porcentagem_votos

matriz_votos <- matrix(c(votos_candidatos, porcentagem_votos), byrow = FALSE, nrow = 6)

matriz_votos

colnames(matriz_votos) <- c("Quantidade de votos","Porcentagem de votos")

rownames(matriz_votos) <- c(candidatos)

matriz_votos

data.frame(candidatos, partido, votos_candidatos, porcentagem_votos)

resultado_eleição_2002 <- data.frame(candidatos, partido, votos_candidatos, porcentagem_votos)

resultado_eleição_2002

segundo_turno <- c(T, T, F, F, F, F)

resultado_eleição_e_segundo_turno <- cbind(resultado_eleição_2002, segundo_turno)

resultado_eleição_e_segundo_turno

sum(c(porcentagem_votos [1]), c(porcentagem_votos [2]))

banco_eleição_2002 <- resultado_eleição_e_segundo_turno

banco_eleição_2002

banco_eleição_2002[1:2,]


q <- c(47, 24, 18, 33, 31, 15)

q[c(2,3,5)]


# Substitua o símbolo de interrogação por um 
# código que retorne o seguinte resultado:
#
# Out Nov
#  24   2

x <- c(5, 4, 24, 2)
y <- c("Ago", "Set", "Out", "Nov")
names(x) <- y

x[?]

x[c(3,4)]



# Substitua o símbolo de interrogação por um 
# código que retorne o seguinte resultado:
#
# 'data.frame':	2 obs. of  2 variables:
# $ x: Factor w/ 2 levels "d","e": 1 2
# $ y: num  1 4

#df <- data.frame(?,y = c(1,4)

                 
#str(df)

df <- data.frame(x = factor(c("d", "e")), y = c(1,4))

str(df)



# Crie a seguinte matriz
#
#       [,1] [,2] [,3]
# [1,]   19   22   25
# [2,]   20   23   26
# [3,]   21   24   27

matrix(19:27, 3, 3)
 

# Se Z é uma matriz 4 por 4, qual é o resultado de Z[1,4] ?

Z <- matrix(1:16, 4, 4)

Z

Z[1,4]

# Substitua o símbolo de interrogação por um 
# código que retorne o seguinte resultado:
#
#  W3 W4 W1 W2 
#  20 69  5 88 

y <- c(20, 69, 5, 88)
q <- c("W3", "W4", "W1", "W2")
#names(?) <- ?

names(y) <- q

y

# Substitua o símbolo de interrogação por um 
# código que retorne o seguinte resultado:
#
#       [,1] [,2]
# [1,]    4    6
# [2,]    3    7
# [3,]    1    8


#cbind(c(4, 3, 1), ?)

coluna_extra <- c(6,7,8)

cbind (c(4,3,1), coluna_extra)



# Substitua o símbolo de interrogação por um 
# código que retorne o seguinte resultado:
#       [,1] [,2] [,3] [,4]
# [1,]    1    3   13   15
# [2,]    2    4   14   16

x <- 1:4
y <- 13:26


#matrix(?, nrow = 2, byrow = FALSE)


matriz <- matrix(c(x, y[1:4]), nrow = 2, byrow = FALSE)

matriz


# Crie o seguinte dataframe df
#
# df
#    x  y    z
# 1 17  A  Sep
# 2 37  B  Jul
# 3 12  C  Jun
# 4 48  D  Feb
# 5 19  E  Mar



x <- c(17, 37, 12, 48, 19)
y <- c("A", "B", "C", "D", "E")
z <- c("Sep", "Jul", "Jun", "Feb", "Mar")

df <- data.frame(x, y, z)
df

# Ainda utilizando o dataframe df,
# qual código produziria o seguinte resultado?
#
#    x  y
# 1 17  A
# 2 37  B
# 3 12  C


df[1:3,][,1:2]


#Exercício Teórico 





# Elaborar uma explicação causal teórica

#Em função da pandemia do novo coronavírus, a Organização Mundial de Saúde (OMS) estabeleceu orientações de quarentena e medidas de higiene como as formas mais eficazes de contenção da propagação da Covid-19. No entanto, a falta de abastecimento de água impede que as famílias sigam as medidas de higiene determinadas pela OMS e ratificadas pelo Ministério da Saúde.

#Segundo os dados mais recentes do Sistema Nacional de Informações sobre saneamento (SNIS), de 2018, quase 40 milhões de brasileiros não contam com água encanada em suas residências, como é o caso de 26% de nordestinos. Em Pernambuco, 20% da população não tem acesso ao serviço, são quase 2 milhões de pessoas sem água. Não há abastecimento de água em 68 dos 185 municípios do Estado. Os dados são alarmantes, ainda mais porque 50,7% da água potável disponível em Pernambuco não é contabilizada ou é perdida na distribuição, superando muito a  já elevada média nacional de 38,5% (Disponível em http://www.snis.gov.br/. Acesso em 13 de junho de 2020.) .
#Destaca-se, ainda, que nos Municípios onde o serviço está disponível, o abastecimento é deficitário. A Companhia Pernambucana de Saneamento (Compesa), responsável pela distribuição de água no Estado fornece em seu portal na internet um calendário de abastecimento, com informações sobre os dias de fornecimento de água nas regiões do Estado, municípios e bairros, no qual se verifica que comunidades chegam a ficar uma semana sem água nas torneiras.
#Para os pernambucanos que não têm acesso ao serviço de distribuição de água e para aqueles que contam com um abastecimento insuficiente, as medidas preventivas de higiene recomendadas pela OMS e pelo Ministério da Saúde tornam-se inefetivas, uma vez que não é possível que essas pessoas lavarem as mãos a todo momento, higienizem objetos e compras, ou tudo que trazem da rua para dentro de casa. 
#Nesse sentido, importa questionar: as regiões com nenhum ou insuficiente abastecimento de água no Estado de Pernambuco apresentam maior contágio por coronavírus?
 
  
   
  # Elaborar hipóteses
  
#Hipótese: O déficit de abastecimento de água nos municípios do Estado de Pernambuco leva a maiores taxas de contágio por coronavírus.

#Hipótese nula: Não há relação entre o déficit de abastecimento de água nos municípios do Estado de Pernambuco e a taxa de contágio por coronavírus.


  
  # Pensar em como operacionalizar os conceitos teóricos em variáveis empíricas

#Variável independente: Déficit do abastecimento de água nos municípios do Estado de Pernambuco.
#Pretende-se aferir a variável dependente a partir dos bancos de dados do Sistema Nacional de Informações sobre o Saneamento (SNIS) e da Compesa. Devido ao tamanho, e à grande concentração populacional na Capital do Estado, bem como à existência de dados relativos ao abastecimento de água na cidade do Recife por bairros, tais dados serão analisados por bairro. Já as demais regiões do Estado serão analisadas por Municípios.

#Variável dependente: taxa de contágio por coronavírus.
#Pretende-se mensurar a variável dependente a partir da análise do banco de dados divulgado pela Secretaria de Planejamento do Governo do Estado de Pernambuco (SEPLAG), onde são divulgadas informações sobre a origem dos casos suspeitos e confirmados.  (Disponível em https://dados.seplag.pe.gov.br/apps/corona_dados.html, acesso em 13 de junho de 2020). No que se refere ao Município de Recife, mais uma vez os dados serão analisados por bairro, a partir de informações divulgadas pela SEPLAG em aplicativo que indica os bairros dos moradores contaminados pelo coronavírus (Disponível em https://dados.seplag.pe.gov.br/apps/corona.html#mapas, acesso em 13 de junho de 2020).
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
# Estabelecer o tipo de relação entre as variáveis operacionalizadas
#A hipótese é de que o inefetivo abastecimento de água nos municípios pernambucanos leva a uma maior taxa de contágio de seus habitantes, por coronavírus. Nesse sentido, investiga-se uma relação positiva entre as variáveis operacionalizadas, de modo que se verificada a hipótese, o maior déficit no abastecimento de água deveria levar a maiores taxas de contágio. De outro modo, quanto menor o déficit no abastecimento de água, menor também seria a taxa de contágio nos municípios e regiões.























 

