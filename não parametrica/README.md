# Análise de Estatística Não Paramétrica em R

Este repositório contém um script em R que explora diversos métodos e conceitos da estatística não paramétrica. O código serve como um guia prático, demonstrando a implementação de testes de aderência, testes de normalidade, e testes de duas amostras, além de uma análise de poder comparativa entre diferentes testes.

---

## 📜 Conteúdo do Script

O script está organizado em várias seções, cada uma focada em uma técnica específica.

### 1. Função de Distribuição Acumulada Empírica (ECDF)

A análise começa com o conceito fundamental da ECDF, que é uma aproximação da função de distribuição acumulada (CDF) verdadeira de uma variável aleatória.

-   **Cálculo e Visualização**: Demonstra como calcular a ECDF usando a função `ecdf()` e como visualizá-la com o `plot()` base do R e também com o pacote `ggplot2`.
-   **Bandas de Confiança**: O script calcula e plota as bandas de confiança para a ECDF utilizando a desigualdade de **Dvoretzky–Kiefer–Wolfowitz (DKW)**. Essas bandas criam uma região onde a CDF teórica verdadeira deve se encontrar com um determinado nível de confiança.



---

### 2. Testes de Aderência (Goodness-of-Fit)

Esta seção foca em testar se uma amostra de dados segue uma distribuição teórica específica.

-   **Teste de Kolmogorov-Smirnov (K-S)**:
    -   É usado para comparar a ECDF da amostra com uma CDF teórica (ex: Uniforme, Poisson).
    -   A estatística de teste é a **maior diferença vertical** entre a ECDF e a CDF teórica.
    -   O script inclui exemplos com a distribuição Uniforme e Poisson, além de uma função customizada (`valorpK`) para calcular o p-valor exato do teste.
    -   A função `ks.test()` é utilizada para a implementação padrão.

---

### 3. Testes de Normalidade

Uma aplicação comum de testes de aderência é verificar se os dados seguem uma distribuição Normal. Isso é crucial para decidir se métodos paramétricos (que assumem normalidade) podem ser utilizados.

-   **Teste de Lilliefors**: Uma correção do teste K-S para o caso em que a média e o desvio padrão da distribuição Normal **não são conhecidos** e precisam ser estimados a partir da amostra. O código usa `lillie.test()` do pacote `nortest`.
-   **Teste de Shapiro-Wilk**: Considerado um dos testes de normalidade mais poderosos, especialmente para amostras pequenas. É implementado com a função `shapiro.test()`.
-   **Q-Q Plot com Bandas de Confiança**: Além dos testes formais, o script demonstra como criar um gráfico Quantil-Quantil (Q-Q Plot) para inspecionar visualmente a normalidade. As bandas de confiança no gráfico são geradas via simulação de Monte Carlo para ajudar a avaliar se os desvios da linha de referência são estatisticamente significativos.
-   **Teste de Aderência para Exponencial**: De forma análoga, o script também mostra como testar se os dados seguem uma distribuição Exponencial usando o `LcKS()` do pacote `KScorrect`.



---

### 4. Comparação de Poder dos Testes de Normalidade

Esta é a seção mais avançada do script. Ela implementa uma **simulação de Monte Carlo** para comparar a performance (o **poder estatístico**) de quatro testes de normalidade diferentes: Shapiro-Wilk, Lilliefors, Kolmogorov-Smirnov e Qui-Quadrado de Pearson.

-   **Metodologia**:
    1.  **Nível de Significância (H₀ Verdadeira)**: Milhares de amostras são geradas de uma população **realmente Normal**. A proporção de vezes que cada teste rejeita (incorretamente) a hipótese nula é calculada. O ideal é que essa proporção seja próxima do nível de significância nominal (α = 0.05).
    2.  **Poder do Teste (H₁ Verdadeira)**: Milhares de amostras são geradas de populações **não-normais** (Beta, Gama, t-Student, Log-Normal). O poder é a proporção de vezes que cada teste rejeita (corretamente) a hipótese de normalidade.
-   **Conclusão**: A simulação permite avaliar qual teste é mais sensível para detectar desvios da normalidade sob diferentes cenários (distribuições simétricas de cauda pesada, distribuições assimétricas, etc.).

---

### 5. Testes Não Paramétricos para Duas Amostras

A parte final do script aborda métodos para comparar duas amostras independentes e testar se elas vieram da mesma distribuição.

-   **Teste de Kolmogorov-Smirnov para Duas Amostras**: Compara as ECDFs das duas amostras. A estatística de teste é a maior diferença vertical entre as duas ECDFs.
-   **Teste de Cramér-von Mises**: Uma alternativa ao K-S que, em vez de usar apenas a diferença máxima, usa uma medida integrada de todas as diferenças entre as duas ECDFs, sendo frequentemente mais poderoso.
-   **Teste de Permutação**: Um método computacionalmente intensivo que constrói a distribuição nula da estatística de teste (ex: a estatística K-S) embaralhando os rótulos dos grupos milhares de vezes. É um método muito robusto e intuitivo.
-   **Comparação de Poder**: O script finaliza com uma estrutura de simulação para comparar o poder do Teste T de Student (paramétrico) com os testes K-S e Cramér-von Mises (não paramétricos) em cenários onde as suposições do Teste T podem ser violadas.
