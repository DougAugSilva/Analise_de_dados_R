#------------------------------------------------------#
# Alguns exemplos das funcoes presentes no arquivo .md #
#------------------------------------------------------#
install.packages("tidyverse")
install.packages("palmerpenguins")

library(tidyverse)
library(palmerpenguins)
#--------------------------------------------------------------------------------------------------------------
# Analise Exploratoria
#--------------------------------------------------------------------------------------------------------------
head(penguins)

view(penguins)

str(penguins)

glimpse(penguins)

colnames(penguins)
#--------------------------------------------------------------------------------------------------------------
# Limpeza, Organizacao e Transformacao dos Dados
#--------------------------------------------------------------------------------------------------------------
install.packages("here")
install.packages("skimr")
install.packages("janitor")

library(here)
library(skimr)
library(janitor)
library(dplyr)

skim_without_charts(penguins)

#Selecionando apenas o comprinmento do bico
penguins %>% select(bill_depth_mm) 

#Renomenado coluna
penguins %>% rename(comprimento_do_bico_mm = bill_depth_mm)  

#Formatando corretamente os nomes
clean_names(penguins) 

#Criando um conjunto de dados com os dados ordenados
penguins_ordenados <- penguins %>% arrange(-bill_length_mm) 
head(penguins_ordenados)

#Resumo comprimento do bico por espécie
penguins %>% group_by(species) %>% drop_na() %>% summarize(media = mean(bill_length_mm)) 

#Filtrando dados da ilha de biscoe
penguins %>% filter(island == "Biscoe") 

#Criando coluna com a massa dos penguins em Kg
penguins %>% mutate(peso_corporal_kg = body_mass_g / 1000) 

#Classifica os penguins de acordo com o peso
penguins %>% mutate(categorias_de_peso = case_when(     
  body_mass_g <= 3900 ~ "Abaixo do Peso",
  body_mass_g > 3900 & body_mass_g <= 5100 ~ "Saudavel",
  body_mass_g > 5100 ~ "Acima do Peso"
  ))
#--------------------------------------------------------------------------------------------------------------
#Análise Estatística e Gráfica dos Dados
#--------------------------------------------------------------------------------------------------------------

#Calcula a media do comprimento dos bicos
mean(drop_na(penguins)$bill_length_mm) 

#Calcula a mediana do comprimento dos bicos
median(drop_na(penguins)$bill_length_mm) 

#Calcula o comprimento maximo dos bicos
max(drop_na(penguins)$bill_length_mm) 

#Calcula o comprimento minimo dos bicos
min(drop_na(penguins)$bill_length_mm) 

#Retorna o maior e o menor comprimento de bico
range(drop_na(penguins)$bill_length_mm)

#Retorna os quartis
quantile(drop_na(penguins)$bill_length_mm) 

#Retorna o comprimento de bico que e maior que 70% dos demais
quantile(drop_na(penguins)$bill_length_mm, 0.7) 

#Um sumario das estatisticas dos comprimentos de bicos
summary(drop_na(penguins)$bill_length_mm) 

#Calcula o desvio padrao dos comprimentos de bicos
sd(drop_na(penguins)$bill_length_mm) 

#Mede a correlacao entre o comprimento de bico e a massa corporea
cor(drop_na(penguins)$flipper_length_mm,drop_na(penguins)$body_mass_g) 

#Constroi um histograma do comprimentos dos bicos
hist(drop_na(penguins)$bill_length_mm, col = "lightblue",
     xlab  = "Comprimentos de Bico em mm", 
     ylab = "Frequência", main = "Histograma Comprimentos de Bico")

#Constroi um boxplot do comprimentos dos bicos
boxplot(drop_na(penguins)$bill_length_mm, col = "lightblue") 

#Cria um grafico de dispercao com base no tamanho da nadadeira e na massa coporea
ggplot(data = penguins) +  
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, alpha = species))

#Colore e muda op formatdo do pontos do grafico de dispercao conforme as especies
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, shape = species, color = species))

#.....tipos de estéticas
#.....color(muda a cor), shape(muda o formato), size(muda o tamanho), alpha(muda a transparencia)
#.....OBS: Quando queremos mudar a aparencia do grafico todo sem dependencia de variaveis especificas, escrevemos o comando fora da funcao "aes"

#Cria um grafico de linha que correlaciona os dados
ggplot(data = penguins) +  
  geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g))

#Cria um grafico de linha que correlaciona os dados juntamente com os pontos
ggplot(data = penguins) +  
  geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, shape = species), color = "red")

#Cria um grafico com linhas que mostra a correlacao das variaveis conforme a especie
ggplot(data = penguins) +  
  geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g, linetype = species))

#Cria um grafico de dispercao com ruido entre os pontos para facilitar a visualisacao dos pontos
ggplot(data = penguins) + 
  geom_jitter(mapping = aes(x = flipper_length_mm, y = body_mass_g))

#............Trabalharemos agora com o pacote Diamonds presente no ggplot2

# Esteticas no geom_bar, color(colore as arestas dos retangulos), fill(colore o interior dos retangulos)
#Cria um grafico de barras sobre as categorias de corte dos diamantes
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))

#Mudando a variavel do fill, mudamos o modo em que as barras são coloridas
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))

#O geoma smoht permite enchergar padrões em graficos de disperção, adicionando uma linha que segue a relção das variaveiss
#Existem dois tipos de smooth, o "loess" para poucos pontos e o "gam" para muitos pontos
ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g)) +  
  geom_point() +
  geom_smooth(method = "gam")

#Cria um grafico de comprimento de nadadeira por massa corporea para cada penguin
ggplot(data = penguins) +
  geom_point(mapping = aes(x =flipper_length_mm, y = body_mass_g, color = species)) +
  facet_wrap(~species) 

#Cria um  grafico para cada tipo de corte de diamante
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = color, fill = cut)) + facet_wrap(~cut) +
  labs( title = "Tipos de Corte dos Diamantes",
        subtitle = "Exemplo da função face_wrap do ggplot2",
        caption = "Conjunto de dados diamonds")

#Cria graficos dividindo os dados conforme duas variaveis
ggplot(data = penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) + 
  facet_grid(sex ~ species)

#Grafico com a adição de um titulo, subtitulom, legenda e texto personalisado no grid
p <- ggplot(data = penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  labs(title = "Palmer Penguins: Massa Corporar vs. Comprimento de Nadadeira",
       subtitle = "Amostra com tres especies de penguim",
       caption = "Dados Coletados por Dr. Kristen Grorman")
 
#Adiciona anotações dentro do grid do grafico
p + annotate("text", x = 220, y = 3500, label = "Os Gentoos sao os maiores", color = "blue",
           fontface = "bold", size =4.5, angle = 25) 
