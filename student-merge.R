setwd("E:\\Documentos\\Uni\\APA\\Nueva carpeta")
d1=read.table("student-mat.csv",sep=";",header=TRUE)
d2=read.table("student-por.csv",sep=";",header=TRUE)

#juntem els dos conjunts de dades
d3<- rbind(d1,d2)
#identifiquem els duplicats
dup <- as.integer(duplicated(d3[,1:11]))

#eliminem repetits i reindexem la taula
d3 <- subset(d3, dup == 0)
rownames(d3) <- 1:nrow(d3)

#derivem index de consum de alcohol diari
d3$talc <- ((d3$Dalc*(5/7)) + (d3$Walc*(2/7)))

#derivem valor binari en forma de texst, de absencies a classe 
d3$abs <- (d3$absences > 10)
d3$abs <- as.integer(as.logical(d3$abs))
levels(d3$abs) <- c(levels(d3$abs), "absent") 
d3$abs[d3$abs == 1]<- "absent"
levels(d3$abs) <- c(levels(d3$abs), "not_absent") 
d3$abs[d3$abs == 0]<- "not_absent"

#derivem atribut binari sobre si considerem que es alcoholic o no
d3$alc <- (d3$talc >= 3)
d3$alc <- as.integer(as.logical(d3$alc))






