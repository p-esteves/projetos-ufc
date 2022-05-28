n1=N*0.4
n1=12
n2=N2*0.3
n3a=N3*0.20
n3=20
n4=N4*0.40
require(TeachingSampling)

set.seed(1612)
N=length(es1$k)
amos1=S.SI(N,n1)
a=es1[amos1,]
a$k
yk1=a$yk
p1=E.SI(N,n1,yk1)

set.seed(1612)
N2=length(es2$k)
amos2=S.SI(N2,n2)
b=es2[amos2,]
b$k
yk2=b$yk
p2=E.SI(N2,n2,yk2)

set.seed(1612)
N3=length(es3$k)
amos3=S.SI(N3,n3)
c=es3[amos3,]
c$k
yk3=c$yk
p3=E.SI(N3,n3,yk3)


set.seed(1612)
N4=length(es4$k)
amos4=S.SI(N4,n4)
d=es4[amos4,]
d$k
yk4=d$yk
p4=E.SI(N4,n4,yk4)


t1=p1[1,2]
var1=230.57266^2

t2=13310
var2=2326.82593^2

t3=7665
var3=1453.19648^2

t4=14885
var4=2460.29419^2

t=p1[1,2]+p2[1,2]+p3[1,2]+p4[1,2]
var=p1[2,2]^2+p2[2,2]^2+p3[2,2]^2+p4[2,2]^2




x=c(2.1429,1.4286,4,0.8333,1.4286,0.4,0.5333,1.5381)
var(x)
