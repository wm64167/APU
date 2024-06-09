# 1
install.packages("mlr")
library(mlr)

library(datasets)

data(infert)

infert$case <- as.factor(infert$case)

infert_task <- makeClassifTask(data = infert, target = "case")

indices <- sample(1:nrow(infert), size = nrow(infert), replace = FALSE)
train_ratio <- 0.7
train_size <- floor(train_ratio * nrow(infert))
train_data <- infert[indices[1:train_size], ]
test_data <- infert[indices[(train_size + 1):nrow(infert)], ]

learner <- makeLearner("classif.rpart")
model <- train(learner, infert_task)

predictions <- predict(model, newdata = test_data)

performance <- performance(predictions, measures = list(acc))
print(performance)

summary(model)

install.packages("rpart")
library(rpart.plot)
rpart.plot(getLearnerModel(model))

install.packages("C50")
library(C50)
ruleModel <- C5.0(case ~ ., data=train_data, rules=TRUE)
ruleModel
summary(ruleModel)

# 2
macbooki <- read.csv('Macbooki.csv')
macbooki_p <- macbooki[, c('pamiec_RAM', 'dysk', 'ekran', 'cena', 'ocena')]

macbooki_p$ocena <- as.factor(macbooki_p$ocena)

macbooki_task <- makeClassifTask(data = macbooki_p, target = "ocena")

install.packages("rFerns")
install.packages("randomForest")

lrns <- makeLearners(c("lda","rpart", "C50","rFerns",
                       "randomForest"), type = "classif")

porownanie <- benchmark(learners = lrns,
                        tasks = macbooki_task,
                        resampling = cv5)

learner <- c("lda", "rpart", "C50", "rFerns", "randomForest")
accuracy <- c(0.933, 0.667, 0.8, 0.667, 0.733)

data <- data.frame(learner, accuracy)

barplot(data$accuracy, names.arg = data$learner, ylim = c(0, 1), ylab = "Accuracy")
