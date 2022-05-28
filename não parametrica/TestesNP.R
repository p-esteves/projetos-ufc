#Estatística Não-Paramétrica

x<-c(20,18,7,9,12,13,22,21,14,15,18,11)

df.x<-data.frame(tempo=x)

n<-length(x)

Fn<-ecdf(x)


plot(Fn)

summary(Fn)

summary.stepfun(Fn)

cdf.hat<-(1:n)/n

plot(sort(x),cdf.hat,type="s")

stepfun(sort(x)[-1],sort(x))

## Bandas de confiança

alfa<-.05



require(mltools)

cdf.hat<-empirical_cdf(x,sort(x))




require(ggplot2)

ggplot(df.x, aes(tempo)) + stat_ecdf(geom = "step")



epsilon_i = sqrt(log(2/0.05)/(2*n))

L=pmax(cdf.hat$CDF-epsilon_i, 0)
U=pmin(cdf.hat$CDF+epsilon_i, 1)

plot(cdf.hat$UpperBound,cdf.hat$CDF,type = "s",ylim = c(-.1,1),xlab = "Tempo",ylab="Fn",cex.lab=1.5,cex.axis=1.5)
lines(cdf.hat$UpperBound, U, col="blue",type = "s")
lines(cdf.hat$UpperBound, L, col="blue",type = "s")


notas<-c(189,233,195,160,212,176,231,185,199,213,202,193,174,166,248)




## Exemplo uniforme

u<-c(0.621, 0.503, 0.203, 0.477, 0.710, 0.581, 0.329, 0.480, 0.554, 0.382)

n<-length(u)

cdf.u<-ecdf(u)

cbind(sort(unique(u)),cdf.u(sort(unique(u))),sort(u)-cdf.u(sort(unique(u))))


tobs<-max(abs(sort(u)-cdf.u(sort(unique(u)))))


plot(cdf.u,main="",xlim=c(0,1.3),lwd=2)
curve(punif(x),0,1.3,add=T,col=2,lwd=2)



cdf.aux<-empirical_cdf(u,sort(u))

L=pmax(cdf.aux$CDF-.409, 0)
U=pmin(cdf.aux$CDF+.409, 1)


epsilon_i = sqrt(log(2/0.05)/(2*n))

L=pmax(cdf.aux$CDF-epsilon_i, 0)
U=pmin(cdf.aux$CDF+epsilon_i, 1)




plot(cdf.u,main="",xlim=c(0,1),lwd=2)
curve(punif(x),0,1.3,add=T,col=2,lwd=2)
lines(cdf.aux$UpperBound, U, col="blue",type = "s",lty=2)
lines(cdf.aux$UpperBound, L, col="blue",type = "s",lty=2)


valorp<-2*tobs*sum(choose(n,0:7)*((1-tobs-(0:7)/10)^(n-(0:7)))*((tobs+(0:7)/n)^((0:7)-1)))



## Exemplo 2 (pág. 437 Conover (1999))

x<-c(1,1,1,2,2,2,3,3,3,3)

n<-length(x)

F0<-(1:5)/5

Fn<-ecdf(x)

plot(Fn,main="",lwd=2,xlim=c(0,5))
lines(F0,type="s",col=2,lwd=2)




data.frame(x=sort(unique(x)),Fn=Fn(sort(unique(x))),F0=unique(F0[x]))

T<-max(abs(unique(F0[x])-Fn(sort(unique(x)))))

j<-0:(floor(n*(1-T))-1)

f0<-F0[unique(x[which(1-T==F0[x])])]




ks.test(u,punif,0,1,alternative = "less")



## Exemplo 3 (pag. 439 Conover(1999))

x<-c(16.7,17.4,18.1,18.2,18.8,19.3,22.4,24,24.7,25.7,27,35.1,35.8,36.5,37.6,39.8,42.1,43.2,46.2)




plot(ecdf(1:10),main="",lwd=2)
curve(ppois(x,10),0,12,add=T,col=2,lwd=2)


ks.test(1:10,ppois,5,alternative = "greater")




