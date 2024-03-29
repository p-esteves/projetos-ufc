# Example 3.1 - The Delivery Time Data (Montgomery et al., 2012, p.74)
setwd('C:\\Documents\\ufc\\regressao')
## Descri��o das vari�veis

# y delivery time (in minutes)
# x1 number of cases of product stocked
# x2 distance walked by route driver

require(MPV) ## Data Sets from Montgomery, Peck and Vining's Book
require(car)
require(corrplot) # We'll use corrplot later on in this example too.
require(visreg) # This library will allow us to show multivariate graphs.
require(rgl)
require(knitr)
require(scatterplot3d)
require(ellipse)
require(tidyverse)
require(ggplot2)



data(p8.3)
dados=data.frame(p8.3)


## Gr�fico de dispers�o m�ltiplo

## Forma 1
#esta feio, mudar os rotulos
#variaveis parecem ter relacao entre as variaveis
#colocar nos respectivos graficos o  coef correlacao e se
#ele e significativo 
pairs(p8.3)

## Forma 2
#corrplot ajuda nisso
#matriz de correlacao
#denotar legenda
newdatacor = cor(dados[1:3])
corrplot(newdatacor, method = "number")

# Forma 3
#fornece apenas o triangulo sup
#melhor pq pode confundir
pairs(dados[,1:3], pch = 19, lower.panel = NULL)

## Forma 4
#grafico favorito dele
#o mais completo, com distrib marginais e corr
require(GGally)
ggpairs(dados[,1:3])
#x1 x2 possuem possivel multicolineariddadde

#sginif:
#*** sig a 1
#** sig a 5 mas nao 1
#* sig 10
#nenhum nao e sig

### Ajuste do MRLM
attach(dados)
ajuste=lm(y~x1+x2)  ## Modelo completo
summary(ajuste)
#resumo do modelo
#mesmo  as variaveis  tendo correla��o entre elas, ambas sao altamente significativas
#intercpeto signific 5% mas nao a 1%
# precisa analisar se ha valores prox de zero
# r2 ajustado escolhido nesse caso, 95,6% 
#interrpeta��o dele � x% da variabilidade e y consegue ser explicadda  por x1 e x2
#p valor associado ao teste t que testa se os param sao iguais a 0
#teste marginais

#eqreg ou sigma dois igual a 3,259^2
#variabilidad a fonte de var
#f testa se o modelo e significante, ou seeja, tem regressao
# betas sao dif de  zero simultaneamente
# nesse caaso ele � sig a  5%
#ser sig = rej H0 que diz que sao zero

#r2 ajustado corrige pelos GL pois ao adicionarmos mais variaveis exp ele aumenta e deve ser feita uma corre��o/ajuste
#1 - n-1/n-p * 1-r2 mult (preferivel)
#r2 multipplo corrige a sqreg/sqt

anova(ajuste)
# teste marginais
# n fornece se todos testes  sao  iguaiss a zero
# preciso fazer ajuste zero que e o caso sem regressao e pegamos anova pros ois
# 
#


### Gr�fico de valores observados vs ajustados
#extracao partes inividuais do ajuste
names(ajuste) ## Objetos que podem ser extraidos
Observado <- y
Res�duo <- ajuste$residuals  # res�duo ordin�rio
Predito <- ajuste$fitted
tabela <- round(data.frame(Observado,Predito,Res�duo),3)
view(tabela)

plot(Observado,Predito,xlab=" Tempo de entrega (min)",ylab="Tempo de entrega predito (min) pelo MRLM",pch=16)
abline(0,1,lty=3,col="red") 

x=Predito


## Gr�fico do ajustado vs predito usando o ggplot2

# Create the base plot
ggplot(dados, aes(x, y))+
  geom_point() +
  labs(x="Tempo de entrega predito via MRLM", y="Tempo de entrega (min) ", title="Diagrama de dispers�o")



# Create the base plot
ggplot(dados, aes(y, x))+
  geom_point() +
  labs(x="Tempo de entrega predito via MRLM", y="Tempo de entrega (min) ", title="Diagrama de dispers�o vs. valores ajustados via MRLM")+
  geom_line(data = fortify(ajuste), aes(x = x, y = .fitted))

