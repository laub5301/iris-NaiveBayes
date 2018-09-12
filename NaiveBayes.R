#modified from https://www.udemy.com/machine-learning-in-r/learn/v4/t/lecture/3647358?start=0
#call the following libraries: caret, e1071, class, readr from RStudio
#read iris dataset from working directory
library(readr)
iris_dataset <- read_csv("~/projects/Iris-kNNClassifier/iris.csv", TRUE)
#four features (sepallength, sepalwidth, petallength, petalwidth)
#three output classes (Iris-setosa, Iris-verticolor, Iris-virginica)
iris_dataset

#shuffle dataset using random sampling
iris_dataset <- iris_dataset[sample.int(nrow(iris_dataset)),]
iris_dataset

#create a factor out of the output classes ~correctors
iris_dataset$Class <- factor(iris_dataset$Class, labels = c("A", "B", "C"))

#split normalized dataset into training (67%) and test (33%) sets
training_dataset <- iris_dataset[1:100,]
test_dataset <- iris_dataset[101:150,]

model <- naiveBayes(Class ~ . , data = training_dataset)

#return the predictions for the test dataset
predictions <- predict(model, test_dataset)
actual_labels <- test_dataset[,5]


#confusion matrix
#received initial error that 'train' and 'class' have different lengths
#solution: added[,1,drop =TRUE] from online help
table(predictions, actual_labels[,1,drop=TRUE])

#calculate percentage accuracy of Naive Bayes
mean(actual_labels[,1,drop=TRUE]==predictions)