## Exercício 2-4 Pag. 441 (Conover (1999))


x<-c(4,0,2,0,2,0,2,0)

n<-length(x)

Fn<-ecdf(x)

plot(Fn,main="")
curve(ppois(x,1.5),0,6,add=T,col=2,lwd=2)



tobs<-Fn(0)-ppois(0,1.5)


valorpK<-function(tobs,n,bilateral=T){

k<-floor(n*(1-tobs))  
  
if(bilateral==T){         
         
 min(1,2*tobs*sum(choose(n,0:k)*((1-tobs-(0:k)/n)^(n-(0:k)))*((tobs+(0:k)/n)^((0:k)-1))))

}else{
  
  tobs*sum(choose(n,0:k)*((1-tobs-(0:k)/n)^(n-(0:k)))*((tobs+(0:k)/n)^((0:k)-1)))
  
}

  
}


valorpK(tobs,n)




floor(8*(1-T))

1-T



## Exemplo 1 pag. 444 Conover (1999)


x<-c(23, 23, 24, 27, 29, 31, 32, 33, 33, 35,
     36, 37, 40, 42, 43, 43, 44, 45, 48, 48,
     54, 54, 56, 57, 57, 58, 58, 58, 58, 59,
     61, 61, 62, 63, 64, 65, 66, 68, 68, 70,
     73, 73, 74, 75, 77, 81, 87, 89, 93, 97)


z<-round((x-mean(x))/sd(x),2)


n<-length(x)

Fn<-ecdf(z)

plot(Fn,main="",cex.lab=1.2,cex.axis=1.5,ylab = expression(F[n](z)),xlab="z")
curve(pnorm(x),-3,3,add=T,col=2,lwd=2)


nsim<-20000





#cbind(data.frame(Phi=pnorm(sort(z)),Fn=Fn(sort(z)),D=abs(pnorm(sort(z))-Fn(sort(z)))[1:10,],data.frame(Phi=pnorm(z),Fn=Fn(z),D=abs(pnorm(z)-Fn(z)))[11:20,],data.frame(Phi=pnorm(z),Fn=Fn(z),D=abs(pnorm(z)-Fn(z)))[21:30,],data.frame(Phi=pnorm(z),Fn=Fn(z),D=abs(pnorm(z)-Fn(z)))[31:40,],data.frame(Phi=pnorm(z),Fn=Fn(z),D=abs(pnorm(z)-Fn(z)))[41:50,])

data.frame(z,Phi=pnorm(sort(z)),Fn=Fn(sort(z)),D=abs(pnorm(sort(z))-Fn(sort(z))))


empirical_cdf(z,sort(z))


T1<-max(abs(pnorm(z)-Fn(z)))


T1<-abs(Fn(-.06)-pnorm(-.05))


require(nortest)


lilitest<-lillie.test(x)

## Quantil aproximado (simulação de Monte Carlo)

n<-50

n_sim<-20000

T_amos<-c()

for(i in 1:n_sim){
  
  amos<-rnorm(n)
  T_amos[i]<-lillie.test(amos)$"statistic"
  
}


hist(T_amos)

quantile(T_amos,.95)

mean(T_amos>lillie.test(x)$"statistic")


length(cumsum(table(x))/n)


p <- pnorm(z)
Dplus <- max((1:n)/n - p)
Dminus <- max(p - ((1:n) - 1)/n)

max(Dplus,Dminus)


table(x)

## QQ plot com bandas de confiança



nsim <- 100 # Número de simulações
conf <- 0.95 # Coef. de confiança
# Dados simulados ~ normal
dadossim <- matrix(rnorm(length(n) * nsim, mean = mean(x), sd = sd(x)), nrow = length(x))
dadossim <- apply(dadossim, 2, sort)
# Limites da banda e média
infsup <- apply(dadossim, 1, quantile, probs = c((1 - conf) / 2,
                                                 (1 + conf) / 2))
xbsim <- rowMeans(dadossim)
# Gráfico
faixay <- range(x, dadossim)
qq0 <- qqnorm(x, main = "", xlab = "Quantis teóricos", pch = 20,
              ylab = "Quantis Empíricos", ylim = faixay)
