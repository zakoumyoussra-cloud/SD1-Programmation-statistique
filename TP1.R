


#"Afficher le jeu de données iris :"
iris

#Afficher la classe iris :"
class(iris)

"Permet de voir les données sous forme de tableau attention ac une majuscule tjrs"
View(iris)


head(iris)


#nb de ligne"
nrow(iris)

#nb de colonne"
ncol(iris)

#Nom des colonnes"
colnames(iris)

#resume du dataframe"
summary(iris)


#acceder seulement certaine colonnes (separateur = , a droite c les lignes (ici tte) et a gauche les colonnes choisit"
iris[,c("Sepal.Length","Species")]

#Affiche juste les ligne 100 103 et 105 ac tt le colonne
iris[c(100,103,105),]

#de 100 a 150
iris[c(100:150),]

#moyenne d'une colonne precise ds un dataframe
mean(iris$Sepal.Length)

#mediane d'une colonne precise ds un dataframe
median(iris$Sepal.Width)


#ecarttype
sd(iris$Petal.Length)

#deciles (pourcentage de 10 en 10)
quantile(iris$Petal.Width, probs = seq(from = 0.1, to = 0.9, by = 0.1))














