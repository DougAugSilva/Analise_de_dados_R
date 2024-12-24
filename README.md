# Utilizando tidyverse para Analizar Dados com R
O conteudo aqui apresentado são anotações feitas durante o curso *Data Analysis with R Programming* que faz parte do *Google Data Analist Certificate*, e tem como o jetivo servir de guia para quem procura realizar analises de conjuntos de dados com a linguagem de programação R.
O conteudo aqui apresentado são funções básicas para importar, realizar uma análise exploratória e plotar gráficos utilizando o pacote *tidyverse*, sendo que os pacotes abordados serão:

 - **ggplot2:** Possui uma variedade de Ferramentas para vcisualização de dados e plotagem de gráficos.
 - **tidyr:** Contém várias ferramentas para a limpeza e copmpreção de dados.
 - **readr:** Usado para importar varios formatos de dados, como por exemplo csv.s' ou arquivos.xlsx.
 - **dplyr:** Oferece uma gama de funções que ajudam na manipuulação e filtragem de dados.

Antes de tudo instale o pacote *tydiverse* utlizando o comando `install.packges("tidyverse")` e posteriormente ative a biblioteca com `library(tidyverse)`.
Como exemplo será utlizado o conjunto de dados *palmerpenguis* que traz informações sobre três espécies de penguins, como por exemplo massa corpórea, tamanho das patas e etc. Este pacote pode ser instaldo por `install.packges("palmerpenguins")` e ativado com `library(palmerpenguins)`.

## 📥 Importando os Dados
Evidentemente para realizar uma análise de dados no R se fazem necessários dados, podemos trabalhar com alguns conjuntos de dados já disponiveis po padrão no R, como o *diamonds* por exemplo, ou importar via internet um conjunto como o *palmerpenguins*, porém não nos limitamos a isso, de fato, como já foi citado anteriormente, o pacote *readr* nos fornece vários comando para importar dados de vários formatos, alguns dos principais são:

- `read_csv()`: Leitura de aquivos do tipo *csv*, valores separados por virgulas.
  
- `read_tsv()`: Leitura de aquivos do tipo *tsv*, valores separados por tabulação, como tabelas em planilhas.
  
- `read_delim()`: Leitura de aquivos do tipo *delim*, arquivos delimitados em geral.
  
- `read_fwf()`: Leitura de aquivos do tipo *fwf*, formato de largura fixa.
  
- `read_table()`: Leitura de aquivos do tipo *table*, arquivos armazenados em formato de tabelas com colunas separadas por espaços em branco.
  
- `read_log()`: Leitura de aquivos do tipo *log*, log são registros de atividades realizadas por programas de computador. Eles contêm informações sobre eventos, processos ou mensagens que ocorrem em um sistema, como gravação ou leitura em um banco de dados.

## 🔎 Análise Exploratória
O primeiro paso a se tomar depois de ter importado o conjunto de dados é realizar uma análise exploratória, deste modo é possível ter uma idéia basica sobre a estrutura dos dados a serem manipulados, para assim realizar algum tipo de limpeza ou mudança. A sintaxe destas funções são na forma `função(conjuhnto de dados)`.

- `head()`: Retorna apena as 6 primeiras linhas de um conjunto de dados.
  
- `str()`: Nos da informações sobre a estrutura do conjunto de dados, com o nome das colunas e os tipos de dados presentes nelas.
  
- `glimpse()`: Retorna um resumo do conjunto de daados, com a quantidade de linhas, quantidade de colunas, bem como um exemplo dos dados presentes em cada coluna.
  
- `colnames()`: Retorna o nome de cada coluna presente no conjunto de dados.

## 🧹 Limpeza e Filtragem dos Dados
Neste passo vamos instalar mais alguns pacotes para ajudar na limpeza e filtragem dos dados, novamente para instalar os devidos pacotes use `install.packges(nome do pacote)` e depois `library(nome do pacote)` para carregalo. Os pacotes são:

- **Here:** Pacote que adiciona funções que facilitam a referencia à arquivos.
- **Skimr:** Adiciona funções que facilitam o resumo de informações presentes no conjunto de dados.
- **Janitor:** Possui funções para a limpeza dos dados.

Alem dos pacotes mencionados, vamos fazer uso novamente do *dplyr* presente no *tidyverse*.

- `skim_without_charts()`: Nos dá um sumário contendo o nome do banco de dados, o numero de linhjas e colunas, os tipos de colunas e um resumos dos diferentes tipos de dados presentes em cada coluna.
  
- `select()`: Assim como no *SQL*, esta função permite selecionar apenas colunas especificas do conjuhnto de dados. Mudando um pouco a sintaxe é possivel selecionar o complementar de um conjuntos de coluas especifico, basta adicionarmos o sinal "-" antes do nome da coluna. Sua sintaxe é `select(nomes das colunas)`.
  
- `rename()`: Permite alterar o nome de certas colunas no banco de dados. Sua sintaxe é `rename(nome da coluna = novo nome da coluna)`.
  
- `rename_with()`: Altera o nome das colunas para que este sejam mais consistente, podendo deixar os nomes em letras maiusculas ou minusculas, sua sintaxe é:
  - `rename_with(penguins , toupper)`: Deixa todos os nomes das colunas do banco de dados em *caixa alta*.
  - `rename_with(penguins , toulower)`: Deixa todos os nomes das colunas do banco de dados em *caixa baixa*.
    
- `clean_name()`: Garante que os nomes de cada coluna no conjunto de dados seja unico e consistente, fazendo que cada nome contenha apenas caracteres alfanumericos e suplinhados "_". Sua sintaxe é `clean_name(palmerpenguins)`.
