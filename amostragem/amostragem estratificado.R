library(readr)
dadosestrato <- read_delim("~/ufc/amostragem/Nova pasta/Dados_Estratificado (1).csv", 
                           ";", escape_double = FALSE, trim_ws = TRUE)


estratificado=data.frame(dadosestrato)


#dividindo em estratos baseado na coluna
es1=estratificado[estratificado$Estrato==1,]
es2=estratificado[estratificado$Estrato==2,]
es3=estratificado[estratificado$Estrato==3,]
es4=estratificado[estratificado$Estrato==4,]

#calculo variancias e dps dos x por estrato
v1=var(es1$xk)
dp1=sqrt(v1)

v2=var(es2$xk)
dp2=sqrt(v2)

v3=var(es3$xk)
dp3=sqrt(v3)

v4=var(es4$xk)
dp4=sqrt(v4)

#tamanhos/ numero itens dos estratos
N1=length(es1$k)
N2=length(es2$k)
N3=length(es3$k)
N4=length(es4$k)

#vetor com estes tamanhos acima
N=c(N1,N2,N3,N4)
#vetor com seus desvios padrao
dp=c(dp1,dp2,dp3,dp4)

#calculo de algo
n1=30*N1*dp1/sum(N*dp)
n2=30*N2*dp2/sum(N*dp)
n3=30*N3*dp3/sum(N*dp)
n4=30*N4*dp4/sum(N*dp)

#amostraggem com ou sem rep
#x vetor com possibilidades 
#n tam amostra
# size tam amostra
#vetor probabilidades desses n elementos
#replace T ou R controla se tem reposicao
#?sample


#amostra de algo
set.seed(1612)
sample(c(1:4),3,prob = c(0.940512,.764642,.61528,.679569))

#os calculados acima mas como inteiros
ns1=2
ns2=7
ns3=15
ns4=6

#novamente pegando os tamanhos dos estratos e performando amostras de bernoulli e calculando estimadores
set.seed(1612)
N=length(es1$k)
amos1=S.BE(N,0.4)
a=es1[amos1,]
a$k
yk1=a$yk
E.BE(yk1,0.4)


N2=length(es2$k)
set.seed(1612)
amos2=S.BE(N2,0.3)
b=es2[amos2,]
b$k
yk2=b$yk
E.BE(yk2,0.3)

N3=length(es3$k)
set.seed(1612)
amos3=S.BE(N3,0.20)
c=es3[amos3,]
c$k
yk3=c$yk
E.BE(yk3,0.2)

N4=length(es4$k)
set.seed(1612)
amos4=S.BE(N4,0.40)
d=es4[amos4,]
d$k
yk4=d$yk
E.BE(yk4,0.4)

#pegando resultados estimados e compilando
t1=1137.5
var1=230.57266^2

t2=13310
var2=2326.82593^2

t3=7665
var3=1453.19648^2

t4=14885
var4=2460.29419^2

t=t1+t2+t3+t4
var=var1+var2+var3+var4

set.seed(1612)
sample(c(1:4),2,prob = c(0.0769,0.9231,0.07692,0.2308))
