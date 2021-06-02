
######################################################################################################################
#  LIBRARIES
######################################################################################################################

library(viridisLite)
library(viridis)
library(tidyverse)


######################################################################################################################
# Analysis of machine learning articles in the addiction research field
# Data were extracted from Pubmed, details of variables are mentioned in the accompanying file.

######################################################################################################################
#  DATASET
######################################################################################################################

addiction_db <- read.csv2("MachineLearning_addiction_articles.csv")


######################################################################################################################
#  PLOTS
######################################################################################################################

View(addiction_db)


# articles per year  
ggplot(data=addiction_db)+
  geom_bar(mapping = aes(x=Publication.Year))+
  theme_minimal()+
  scale_fill_viridis(discrete = TRUE, option = "D")


# articles per year (original articles)
addiction_db_OrgArticles <- filter(addiction_db, Type == "Org_Article")

ggplot(data=addiction_db_OrgArticles)+
  geom_bar(mapping = aes(x=Publication.Year))+
  theme_minimal()+
  scale_fill_viridis(discrete = TRUE, option = "D")


# articles per year with regard to the machine learning application (ML.for)
ggplot(data=addiction_db_OrgArticles)+
  geom_bar(mapping = aes(x=Publication.Year, fill=ML.for))+
  theme_minimal()+
  scale_fill_viridis(discrete = TRUE, option = "D")

# considering that the year 2020 was incomplete, it was removed from the final figure

addiction_db_OrgArticles_1 <- filter(addiction_db_OrgArticles, Publication.Year!=2020)
View(addiction_db_OrgArticles_1)

# articles per year with regard to the machine learning application (ML.for). This was included in the article.
ggplot(data=addiction_db_OrgArticles_1)+
  geom_bar(mapping = aes(x=Publication.Year, fill=ML.for))+
  theme_minimal()+
  scale_fill_viridis(discrete = TRUE, option = "D")


# original articles per year with regard to the study final aim (Final.aim)
ggplot(data=addiction_db_OrgArticles)+
  geom_bar(mapping = aes(x=Publication.Year, fill=Final.aim))+
  theme_minimal()+
  scale_fill_viridis(discrete = TRUE, option = "D")


# original articles per year with regard to the substance (Substance)
ggplot(data=addiction_db_OrgArticles)+
  geom_bar(mapping = aes(x=Publication.Year, fill=Substance))+
  theme_minimal()+
  scale_fill_viridis(discrete = TRUE, option = "D")


######################################################################################################################
# Relationship between addiction articles (without any additional tag) and the machine learning addiction articles 
# Counts were extracted from Pubmed, the ratio between total articles and machine learning is determined

######################################################################################################################
#  DATASET
######################################################################################################################

Relat_MLTotal <- read.csv2("Relation_Addiction_ML-Total.csv")


######################################################################################################################
#  ANALYSIS
######################################################################################################################

View(Relat_MLTotal)

Relat_MLTotal$ratio <- Relat_MLTotal$Addiction_ML_Count/Relat_MLTotal$Addiction_Total_Count

Relat_MLTotal$Percent <- Relat_MLTotal$ratio*100

Relat_MLTotal %>% filter(Addiction_Total_Year == 2019 | 
                           Addiction_Total_Year == 2015 |
                           Addiction_Total_Year == 2010 |
                           Addiction_Total_Year == 2005) %>% 
  select(Addiction_Total_Year, Percent)









