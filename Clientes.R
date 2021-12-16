##Actualizamos nuestra carpeta de trabajo (Donde estarán las bases a cargar)

setwd("C:/Users/jloayzap/Documents/JLP/CLIENTES")

##Clientes.csv es el archivo de BUP
library(readr)
Clientes <- read_delim("Clientes.CSV", ";", col_types = cols(.default = "c"),
                       escape_double = FALSE, trim_ws = TRUE)
View(Clientes)

##Consultas_Clientes.xlsx es un archivo con una columna con encabezado NUM_DOCUMENTO y los documentos a cruzar
library(readxl)
Consulta_Clientes <- read_excel("Consulta_Clientes.xlsx")
View(Consulta_Clientes)


#OBTENIENDO INFORMACIÓN DE Consultas_Clientes

CRUCE_CLIENTES <- sqldf("Select * from Clientes as A inner join Consulta_Clientes as B on A.NUMERO_DOCUMENTO_CLIENTE = B.NUM_DOCUMENTO")

names(Consulta_Clientes)

#Exportando Archivo en nuestra carpeta de trabajo
write.csv(CRUCE_CLIENTES, "CRUCE_CLIENTES.csv")

val_23075030 <- sqldf("select * from Clientes where A.NUMERO_DOCUMENTO_CLIENTE like '%23075030%'")