eixox <- sort(qq0$x)
lines(eixox, xbsim,lty=2)
lines(eixox, infsup[1,])
lines(eixox, infsup[2,])



y <- rt(200, df = 5)
qqnorm(y); qqline(y, col = 2)
qqplot(y, rt(300, df = 5));qqline(y, col = 2)






x<-c(5,20,10,5,40,30,20,5,10,15,10,30,40,10,50,10,30, 15, 20, 40, 10, 20, 20 , 50 , 10, 40, 30, 20, 0, 30)

sort(x)


table(x)



## Exemplo 2 pag. 449 Conover (1999)


x<-c(1,2,3,4,6,6,6,8,10,11)

xbar<-mean(x)

z<-x/xbar

n<-length(x)

Fn<-ecdf(z)

plot(Fn,main="")
curve(pexp(x,1),0,3,add=T,col=2,lwd=2)



p <- pexp(z)
Dplus <- max((1:length(x))/n - p)
Dminus <- max(p - ((1:length(x)) - 1)/n)


require(KScorrect)


LcKS(x,"pexp")$p.value

#x<-rexp(10,rate=1/5.7)


qqplot(x, rexp(300,1/mean(x)));qqline(x, col = 2,distribution = function(p){qexp(p,rate=1/mean(x))})


n_sim<-20000

T_amos<-c()

for(i in 1:n_sim){
  
  amos<-rexp(n)
  
  p <- pexp(amos)
  Dplus <- max((1:length(x))/n - p)
  Dminus <- max(p - ((1:length(x)) - 1)/n)
  
  
  T_amos[i]<-max(Dplus,Dminus)
  
}


hist(T_amos)

quantile(T_amos,.95)

mean(T_amos>LcKS(x,"pexp")$D.obs)






## QQ plot com bandas de confiança


#x<-runif(20,10,20)


nsim <- 100 # Número de simulações
conf <- 0.95 # Coef. de confiança
# Dados simulados ~ exponencial
dadossim <- matrix(rexp(length(x) * nsim, rate=1/mean(x)), nrow = length(x))
dadossim <- apply(dadossim, 2, sort)
# Limites da banda e média
infsup <- apply(dadossim, 1, quantile, probs = c((1 - conf) / 2,
                                                 (1 + conf) / 2))
xbsim <- rowMeans(dadossim)
# Gráfico
faixay <- range(x, dadossim)
qq0 <- qqplot(x,rexp(nsim,1/mean(x)), main = "", xlab = "Quantis Amostrais", pch = 20,
              ylab = "Quantis Teóricos", ylim = faixay)
eixox <- sort(qq0$x)
lines(eixox, xbsim,lty=2)
lines(eixox, infsup[1,])
lines(eixox, infsup[2,])


## Teste de Shapiro & Wilk (1965)

r<-1

n<-10

alpha<-.375

x<-rnorm(n)

m<-mean(x)


sqrt(gamma(.5*n)/sqrt(2*gamma(.5*(n+1))))


-qnorm((r-n)/(n-2*alpha+1))


ai<-function(r,n,x){
#  h<-.025
#  x<- -9*h*9
  t0<-x
  t1<-log(1-pnorm(x))
  t2<-log(pnorm(x))
  t3<- -.5*(log(2*pi)+x^2)
  
  return(t0*exp(log(factorial(n))-log(factorial(n-r))-log(factorial(r-1))+(r-1)*t1+(n-r)*t2+t3))
  
  
}

aux<-ai(2,10,seq(-9,9,by=.025))

m<-.025*sum(aux[is.nan(aux)==F])




x<-c(23, 23, 24, 27, 29, 31, 32, 33, 33, 35,
     36, 37, 40, 42, 43, 43, 44, 45, 48, 48,
     54, 54, 56, 57, 57, 58, 58, 58, 58, 59,
     61, 61, 62, 63, 64, 65, 66, 68, 68, 70,
     73, 73, 74, 75, 77, 81, 87, 89, 93, 97)





