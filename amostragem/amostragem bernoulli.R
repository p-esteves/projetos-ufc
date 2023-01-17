#script que realiza amostragem de bernoulli com parametros dados
#semente aleatoria
set.seed(404488)

#parametros
p = 0.5 #probabilidade de escolha
N = 20 #tamanho da populacao

#vetor onde os elementos escolhidos ficarao
chosen = c()

#numeros aleatorios
e = runif(N,0,1)
  
#algoritmo
#escolher individuos com ek < p
for(i in 1:N) {
    if(e[i]<p){
      chosen <- c(chosen, i)
      
    }
  }
#chosen
#amostra escolhida e seu tamanho
n=length(chosen);paste0("foram escolhidos ",n," elementos: ");chosen












