install.packages('neuralnet')
library('neuralnet')

funkcja <- read.csv('funkcja.csv')

normalize <- function(x) {
  return ((x-min(x)) / (max(x) - min(x)))
}

scaled <- as.data.frame(lapply(funkcja, normalize))

trainset <- scaled[1:80, ]
testset <- scaled[81:100, ]

nn <- neuralnet(Value ~ Index, data=trainset, hidden=10, threshold=0.01, linear.output=TRUE)

print(nn)
plot(nn)

results <- compute(nn, testset)

ls(results)
comparison <- data.frame(actual=testset[,2], prediction=results$net.result)
comparison


macbooki <- read.csv('Macbooki.csv')

macbooki_p <- macbooki[, c('pamiec_RAM', 'dysk', 'ekran', 'cena')]

macbooki_s <- as.data.frame(lapply(macbooki_p, normalize))

macbooki_train <- macbooki_s
macbooki_test <- macbooki_s[1:3, ]

macbooki_nn <- neuralnet(cena ~ pamiec_RAM + dysk + ekran, data=macbooki_train, hidden=c(3,2), threshold=0.01)

print(macbooki_nn)
plot(macbooki_nn)

macbooki_results <- compute(macbooki_nn, macbooki_test)

ls(macbooki_results)
macbooki_comparison <- data.frame(actual=macbooki_test[,c('cena')], prediction=macbooki_results$net.result)
macbooki_comparison
