library(MLDataR)

tir <- MLDataR::thyroid_disease
write.csv(tir, file = "dataset_tiroides.csv")


#al final de los trabajos poner esto, es info de la sesion
sessionInfo()

# order es como hacer sort de un vector pero para datasets

head(tir)
sort(tir$patient_age)
#esto solo te ordena esa variable, para que te ordene todo 
#el dataset con order
tir2 <- tir[order(tir$patient_age),]

#para quitar todos los missings NA de un dataset
tir_completo <- tir[complete.cases(tir),]
#es una manera rapida de quitar los NA, pero perdemos pacientes

#agrupar por grupos y hacer un calculo estadistico
#saber la media de la edad de los pacientes que tienen tiroides o no
#3 parametros: los valores que quiero calcular (edad), 
#como queremos agrupar (tiroide) y media
#aggregate
aggregate(tir_completo$patient_age, 
          list(tir_completo$ThryroidClass, 
               tir_completo$patient_gender), 
          mean)
edad_tyr <- aggregate(tir_completo$patient_age, 
          list(tir_completo$ThryroidClass), mean)
names(edad_tyr) <- c("Tiroides", "Media")
edad_tyr


aggregate(tir_completo$patient_age, 
          list(tir_completo$ThryroidClass, 
               tir_completo$patient_gender), 
          mean)
edad_gene <- aggregate(tir_completo$patient_age, 
                       list(tir_completo$ThryroidClass, 
                            tir_completo$patient_gender), 
                       mean)
names(edad_gene) <- c("Tiroides","Género", "Media")
edad_gene
