####### Aula prática de Técnicas de Amostragem usando o pacote TeachingSampling #####

#install.packages("TeachingSampling")
require(TeachingSampling)

###### Amostragem Sistemática ######

#  Função que tira uma amostra sistemática
#de tamanho n de uma população de tamanho N
#S.SY(N= tamanho populacao, a = numero de grupos
#que a dividem)

N=10
a=4
set.seed(404488)
sample = S.SY(N,a)
#amostra = {1,5,9}

y= c(100,120)

#estimativas
#função E.SY
#Parâmetros: 
#N: tamanho população
#y: vetor com informação coletada
#a: numero grupos

estim = E.SY(N,a,y);estim

#total estimado: 880
#esvio padrão 77.45
#cve: 8.80
#deff: 1


######## Amostragem de Poisson ########

#selecionar amostra
#função S.PO
#parâmetros:
# N: tamanho pop
# Pik: vetor com as probabilidaes de inclusão de 1a ordem

Pik= c(0.15,0.10,0.11,0.05,0.09,
       0.15,0.10,0.15,1,0.5)
set.seed(404488)
sample2 = S.PO(N,Pik)

#amostra: {9}

#fazendo outras vezes, o 9 sempre será selecionado
#pois sua prob de  inclusão é 1. isso se chama inclusão forçosa


y2 = c(100)

#estimativas
#função E.PO
#parametros: vetor y com respostas
#prob inclusão o inividuo selecionado
  
estim2 = E.PO(y2,Pik[9]);estim2

#total: 220
#desvio padrão 0
#cve: 0
#deff: 0



####### Amostragem PPT #####

#selecionar amostra
m=4
set.seed(404488)
x = runif(N)
  
sample3 = S.PPS(m=m,x=x);sample3
#amostra = {10,1,1,10}

#estimativas
y3 = c(10,12,15,10)
estim3 = E.PPS(y=y3,sample3[,2]);estim3

#total: 7.048
#dp: 0.68
#cve: 9.68
#deff: 


