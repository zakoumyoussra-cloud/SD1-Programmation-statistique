dfManga <- read.csv("L:/BUT/SD/Promo 2025/yzakoum/R/anime.csv",header = TRUE, dec =".", sep = ",")
dfAnime <- read.csv("L:/BUT/SD/Promo 2025/yzakoum/R/manga.csv", header = TRUE, dec = ".", sep = ",")

class(dfManga)
class(dfAnime)

View(dfManga)
View(dfAnime)

#3) nb de ligne et colonne :
dim(dfAnime)
dim(dfManga)


#4) Moyenne de la colonne score
mean(dfAnime$Score)
mean(dfManga$Score)

#5) Somme (le plus de vote dfManga ac +854M)
sum(dfAnime$Vote)
sum(dfManga$Vote)

#6) Ecart-type score : Anime est le plus homogène
sd(dfAnime$Score)
sd(dfManga$Score)

#7)Decile = /10
quantile(dfAnime$Score, probs = seq(from = 0.1, to = 0.9, by = 0.1))
quantile(dfManga$Score, probs = seq(from = 0.1, to = 0.9, by = 0.1))



#LES FONCTIONS SUBSET TABLE ET PROP.TABLE

#1)nb manga dont score > à 9/10 grace a une extraction :
extraction1 <- subset(dfManga, Score > 9)
nrow(extraction1)

#2) Manga ac + 200k de votes :
extraction2 <- subset(dfManga, Vote > 200000)
nrow(extraction2)

#3) Manga ac + 200k de votes ET score > 8:
extraction3 <-subset(dfManga, Score > 8 & Vote > 200000)
nrow(extraction3)

#4) Manga ac  score entre 7 & 8:
extraction4 <- subset(dfManga, Score >= 7 & Score <= 8)
nrow(extraction4)



# FILTRE SUR LES ANIMES (Manga) :

#1)effectifs de la variable Rating(), modalité et les effectifs en pourcentage.

effectifR <- table(dfManga$Rating)
print(effectifR)
length(effectifR)
prop.table(effectifR)



#2) Nombre concernés par le Rating : R - 17+ (violence & profanity) :

print(effectifR["R - 17+ (violence & profanity)"])
# ou : 
extraR17 <- subset(dfManga, Rating == "R - 17+ (violence & profanity)")
nrow(extraR17)


#3) R - 17+ (violence & profanity) et note supérieur à 8/10 : 

extraR17_8 <- subset(dfManga, Rating == "R - 17+ (violence & profanity)" & Score >= 8)
nrow(extraR17_8)

#4) ne correspondent pas au Rating : R - 17+ (violence & profanity) : 

extranNo17 <- subset(dfManga, Rating != "R - 17+ (violence & profanity)")
nrow(extranNo17)


#5) Combien correspondent au Rating : PG - Children et G - All Ages ?

extraPG <- subset(dfManga, Rating == "PG - Children"  | Rating == "G - All Ages")
nrow(extraPG)

extraPG2 <- subset(dfManga, Rating %in% c("PG - Children", "G - All Ages"))
nrow(extraPG2)

#6) ne correspondent pas au Rating : PG - Children et G - All Ages  :

extraNoPG <- subset(dfManga, Rating != "PG - Children" & Rating != "G - All Ages" )
nrow(extraNoPG)

extraNoPG2 <- subset(dfManga, !Rating %in% c("PG - Children", "G - All Ages"))
nrow(extraNoPG2)


#7) une note supérieure à 9/10 ou ont plus de 400000 votes ?

extraTop <- subset(dfManga, Score >= 9 | Vote > 400000)
nrow(extraTop)


#Les fonctions rbind() et write.table()

#1) Modifier les deux dataframe en ne conservant que les variables : Title,Score,Vote,Ranked.

dfAnime <- dfAnime[ , c("Title","Score","Vote","Ranked")]
dfManga <- dfManga[ , c("Title","Score","Vote","Ranked")]

View(dfAnime)
View(dfManga)

#2) créer une colonne Type avec pour valeur Anime ou Manga selon l'objet.

dfAnime$Type <- "Anime"
dfManga$Type <- "Manga"

dfConcat <- rbind(dfManga,dfAnime)
View(dfConcat)



write.table(x = dfConcat, file = "L:/BUT/SD/Promo 2025/yzakoum/R/ExportTp1.csv",sep = ";",row.names = FALSE)




































































