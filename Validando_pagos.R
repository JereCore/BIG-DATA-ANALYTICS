octubre$monto_2 <- sub(".", "", octubre$`Monto de pago de Tarjeta`, fixed = TRUE)
octubre$monto_3 <- sub(",", ".", octubre$monto_2, fixed = TRUE)
octubre$monto_4 <- as.numeric(octubre$monto_3)
octubre$monto <- octubre$monto_4
octubre$monto_2 <- NULL
octubre$monto_3 <- NULL
octubre$monto_4 <- NULL


class(octubre$`Monto de pago de Tarjeta`)

octubre_agrupado <- sqldf("Select [Número Identificación], SUM(monto) from octubre group by [Número Identificación] ")

X <- octubre_agrupado$`SUM(monto)`

res1 <- hist(X)

cortes <- length(res1$breaks) - 1

div <- table(cut(X, breaks = 100, dig.lab=8))

mat <- data.frame(div)

mat

setwd("C:/Users/jloayzap/Documents/JLP/PAGOS_TC")

options(digits =9) # <- validar digitos decimales
octubre_30000 <- sqldf("select * from octubre where monto >= 30000")


octubre_30000$monto_dolar <- octubre_30000$monto/4.024419355

write.csv(octubre_30000,"octubre_30000.csv")