#ler base
library(readr)
estratificado <- read_delim("~/ufc/amostragem/Nova pasta/Dados_Estratificado (1).csv", 
                                     ";", escape_double = FALSE, trim_ws = TRUE)

#dividir em estratos baseeado na propria coluna designada
estratificado=data.frame(estratificado)
es1=estratificado[estratificado$Estrato==1,]
es2=estratificado[estratificado$Estrato==2,]
es3=estratificado[estratificado$Estrato==3,]
es4=estratificado[estratificado$Estrato==4,]

#chamar pacote proprio
require(TeachingSampling)

#semente
set.seed(1612)
#amostra aleatoria simples em rep
#de poplacao tamanho 4 e amostra tam 3 (3 clusters)
#pode ser fornecido vetor de prob uniforme de tam N
S.SI(4,3)
?S.SI


##divisao em conglomerados selecionados
#soma de yks de cada estrato selecionado aleatoriamente
cong2=sum(es2$yk)
cong3=sum(es3$yk)
cong4=sum(es4$yk)

#vetor de totais de yk dos conglomerados
t=c(cong2,cong3,cong4)
#estimadores HT
#usa N, n e y que é um vetor contendo a informacao das variaveis
?E.SI
E.SI(4,3,t)


#PPT
cong1xk=sum(es1$xk)
cong2xk=sum(es2$xk)
cong3xk=sum(es3$xk)
cong4xk=sum(es4$xk)
txk=c(cong1xk,cong2xk,cong3xk,cong4xk)
set.seed(1612)
p=S.PPS(3,txk);p
tppt=c(cong4,cong4,cong2);tppt
E.PPS(tppt,p[,2])