n<-length(x)

n_sim<-20000

T_amos<-c()

for(i in 1:n_sim){
  
  amos<-rnorm(n,mean(x),sd(x))
  T_amos[i]<-shapiro.test(amos)$statistic
  
}


hist(T_amos)

quantile(T_amos,.05)

mean(T_amos<shapiro.test(x)$statistic)


x<-rnorm(1000)

shapiro.test(x)




##================== Comparação de testes =====================================##
  
require(nortest)


# População Normal

#prob rej h0 ado h0 vdd

#h0 amostra normal
#h1 nao normal

#sgifnificancia 5%
alpha<-.05
#tamanhos amostra
n<-c(20,30,40,50)
#num simulacoes
nsim<-10000
#sob h0 hiotese normalidade
#simular pop N 0,1
popNormal<-rnorm(1000)
#matriz quantis criticos p cada tam amostra e teste
#baseao tabelas
qmat<-rbind(c(.905,.927,.94,.947),c(.192,.159,.895/(sqrt(n[3])-.01+.83/sqrt(n[3])),.895/(sqrt(n[4])-.01+.83/sqrt(n[4]))),
c(.294,.242,.21,1.36/sqrt(n[4])))

curve(dnorm(x),-4,4)

#matriz contem poderes observados cada teste
poderNormal<-matrix(NA,4,length(n))

#comparar testes normalidade pelo nivel signif
#estabelecendo casa regiao crit
for (i in 1:length(n)) {
  #retirar amostras pop normal p cada tam amostra dado la em cima
  #10k amostras de tam 20, 30 ....
  dadosNormal<-replicate(nsim,sample(popNormal,n[i]))  
  #teste assintotico
  df<-pearson.test(dadosNormal[,1])$df
  
  #determinar estat teste e contar proporcao vezes estatistica teste < quantil
  poderNormal[,i]<-c(
    #shapiro wilk
    #sem dist exata
    mean(apply(dadosNormal, 2, function(x){shapiro.test(x)$statistic})<=qmat[1,i]),
    #lilliefors
    #sem dist exata
    mean(apply(dadosNormal, 2, function(x){lillie.test(x)$statistic})>=qmat[2,i]),
    #kolmogorov
    mean(apply(dadosNormal, 2, function(x){ks.test(x,"pnorm",mean(x),sd(x))$statistic})>=qmat[3,i]),
    #chi quadrado
    mean(apply(dadosNormal, 2, function(x){pearson.test(x)$statistic})>=qchisq(1-alpha,df)))
  
  
  
}

#tratamento tabela
row.names(poderNormal)<-c("Shapiro-Wilk","Lilliefors","Kolmogorov","Qui-Quadrado")
colnames(poderNormal)<-paste("n=",n,sep="")

#tabela poder normal possui proporcoes 
#signifiancia emppirico 
#ideal é estar prox ao nominal (0.05), teorico fixado a priori
#avalio se estao proximos

#p SW esta prox ate n=40 depois subestima
#lilliefors retorna mais prox do nominal comparando aos demais
#Kolmogorov  foi pior
#Chi quadrado supera kolmogorov performance parecia com lilliefors, principalmente
#nas amostras maiores

#comparar valor-p pra nao ter interferencia valor crit


#poder é prob de rej H0 dado H1
#prob rej H0 corretamente

#simular H1

## =========== IGNORAR
#pearson.test(x)$df
#apply(dadosNormal, 2, function(x){pearson.test(x)$df})
## ================

#fazendo entao sensibilidade de rej corretamente h0
#sim sob h1

#População Beta

alpha<-.05

n<-c(20,30,40,50)

nsim<-10000

popBeta<-rbeta(1000,2,2)

curve(dbeta(x,2,2))

poderBeta<-matrix(NA,4,length(n))

