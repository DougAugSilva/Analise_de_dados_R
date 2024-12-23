# Analise de dados com R
O conteudo aqui apresentado são anotações feitas durante o curso *Data Analysis with R Programming* que faz parte do *Google Data Analist Certificate*, e tem como o jetivo servir de guia para quem procura realizar analises de conjuntos de dados com a linguagem de programação R.
O conteudo aqui apresentado são funções básicas para importar, realizar uma análise exploratória e plotar gráficos utilizando o pacote *tydiverse*, sendo que os pacotes abordados serão
 - **ggplot2:** Possui uma variedade de Ferramentas para vcisualização de dados e plotagem de gráficos.
 - **tidyr:** Contém várias ferramentas para a limpeza e copmpreção de dados.
 - **readr:** Usado para importar varios formatos de dados, como por exemplo csv.s' ou arquivos.xlsx.
 - **dplyr:** Oferece uma gama de funções que ajudam na manipuulação e filtragem de dados.

Antes de tudo instale o pacote *tydiverse* utlizando o comando `install.packges("tydiverse")` e posteriormente ative a bivblioteca com `library(tydiverse)`.
Como exemplo será utlizado o conjunto de dados *palmerpenguis* que traz informações sobre três espécies de penguins, como por exemplo massa corpórea, tamanho das patas e etc. Este pacote pode ser instaldo por `install.packges("palmerpenguins")` e ativado com `library(palmerpenguins)`.

## 🔎 Análise Exploratória

- `head`: Retorna apena as 6 primeiras linhjas de um conjunto de dados
  - Sua sintaxe é: `head(palmerpenguins)`
- `mutate`: c
