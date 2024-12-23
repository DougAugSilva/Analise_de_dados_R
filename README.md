# Analise de dados com R
O conteudo aqui apresentado são anotações feitas durante o curso *Data Analysis with R Programming* que faz parte do *Google Data Analist Certificate*, e tem como o jetivo servir de guia para quem procura realizar analises de conjuntos de dados com a linguagem de programação R.
O conteudo aqui apresentado são funções básicas para importar, realizar uma análise exploratória e plotar gráficos utilizando o pacote *tidyverse*, sendo que os pacotes abordados serão:

 - **ggplot2:** Possui uma variedade de Ferramentas para vcisualização de dados e plotagem de gráficos.
 - **tidyr:** Contém várias ferramentas para a limpeza e copmpreção de dados.
 - **readr:** Usado para importar varios formatos de dados, como por exemplo csv.s' ou arquivos.xlsx.
 - **dplyr:** Oferece uma gama de funções que ajudam na manipuulação e filtragem de dados.

Antes de tudo instale o pacote *tydiverse* utlizando o comando `install.packges("tidyverse")` e posteriormente ative a biblioteca com `library(tidyverse)`.
Como exemplo será utlizado o conjunto de dados *palmerpenguis* que traz informações sobre três espécies de penguins, como por exemplo massa corpórea, tamanho das patas e etc. Este pacote pode ser instaldo por `install.packges("palmerpenguins")` e ativado com `library(palmerpenguins)`.

## 🔎 Análise Exploratória
O primeiro paso a se tomar ao manipular o conjunto de dados é realizar uma análise exploratória, deste modo é possível ter uma idéia basica sobre a estrutura dos dados a serem manipulados, para assim realizar algum tipo de limpeza ou mudança.

- `head`: Retorna apena as 6 primeiras linhjas de um conjunto de dados
  - Sintaxe: `head(penguins)`
- `str`: Nos da informações sobre a estrutura do conjunto de dados, com o nome das colunas e os tipos de dados presentes nelas>:
  - Sintaxe: `str(penguins)`
- `glimpse`: Retorna um resumo do conjunto de daados, com a quantidade de linhas, quantidade de colunas, bem como um exemplo dos dados presentes em cada coluna
  - Sintaxe: `glimpse(penguins)`
- `colnames`: Retorna o nome de cada coluna presente no conjunto de dados.
  - Sintaxe: `colnames(penguins)`
