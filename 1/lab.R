a <- 2 * log(5)
b <- 3 * a
a < b

help(median)

a <- c(seq(25, 45))
median(a)

ls("package:base", pattern = "median")

setwd("lab")
m <- "macbooki Apple"
save(m, file = m)
rm(m)
load("macbooki Apple")

library(grid)

d <- rev(c(seq(130, 200, 5)))

a <- 19:5
b <- 11:23
d <- c(b, a)
print(d)

nazwa <- c("MacBook Air M1 2022", "MacBook Pro 13 M2 2022", "MacBook Pro 14 M1 Pro 2021", "MacBook Pro 16 M1 Pro 2021",
           "MacBook Air M2 2023", "MacBook Pro 13 M2 2023", "MacBook Pro 14 M2 Pro 2023", "MacBook Pro 16 M2 Pro 2023",
           "MacBook Air M2 2024", "MacBook Pro 13 M2 2024")

ekran <- c(13.3, 13.3, 14.2, 16.2, 13.6, 13.6, 14.2, 16.2, 13.6, 13.6)
pamiec_RAM <- c(8, 8, 16, 16, 8, 16, 16, 32, 8, 16)
dysk <- c(256, 256, 512, 512, 256, 512, 512, 1000, 512, 512)
cena <- c(4299, 5799, 8799, 10799, 4799, 6299, 9299, 11299, 5299, 6799)
liczba_opinii <- c(123, 456, 789, 1012, 345, 678, 901, 1234, 567, 890)

Macbooki <- data.frame(nazwa, ekran, pamiec_RAM, dysk, cena, liczba_opinii)

srednia_cena <- mean(Macbooki$cena)
print(srednia_cena)

nowy_macbook <- data.frame(nazwa = "MacBook Air M2 2023", ekran = 13.6, pamiec_RAM = 16, dysk = 512, cena = 5499, liczba_opinii = 234)
Macbooki <- rbind(Macbooki, nowy_macbook)

srednia_cena_nowa <- mean(Macbooki$cena)
print(srednia_cena_nowa)

ocena <- seq(0, 5, 0.5)
Macbooki$ocena <- factor(sample(ocena, nrow(Macbooki), replace = TRUE))

srednia_ocena <- tapply(Macbooki$cena, Macbooki$ocena, mean)
print(srednia_ocena)

nowe_macbooki <- data.frame(
  nazwa = c("MacBook Air M3 2024", "MacBook Pro 13 M3 2024", "MacBook Pro 14 M3 Pro 2024", "MacBook Pro 16 M3 Pro 2024"),
  ekran = c(13.6, 13.6, 14.2, 16.2),
  pamiec_RAM = c(16, 16, 32, 32),
  dysk = c(512, 512, 1024, 1024),
  cena = c(5799, 6999, 9999, 11999),
  liczba_opinii = c(345, 678, 901, 1234),
  ocena = factor(sample(ocena, 4, replace = TRUE))
)
Macbooki <- rbind(Macbooki, nowe_macbooki)

freq <- table(Macbooki$ocena)
wykres <- barplot(freq, main = "Liczba Macbooków według ocen", xlab = "Ocena klienta", ylab = "Liczba Macbooków")

procent <- round(prop.table(table(Macbooki$ocena)) * 100, 1)
kolowy <- pie(procent, labels = names(procent), main = "Procentowy udział ocen Macbooków")
wachlarzowy <- pie(procent, labels = names(procent), main = "Procentowy udział ocen Macbooków", angle = 90, cex = 0.8)

Macbooki$status_opinii <- factor(ifelse(Macbooki$liczba_opinii < 50, "mniej 50 opinii",
                                        ifelse(Macbooki$liczba_opinii < 100, "50-100 opinii", "więcej 100 opinii")))

procent <- round(prop.table(table(Macbooki$status_opinii)) * 100, 1)
wykres <- pie(procent, labels = names(procent), main = "Ilość opinii Macbooków")

zdania <- sapply(1:nrow(Macbooki), function(i) {
  paste(Macbooki[i, "nazwa"], "Ma ocenę", Macbooki[i, "ocena"], "i liczbę opinii", Macbooki[i, "liczba_opinii"])
})

print(zdania)

write.csv(Macbooki, "Macbooki.csv")