for (i in 1:length(n)) {
  
#dadosBeta <- matrix(rbeta(n[i] * nsim, 2,2), nrow = n[i])

dadosBeta<-replicate(nsim,sample(popBeta,n[i]))  

poderBeta[,i]<-c(

mean(apply(dadosBeta, 2, function(x){shapiro.test(x)$p.value})<=alpha),

mean(apply(dadosBeta, 2, function(x){lillie.test(x)$p.value})<=alpha),

mean(apply(dadosBeta, 2, function(x){ks.test(x,"pnorm",mean(x),sd(x))$p.value})<=alpha),

mean(apply(dadosBeta, 2, function(x){pearson.test(x)$p.value})<=alpha))



# df<-pearson.test(dadosBeta[,1])$df
# 
# poderBeta[,i]<-c(
#   
#   mean(apply(dadosBeta, 2, function(x){shapiro.test(x)$statistic})<=qmat[1,i]),
#   
#   mean(apply(dadosBeta, 2, function(x){lillie.test(x)$statistic})>=qmat[2,i]),
#   
#   mean(apply(dadosBeta, 2, function(x){ks.test(x,"pnorm",mean(x),sd(x))$statistic})>=qmat[3,i]),
#   
#   mean(apply(dadosBeta, 2, function(x){pearson.test(x)$statistic})>=qchisq(1-alpha,df)))
# 





}

#se o teste tem boa sensibilidae espero que rejeite muito
#o que atesta que nao e normal
# se poder e alto, ele rejeita corretamente
row.names(poderBeta)<-c("Shapiro-Wilk","Lilliefors","Kolmogorov","Qui-Quadrado")
colnames(poderBeta)<-paste("n=",n,sep="")


#poder geral baixo pros 4
#n=20 melhor foi chi e sw*
#em geral sw melhor geral
#pior kolmogorov
#amostras maiores aumentam rejeicao e deixaram parecidos

#poder baixo dos testes se deve a 
#desvio da normalidade pequeno
#poder descriminativo relacionado c a pop

#similaridade

# População Gama

alpha<-.05

n<-c(20,30,40,50)

nsim<-10000

popGama<-rgamma(1000,2,1)

curve(dgamma(x,2,1),0,10)

poderGama<-matrix(NA,4,length(n))

for (i in 1:length(n)) {
  
  dadosGama<-replicate(nsim,sample(popGama,n[i]))  
  
  poderGama[,i]<-c(
    
    mean(apply(dadosGama, 2, function(x){shapiro.test(x)$p.value})<=alpha),
    
    mean(apply(dadosGama, 2, function(x){lillie.test(x)$p.value})<=alpha),
    
    mean(apply(dadosGama, 2, function(x){ks.test(x,"pnorm",mean(x),sd(x))$p.value})<=alpha),
    
    mean(apply(dadosGama, 2, function(x){pearson.test(x)$p.value})<=alpha))
  
  
  
}


row.names(poderGama)<-c("Shapiro-Wilk","Lilliefors","Kolmogorov","Qui-Quadrado")
colnames(poderGama)<-paste("n=",n,sep="")

#pop assimetrica
#curtose

#poder aumentou consideravelmente
#sw melhor ate em  n pequeno, na maior prox a 1
#Kolmogorov pior


# População t Student

alpha<-.05

n<-c(20,30,40,50)

nsim<-10000

popTStudent<-rt(1000,1)


curve(dt(x,1),-3,3)

poderTStudent<-matrix(NA,4,length(n))

for (i in 1:length(n)) {
  
  
  dadosTStudent<-replicate(nsim,sample(popTStudent,n[i]))  
  
  poderTStudent[,i]<-c(
    
    mean(apply(dadosTStudent, 2, function(x){shapiro.test(x)$p.value})<=alpha),
    
    mean(apply(dadosTStudent, 2, function(x){lillie.test(x)$p.value})<=alpha),
    
    mean(apply(dadosTStudent, 2, function(x){ks.test(x,"pnorm",mean(x),sd(x))$p.value})<=alpha),
    
    mean(apply(dadosTStudent, 2, function(x){pearson.test(x)$p.value})<=alpha))
  
  
  
}


row.names(poderTStudent)<-c("Shapiro-Wilk","Lilliefors","Kolmogorov","Qui-Quadrado")
colnames(poderTStudent)<-paste("n=",n,sep="")



