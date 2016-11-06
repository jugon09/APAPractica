setwd("E:\\Documentos\\Uni\\APA\\Nueva carpeta")
d1=read.table("student-mat.csv",sep=";",header=TRUE)
d2=read.table("student-por.csv",sep=";",header=TRUE)

d3=merge(d1,d2,by=c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet"))
print(nrow(d3)) # 382 students

#derivem index de consum de alcohol diari
d3$talc <- ((d3$Dalc.x*(5/7)) + (d3$Walc.x*(2/7)))

#derivem valor binari en forma de texst, de absencies a classe 
d3$abs <- (d3$absences.x > 10)
d3$abs <- as.integer(as.logical(d3$abs))
levels(d3$abs) <- c(levels(d3$abs), "absent") 
d3$abs[d3$abs == 1]<- "absent"
levels(d3$abs) <- c(levels(d3$abs), "not_absent") 
d3$abs[d3$abs == 0]<- "not_absent"