#intervalo p media
#predicao ficaria mais largo
#pq no interv pra media conssiera so a media, variacao menor
#predicao variabilidae maior
ggplot(dados,aes(x,y))+
  labs(x="Tempo de entrega predito via MRLM", y="Tempo de entrega (min) ", title="Diagrama de dispers�o vs. valores ajustados via MRLM")+
  geom_point()+
  geom_smooth(method="lm",col="green") 



### Gr�fico em 3D do modelo ajustado

s3d <- scatterplot3d(x1,x2,y,highlight.3d = TRUE, scale.y = 1,type = "h", pch = 16, main = "Plano ajustado via MRLM",zlab="Tempo de entrega (min)",xlab="N�mero de produtos",ylab="Dist�ncia (p�s)")
s3d$plane3d(ajuste,col="red")


## Contribui��o de cada vari�vel
ajuste0=lm(y~1)
summary(ajuste0)
ajuste1=lm(y~x1)# mais sig que x2, r2 maior
#poe ser vito isso tb no grafico de dispersao marginal e x1 tem corr maior com y que a outra
#ou ainda pelo summary com os dois e verqual e mais signif.
summary(ajuste1)
ajuste2=lm(y~x2)
summary(ajuste2)

### Contribui��o das duas
# testando se todos os param que tem no ajuste e nao no ajuste0
#sao simultaneamente iguais a zero
# quem e que nao tem?: beta 1 e 2
# repete verificacao, no caso tem regressao
anova(ajuste0,ajuste)

### Contribui��o de x_2
anova(ajuste1,ajuste)

### Contribui��o de x_1
#dado x2 no modelo
anova(ajuste2,ajuste)


### Construir ICs para os par�metros
#?confint
confint(ajuste)


## Comando which--> Dizer qual o par de par�metros queremos. 


## Usando em conjunto o ggplot 2


plot(ellipse(ajuste,level=0.95, which = c(2,3)),type="l",cex=1.4,col="red",xlab=" beta 1", ylab="beta 2 ")
#mtext(expression(beta[1]), side=1, line=2.0,cex=1.2)
#mtext(expression(beta[2]), side=2, line=2.0,cex=1.2)
points(ajuste$coefficients[2], ajuste$coefficients[3],pch=16,col="blue")
aux = ellipse(ajuste, level = 0.95, which = c(2,3))
library(ggplot2)
ggplot() +
  geom_polygon(aes(x = aux[,1], y = aux[,2]), alpha = 0.1) +
  geom_point(aes(x = ajuste$coefficients[2], 
                 y = ajuste$coefficients[3]))+
  xlab(expression(beta[1])) + ylab(expression(beta[2]))
dev.copy2pdf(file="figura4.pdf",out.type="cairo")  ## salvando o gr�fico em .pdf



### Testes para contrastes do tipo cbeta=d

# Fun��o que faz os testes de contrastes acima
require(gmodels)
?glh.test

# Matriz c para testar se $\beta1=0$
c1 <- c(0,1,0)
d1=0
## Teste F
teste1 <- glh.test(ajuste,c1,d1)
teste1 

# Matriz c para testar se $\beta2=0$
c2 <- c(0,0,1)
d2=0
## Teste F
teste2 <- glh.test(ajuste,c2,d2)
teste2 

# Matriz c utilizada para testar $\beta1=\beta2=0$.
c <- rbind(c1,c2)
d=c(d1,d2)
## Teste F
teste <- glh.test(ajuste,c,d)
summary(teste)
summary.glh.test(teste)
teste 



## An�lise de diagn�stico

plot(ajuste)

# Usando as fun��es envel.norm, diag.norm e dmax.norm

# identificando as observacoes
source("dmax.norm.txt")
source("envel.norm.txt")
source("diag.norm.txt")

#ientificar obs
#clicar pontos fora dos intervs
envel.norm(ajuste, conf=0.95, iden=6)
#9 aparece em todos
#faria analise confirmatoria e tentaria ver motivo q destacam-se
#verificar se modelo e robusto ; tentando identificar obs destacadas
diag.norm(ajuste,iden=c(2,2,3,2,1,1))

dmax.norm(ajuste,iden=c(2,6,6))




