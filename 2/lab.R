macbooki <- read.csv(file='Macbooki.csv')
macbooki

install.packages("devtools")
install.packages("githubinstall")

devtools::install_github("gluc/ahp")

library(ahp)

macbooki_p <- macbooki[, c("ekran", "pamiec_RAM", "dysk", "cena")]

write.csv(macbooki_p, file='macbooki_p.csv')

file.show("macbooki.ahp")

ahpTree <- Load("macbooki.ahp")

Calculate(ahpTree)

Visualize(ahpTree)
