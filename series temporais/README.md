# Análise de Séries Temporais com SAS

Este repositório contém scripts em SAS (`.sas`) para a análise avançada de séries temporais. O código aborda desde a simulação de processos com quebras estruturais e heterocedasticidade condicional até a modelagem e previsão de dados reais utilizando modelos **ARIMA, SARIMA e GARCH**.

## Estrutura do Projeto

O código está dividido nas seguintes análises principais:

1.  [Simulação e Modelagem de Séries com Efeitos ARCH/GARCH](#1-simulação-e-modelagem-de-séries-com-efeitos-archgarch)
2.  [Simulação de um Processo AR(2)-GARCH(1,1)](#2-simulação-de-um-processo-ar2-garch11)
3.  [Simulação de um Processo GARCH(1,1) Puro](#3-simulação-de-um-processo-garch11-puro)
4.  [Análise de Dados Reais: `sashelp.air`](#4-análise-de-dados-reais-sashelpair)
5.  [Análise de Dados Reais: Séries Trimestrais e Mensais](#5-análise-de-dados-reais-séries-trimestrais-e-mensais)

---

### 1. Simulação e Modelagem de Séries com Efeitos ARCH/GARCH

Esta seção demonstra como identificar e modelar a volatilidade variável (heterocedasticidade) em uma série temporal.

-   **Geração de Dados (`data a`):**
    -   É simulada uma série temporal (`y`) com uma tendência linear (`0.5 * time`).
    -   Intencionalmente, a variância dos resíduos é duplicada no intervalo de tempo entre `t=60` e `t=90`. Isso cria um **efeito ARCH** (Heterocedasticidade Condicional Autoregressiva) artificial na série.

-   **Primeira Tentativa de Modelagem (`proc arima`):**
    -   Uma tentativa inicial de ajustar um modelo ARIMA padrão é feita. O resultado, como esperado, é um ajuste ruim, pois o modelo não captura a mudança na variância.
    -   Os resíduos do modelo são então analisados. A análise dos resíduos ao quadrado (`res2`) e os testes formais (`proc autoreg ... archtest`) confirmam a presença de efeitos ARCH, rejeitando a hipótese de variância constante (homocedasticidade).

-   **Modelagem com GARCH (`proc autoreg`):**
    -   Para corrigir o problema, um modelo **GARCH(1,1)** é ajustado. Este modelo consegue modelar tanto a média da série (regredindo `y` contra `time`) quanto a sua variância condicional.
    -   Ao final, um gráfico compara o desvio-padrão real (simulado) com o desvio-padrão previsto pelo modelo GARCH, mostrando a eficácia do ajuste em capturar os "clusters de volatilidade".

### 2. Simulação de um Processo AR(2)-GARCH(1,1)

Esta parte aprofunda a simulação, criando uma série mais complexa.

-   **Geração de Dados (`data c`):**
    -   Uma nova série é gerada onde o termo de erro (`u`) segue um processo **autorregressivo de ordem 2 (AR(2))**.
    -   Além disso, a variância deste erro também é modelada por um processo **GARCH(1,1)**.
    -   A série final (`y`) é composta por uma tendência, o erro AR(2) e a variância GARCH.

-   **Identificação e Modelagem (`proc autoreg`):**
    -   O código demonstra como identificar e ajustar o modelo correto para essa série complexa, utilizando a instrução `model y = t / nlag=2 garch=(q=1,p=1)`, que especifica corretamente a estrutura AR(2) e GARCH(1,1) dos resíduos.

### 3. Simulação de um Processo GARCH(1,1) Puro

Aqui, o foco é simular uma série sem tendência, cujo comportamento é governado unicamente por um processo GARCH.

-   **Geração de Dados (`data normal`):**
    -   Os parâmetros clássicos do GARCH ($\omega, \alpha, \beta$) são definidos em macro variáveis.
    -   A série é gerada iterativamente, onde a variância em cada ponto do tempo (`h`) depende da variância e do resíduo ao quadrado do período anterior, conforme a equação GARCH(1,1).
    -   A série final (`y`) é simplesmente um intercepto mais o erro com variância GARCH.

-   **Validação do Modelo (`proc autoreg`):**
    -   O `archtest` confirma a presença dos efeitos GARCH que foram inseridos na simulação.
    -   O ajuste de um modelo `garch=(q=1, p=1)` recupera com sucesso os parâmetros utilizados na geração dos dados, validando a capacidade do `PROC AUTOREG` de estimar o processo.

### 4. Análise de Dados Reais: `sashelp.air`

Esta seção aplica as técnicas de modelagem ARIMA em um dos datasets mais clássicos para estudos de séries temporais: o número de passageiros de avião (`sashelp.air`).

-   **Pré-processamento:**
    -   A variância da série cresce junto com o nível. Para estabilizá-la, é aplicada uma **transformação de log**.
    -   A série apresenta uma clara tendência de crescimento e uma forte **sazonalidade** anual.
-   **Identificação e Modelagem (`proc arima`):**
    -   Para tornar a série estacionária, são aplicadas duas diferenciações: uma **diferenciação regular** (`d=1`) para remover a tendência e uma **diferenciação sazonal** (`D=1` com período 12) para remover o efeito anual.
    -   Com base nas funções de autocorrelação (FAC) e autocorrelação parcial (FACP) da série diferenciada, um modelo **SARIMA (ARIMA Sazonal)** é identificado e estimado.
-   **Previsão (`forecast`):**
    -   O modelo ajustado é utilizado para gerar previsões futuras, com seus respectivos intervalos de confiança de 95%.
    -   Um gráfico final mostra a série original, os valores previstos pelo modelo e os limites de confiança, ilustrando a qualidade do ajuste.

### 5. Análise de Dados Reais: Séries Trimestrais e Mensais

As duas últimas seções aplicam a mesma metodologia SARIMA a outros dois conjuntos de dados.

-   **Série Trimestral (`data d`):**
    -   Uma série temporal trimestral é inserida diretamente no código.
    -   A análise segue os passos de identificação (diferenciação regular e sazonal com lag 4), estimação de um modelo SARIMA e geração de previsões.

-   **Série de Nascimentos (`data nasc`):**
    -   Dados mensais de nascimentos são lidos e transformados do formato "largo" (um ano por linha) para o formato "longo" (uma observação por mês).
    -   Um modelo SARIMA(p,d,q)(P,D,Q)s com sazonalidade `s=12` é ajustado para capturar a dinâmica da série e realizar previsões.
