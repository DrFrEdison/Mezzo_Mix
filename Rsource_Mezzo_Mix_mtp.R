# Package update and initialization ####
suppressPackageStartupMessages(library(r4dt))

# general parameters ####
dt <- list()
dt$para$customer = "CCEP"
dt$para$beverage = "Mezzo_Mix"

setwd(paste0(dt$wd <- paste0(wd$fe[[ grep(dt$para$customer, names(wd$fe)) ]]$Mastermodelle, dt$para$beverage)))
setwd( print( this.path::this.dir() ) )
dt$wd.git <- print( getwd() )

# location, line, main ####
dt$para$location = print(dt_customer[dt_customer$customer == dt$para$customer, "location"])
dt$para$line = print(dt_customer[dt_customer$customer == dt$para$customer, "line"])
dt$para$main = paste0(dt$para$beverage, " in ", dt$para$location, ", line ", dt$para$line)

# Modelltransfer
dir( paste0( dt$wd, "/", "/Modelltransfer"))
dt$para$mtp.date <- c("220614")
dt$para$model.raw.pl <- c("00300")
dt$para$wl1 <- c(190)
dt$para$wl2 <- c(598)
dt$para$wl[[1]] <- seq(dt$para$wl1, dt$para$wl2, 1)

# Parameter ####
dir()
dir( paste0( dt$wd, "/", "/Modellerstellung", "/", dt$para$mtp, "_", dt$para$model.raw.pl, "/spc"))
dt$para$substance <- c("TTA")

# Unit ####
dt$para$unit <- c( bquote("%" ))
dt$para$ylab <- c(bquote("TTA in "))

# Rezept und SOLL-Werte ####
setwd( paste0( dt$wd, "/", "/Rezept") )
dt$rez <- read.xlsx(grep(".xlsx", dir( paste0( dt$wd, "/", "/Rezept")), value = T)[ length(grep(".xlsx", dir( paste0( dt$wd, "/", "/Rezept")), value = F))])
dt$rez[ grep("Messparameter", dt$rez[ , 1]): nrow(dt$rez) , ]
dt$para$SOLL <- c(100)
dt$para$eingriff <- data.frame( TTA = c(100 - 2.5/125*100, 100 + 2.5/125*100))

dt$para$sperr <- data.frame( TTA = c(100 - 3.8/125*100, 100 + 3.8/125*100))

# rename R files (run only once)
setwd(dt$wd.git)

# dt$para$Rfiles <- list.files(getwd(), pattern = ".R$", recursive = T)
# file.rename(dt$para$Rfiles, gsub("beverage", dt$para$beverage, dt$para$Rfiles))