# População Log-Normal

alpha<-.05

n<-c(20,30,40,50)

nsim<-10000

popLNormal<-rlnorm(1000)


curve(dlnorm(x),0,5)


poderLNormal<-matrix(NA,4,length(n))

for (i in 1:length(n)) {
  
  dadosLNormal<-replicate(nsim,sample(popLNormal,n[i]))  
  
  poderLNormal[,i]<-c(
    
    mean(apply(dadosLNormal, 2, function(x){shapiro.test(x)$p.value})<=alpha),
    
    mean(apply(dadosLNormal, 2, function(x){lillie.test(x)$p.value})<=alpha),
    
    mean(apply(dadosLNormal, 2, function(x){ks.test(x,"pnorm",mean(x),sd(x))$p.value})<=alpha),
    
    mean(apply(dadosLNormal, 2, function(x){pearson.test(x)$p.value})<=alpha))
  
  
  
}


row.names(poderLNormal)<-c("Shapiro-Wilk","Lilliefors","Kolmogorov","Qui-Quadrado")
colnames(poderLNormal)<-paste("n=",n,sep="")


# require(combinat)
# 
# require(arrangements)
# 
# n<-100
# 
# prob<-c(1/4,1/2,1/4)
# 
# arranjos<-permutations(0:n,k=length(prob),replace = T)
# 
# arranjos<-arranjos[apply(arranjos,1,sum)==n,]
# 
# 
# O<-c(26,45,29)  
#   
# E<-n*prob
# 
# Q<-sum(((O-E)^2)/E)
# 
# 
# 
# Qvec<-apply(arranjos,1,function(x){sum(((x-E)^2)/E)})
# 
# hist(Qvec)
# 
# quantile(Qvec,.95)
# 
# mean(Qvec>=Q)












## Distribuição Nula de Q
#tam amostra
n<-100
#observado
O<-c(26,45,29)
#prob esperada
prob<-c(.25,.5,.25)
#vetor de esperados
E<-n*prob
#estat teste
Qobs<-sum(((O-E)^2)/E)

#monte carlo, simulacao de possiveis alocacoes
#param: replicas, tam amostra, probs
#cada col é uma simulacao
amosQ<-rmultinom(20000,n,c(.25,.5,.25))
#checando soma = 100
apply(rmultinom(20000,n,c(.25,5,.25)),2,sum)
#estat teste pra cada um
Qvec<-apply(amosQ,2,function(x){sum(((x-E)^2)/E)})
#hist estatisticas
hist(Qvec)
#determinando regiao critica
quantile(Qvec,.95)
#valor p
mean(Qvec>=Qobs)




## Teste de Smirnov

x<-c(7.6,8.4,8.6,8.7,9.3,9.9,10.1,10.6,11.2)
n<-length(x)

y<-c(5.2,5.7,5.9,6.5,6.8,8.2,9.1,9.8,10.8,11.3,11.5,12.3,12.5,13.4,14.6)
m<-length(y)

plot(Fy,col=2,main="")
plot(Fx,a=T)

Fx<-ecdf(x)
Fy<-ecdf(y)
legend("topleft",c("A","B"),col=c(1,2),lty=c(1,1),lw=2)

max(abs(Fx(1:max(n,m))-Fy(1:max(n,m))))

ks.test(x,y)

## Estatística de Cramér-von Mises

cramerStat<-function(x,y){
  
  n<-length(x);m<-length(y)  
  
  Fx<-ecdf(x);Fy<-ecdf(y)  
  
  return(((m*n)/((m+n)^2))*(sum((Fx(x)-Fy(x))^2) + sum((Fx(y)-Fy(y))^2)))
  
}

T2<-cramerStat(x,y)



plot(Fy,col=2,main="")
plot(Fx,add=T)
legend("topleft",c("X","Y"),col = c(1,2),lty = c(1,1),lwd=2)

ks.test(x,y)


x<-c(7.49,7.35,7.54,7.48,7.48,7.37,7.51,7.5,7.52,7.46)
n<-length(x)

