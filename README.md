# Utilizando tidyverse para Analizar Dados com R

O conteúdo aqui apresentado são anotações feitas durante o curso *Data Analysis with R Programming*, que faz parte do *Google Data Analist Certificate* e tem como objetivo servir de guia para quem procura realizar análises de conjuntos de dados com a linguagem de programação R.
Aqui estão presentes funções básicas para importar, realizar uma análise exploratória, limpar, organizar os dados e plotar gráficos como na figura abaixo, utilizando o pacote *tidyverse*, sendo que os pacotes abordados serão:

![Grafico1](https://github.com/DougAugSilva/Analise_de_dados_R/blob/main/Graficos/Rplot09.png)

 - **ggplot2:** Possui uma variedade de ferramentas para visualização de dados e plotagem de gráficos.
 - **tidyr:** Contém várias ferramentas para a limpeza e compreção de dados.
 - **readr:** Usado para importar vários formatos de dados, como por exemplo csv.s' ou arquivos.xlsx.
 - **dplyr:** Oferece uma gama de funções que ajudam na manipulação e filtragem dos dados.

Antes de tudo instale o pacote *tydiverse* utlizando o comando `install.packges("tidyverse")` e posteriormente ative a biblioteca com `library(tidyverse)`. Os exemplos dos códigos e bibliotecas estão no arquivo *Analise_de_dados_tidyverse.R* deste repositótio.
Como exemplo, será utlizado o conjunto de dados *palmerpenguis* que traz informações sobre três espécies de penguins e o *diamonds* que vem por padrão na biblioteca *ggplot2*. Estes pacotes pode ser instaldo por `install.packges("palmerpenguins")` e ativado com `library(palmerpenguins)`.

## 📥 Importando os Dados
Evidentemente, para realizar uma análise de dados no R se fazem necessários dados, podemos trabalhar com alguns conjuntos de dados já disponiveis por padrão no R, como o *diamonds* por exemplo, ou importar via internet um conjunto como o *palmerpenguins*, porém não nos limitamos a isso, de fato, como já foi citado anteriormente, o pacote *readr* nos fornece vários comando para importar dados de vários formatos, alguns dos principais são:

- `read_csv()`: Leitura de aquivos do tipo *csv*, valores separados por vírgulas.
  
- `read_tsv()`: Leitura de aquivos do tipo *tsv*, valores separados por tabulação, como tabelas em planilhas.
  
- `read_delim()`: Leitura de aquivos do tipo *delim*, arquivos delimitados em geral.
  
- `read_fwf()`: Leitura de aquivos do tipo *fwf*, formato de largura fixa.
  
- `read_table()`: Leitura de aquivos do tipo *table*, arquivos armazenados em formato de tabelas com colunas separadas por espaços em branco.
  
- `read_log()`: Leitura de aquivos do tipo *log*, log são registros de atividades realizadas por programas de computador. Eles contêm informações sobre eventos, processos ou mensagens que ocorrem em um sistema, como gravação ou leitura em um banco de dados.

## 🔎 Análise Exploratória
O primeiro passo a se tomar depois de ter importado o conjunto de dados é realizar uma análise exploratória, deste modo é possível ter uma idéia básica sobre a estrutura dos dados a serem manipulados, para assim realizar algum tipo de limpeza ou mudança. A sintaxe destas funções são na forma `função(conjunto de dados)`.

- `head()`: Retorna apena as 6 primeiras linhas de um conjunto de dados.

- `view()`: Retorna um data frame resumido do conjunto de dados. 
  
- `str()`: Nos da informações sobre a estrutura do conjunto de dados, como o nome das colunas e os tipos de dados presentes nelas.
  
- `glimpse()`: Retorna um resumo do conjunto de dados, contendo a quantidade de linhas, quantidade de colunas, bem como um exemplo dos dados presentes em cada coluna.
  
- `colnames()`: Retorna o nome de cada coluna presente no conjunto de dados.

## 🧹 Limpeza, Organização e Transformação dos Dados
Neste passo vamos instalar mais alguns pacotes para ajudar na limpeza e filtragem dos dados, como já citado, os exemplos acompanham o arquivo .R. Os pacotes são:

- **Here:** Pacote que adiciona funções que facilitam a referência à arquivos.
- **Skimr:** Adiciona funções que facilitam o resumo de informações presentes no conjunto de dados.
- **Janitor:** Possui funções para a limpeza dos dados.

Além dos pacotes mencionados, vamos fazer uso novamente do *dplyr* presente no *tidyverse*.

### Limpeza Inicial

- `skim_without_charts()`: Nos dá um sumário contendo o nome do banco de dados, o número de linhas e colunas, os tipos de colunas e um resumos dos diferentes tipos de dados presentes em cada coluna.
  
- `select()`: Assim como no *SQL*, esta função permite selecionar apenas colunas específicas do conjuhnto de dados. Mudando um pouco a sintaxe é possível selecionar o complementar de um conjuntos de coluas específico, basta adicionarmos o sinal "-" antes do nome da coluna. Sua sintaxe é `select(nomes das colunas)`.
  
- `rename()`: Permite alterar o nome de certas colunas no banco de dados. Sua sintaxe é `rename(novo nome da coluna = nome da coluna)`.
  
- `rename_with()`: Altera o nome das colunas para que estes sejam mais consistentes, podendo deixar os nomes em letras maiusculas ou minusculas, sua sintaxe é:
  - `rename_with(penguins , toupper)`: Deixa todos os nomes das colunas do banco de dados em *caixa alta*.
  - `rename_with(penguins , toulower)`: Deixa todos os nomes das colunas do banco de dados em *caixa baixa*.
    
- `clean_name()`: Garante que os nomes de cada coluna no conjunto de dados seja único e consistente, fazendo com que cada nome contenha apenas caracteres alfanumericos e sublinhados "_". Sua sintaxe é `clean_name(palmerpenguins)`.

### Filtrando e Organizando

- `arrange()`: Ordena o conjunto de dados com base em uma coluna escolhida, retornando assim um *tibble* com os dados ordenados. Por padrão os dados são ordenados em ordem *crescente*, porem podemos ordelos em ordem *decrescente* adicionando o sinal "-" antes do nome da coluna. Sua sintaxe é `arrange(nome da coluna)`. <br/>
  A ordenação dos dados **não** é salva automaticamente com a execução desta função, é preciso fazer uma atribuição nomeando eles novamente, como por exemplo: `penguins_ordenados <- penguins %>% arrange(-bill_lenght_mm)`.

- `drop_na()`: Remove todas as linhas com celulas vazias (valores N/A) do conjunto de dados.

- `goup_by()`: Agrupa os dados com base em uma ou mais variáveis, retornando assim um data frame dos dados agrupados.
  - Sintaxe: `palmerpenguins %>% goup_by(variavel agrupadora)`

- `summerize()`: É utilizada dentro de uma clausula da função `goup_by` para calcurar estatísticas dos dados agrupados, ela permite extrair dos dados agrupados informações como a *média*, *desvio padrão*, *máximos*, *minimos* e etc, de uma só vez. Alguns exemplos de sua sintaxe são:
  - `summerize(media = mean(variavel_numerica))`
  - `summerize(media = mean(variavel_numerica), min(variavel_numerica), max(variavel_numerica))`

- `filter()`: Seleciona apenas dados que atendem um certo critério especifico. Alguns exeplos de sua sintaxe são:
  - `penguins %>% filter(species == "Adelie")`
  - `penguins %>% filter(bill_lenght_mm <= 40)`
 
### Transformando e Editando

- `separate()`: Permite separar colunas compostas de strings em duas ou mais colunas, com base em um separador escolhido. Por exemplo: `separate(employee, name, into = c("first_name", "last_name"), sep = " ")` separa os dados da coluna com o nome *employee* em duas colunas chamadas *first_name* e *last_name*, respectivamente, separando quando o pirmeiro espaço em branco " " aparecer. A coluna original deixa de existir após a execução da função.

- `unite()`: Faz basicamente o oposto da `separate()`, unindo duas ou mais colunas de strings em uma única. Um exemplo é: `unite(employee, "name", first_name, last_name, sep = " ")`, que une os dados das colunas *first_name* e *last_name* em uma coluna chamada *name*, com o seprarador " " entre os dados.

- `mutate()`: Cria uma nova coluna com base em clounas existentes, podendo por exemplo criar uma nova coluna com unidades de medidas convertidas de uma coluna existente.

## 📊 Análise Estatística e Gráfica dos Dados
 Depois de uma Análise Exploratória e uma Limpeza dos dados disponiveis, serão utilizadas funções presentes por padrão no *R* e no pacote *ggplot2* do *tidyverse* para uma análise gráfica e estatística mais aprofundada dos dados.

![Grafico2](https://github.com/DougAugSilva/Analise_de_dados_R/blob/main/Graficos/Rplot10.png)

 ### Estatística Descritiva

- `mean()`: Retorna a *média* de variaveis selecionadas. A média é uma medida estatística a priori dos dados que nos diz o centro de densidade da distribuição dos dados.
  
- `median()`: Nos da a mediana do conjunto de dados. A mediana é o valor central de um conjunto de dados ordenado de forma crescente ou decrescente.

- `max()`: Retorna o valor máximo assumido no conjunto de dados.

- `min()`: Retorna o valor mínimo assumido no conjunto de dados.

- `range()`: Retorna os valores máximo e mínimo do conjunto de dados.

- `quantile()`: Nos dá os quartis do conjunto de dados. Os quartis são valores que dividem o conjunto de dados ordenado (de forma crescente ou decrescente) em quatro partes de mesma quantia de dados. Alguns exemplos de sua sintaxe:
  - `quantile(x)`: Retrona os quartis de x.
  - `quantile(x, 0.6)`: Retorna o valor do conjunto de dados x que é maior que 60% dos dados.
 
- `summary()`: Nos dá um resumo com o valor máximo, mínimo, mediana, primeiro e segundo quartis do conjunto de dados.

- `sd()`: Calcula o *desvio padrão* das variaveis selecionadas. O desvio padrão mede o quão os valores do conjunto de dados estão disperços em relação a média.
  
- `cor()`: Mede a correlação da variação entre duas variaveis escolhidas, possuindo valores no intervalo entre - 1 e 1, sendo valores próximos de 1 representando uma correlação positiva forte, e valores próximos de -1 uma correlção negativa forte. <br/>
Sua sintaxe é `cor(x, y)`, sendo x e y as variaveis.

### Análise Gráfica
Para essa parte, além do conjunto de dados *palmerpenguins*, será utilizado o conjunto de dados *diamonds* que vem por padrão no pacote *ggplot2*. Os exemplos aplicados dos gráficos estão no código .R do repositório.

- `hist()`: Constroi um histograma dos dados com base na frequência de seus valores. Podemos mudar a cor do histograma com a estética `color`, e mudar os rótulos dos eixos com `xlab`, `ylab`, bem como o nome do gráfico com `main`.
  
- `boxplot:` Constrói um boxplot dos dados selecionados. Novamente podemos mudar sua cor com `color` e nome com `main`.

- `ggplot()`: Cria um gráfico vazio para adicionarmos estéticas conforme o tipo de gráfico.

- `aes()`: Atribuiu quais variáveis do conjunto de dados serão o eixo das abscissas *x* e quais serão o eixo das ordenadas *y* no gráfico.

- `geom_point()`: Dispõe os dados como pontos no gráfico, construindo por exemplo gráficos de disperção.

- `geom_smooth()`: Cria um gráfico de linhas com os dados, podendo ser combinado com o `geom_point` para tornar evidente tendências nos dados por exemplo.

- `geom_bar()`: Dispõe os dados como retângulos, criando assim gráfico de barras. Podemos mudar a cor do contorno dos rentangulos com a estética `color`, bem como a cor do interior de cada retangulo com `fill`, sendo que mudando a variável ao qual *fill* está atribuído, mudamos o modo em que as barras são coloridas.

- `facet_wrap()`: Escolhida uma variavel, esta função cria um gráfico para cada elemnto da variável.

- `facet_grid()`: Também cria gráficos dividindo os dados conforme variaveis escolhidas, sendo que agora divide verticalmente os dados conforme a primeira variável escolhida, e horizontalmente conforme a segunda variavel escolhida.

- `labs()`: Permite personalizar os texto fora do grid do seu gráfico, como adicionado titulo com `title`, subtítulo com `subtitle` e legenda com `caption`.

- `annotate()`: Permite adicionar textos agora no interior do grid do gráfico, podendo escolher a localização do texto no grid, a cor com `color`, o estilo da fonte com `fontface`, o tamanho da fonte com `size` e até mesmo o ângulo do texto em relação ao eixo *x* com `angle`.

- `ggsave()`: Salva o último gráfico criado em um formado escolhido, como .pdf ou .png por exemplo, podemos também modificar as dimenções da imagem salva adicionando as cláusulas `width` e `height`.