y<-c(7.28,7.35,7.52,7.5,7.38,7.48,7.31,7.22,7.41,7.45)
m<-length(y)


Fx<-ecdf(x)
Fy<-ecdf(y)


plot(Fy,col=2,main="")
plot(Fx,add=T)
legend("topleft",c("A","B"),col = c(1,2),lty = c(1,1),lwd=2)


ks.test(x,y)


xtable(data.frame(x=x[1:5],x=x[6:10],y=y[1:5],y=y[6:10]))


cumsum(table(x))/n

cumsum(table(y))/m


aux<-c(rep("x",3),rep("y",2))

combn(5,2)

sort(c(x,y))


permutations(aux)

combinations(aux,3)

aux2<-c(23,31,37,46,49,55,57)

combinations(aux2,3)



## Permutation test


aux<-1:5

trat1<-combinations(aux,3)

trat2<-combinations(aux,2)



x<-c(16.55,15.36,15.94,16.43,16.01)
n<-length(x)

y<-c(16.05,15.98,16.1,15.88,15.91)
m<-length(y)



x<-c(7.6,8.4,8.6,8.7,9.3,9.9,10.1,10.6,11.2)
n<-length(x)

y<-c(5.2,5.7,5.9,6.5,6.8,8.2,9.1,9.8,10.8,11.3,11.5,12.3,12.5,13.4,14.6)
m<-length(y)


T1<-ks.test(x,y)$statistic




aux<-c(x,y)

require(arrangements)

trats<-permutations(c(1,2),freq = c(n,m))


Damos<-apply(trats,1,function(x){ks.test(split(aux,x)$'1',split(aux,x)$'2')$statistic})

Damos<-apply(trats,1,function(x){cramerStat(split(aux,x)$'1',split(aux,x)$'2')})



freqDist<-table(Damos)

probDist<-prop.table(freqDist)


valorp<-sum(prop.table(table(Damos))[2:length(probDist)])

require(twosamples)

popNormal1<-rnorm(10000,10,2)

popNormal2<-rnorm(10000,10,6)

popExp1<-rexp(10000,rate=1/10)

curve(dexp(x,rate = 1/10),0,25)


x<-sample(popNormal1,50)
y<-sample(popExp1,50)



n<-length(x);m<-length(y)

t.test(x,y)

ks.test(x,y)

cvm_test(x,y)



#cramerStat(x,y)
#cvm_stat(x,y)*((m*n)/((m+n)^2))


# População Normal (variâncias diferentes)

alpha<-.05

n<-c(20,30,40,50)

nsim<-1000

popNormal1<-rnorm(10000,10,2)

popNormal2<-rnorm(10000,10,6)

popExp1<-rexp(10000,rate=1/10)

popUnif<-runif(10000,0,20)

popGama<-rgamma(10000,40,rate = 4)


curve(dnorm(x,10,2),3,18)

curve(dgamma(x,40,rate=4),.7,20)


poderNormal<-matrix(NA,3,length(n))

contNormal<-matrix(NA,nsim,3)

begin<-Sys.time()

print(begin)


for(i in 1:length(n)){
  
  
  dados1<-replicate(nsim,sample(popNormal1,n[i]))  
  dados2<-replicate(nsim,sample(popExp1,n[i])) 
  
  
  for(j in 1:nsim){
       
    
  contNormal[j,1]<-t.test(dados1[,j],dados2[,j])$"p.value"<=alpha
  contNormal[j,2]<-ks.test(dados1[,j],dados2[,j])$"p.value"<=alpha
  contNormal[j,3]<-cramerStat(dados1[,j],dados2[,j])>.461    
  #contNormal[j,3]<-cvm_test(dados1[,j],dados2[,j])[2]<=alpha    
  
  print(j)  
    
  }
  
  poderNormal[,i]<-apply(contNormal,2,mean)

}

end<-Sys.time()

end

print(end-begin)



row.names(poderNormal)<-c("TStudent","Smirnov","CramerMises")
colnames(poderNormal)<-paste("n=",n,sep="")










