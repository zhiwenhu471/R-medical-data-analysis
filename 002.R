library(tidyverse)
library(caret)
library(ggplot2)

theme_set(theme_bw())

# Load the data--marketing
data("marketing", package = "datarium")
# Inspect the data
sample_n(marketing, 3)

# Split the data into training(80%) and test(20%) set
set.seed(123)  # for reproducibility
training.samples <- marketing$sales %>%
  createDataPartition(p = 0.8, list = FALSE)
train.data  <- marketing[training.samples, ]
test.data <- marketing[-training.samples, ]

# Build the model
model <- lm(sales ~., data = train.data)
# Summarize the model
summary(model)
# Make predictions
predictions <- model %>% predict(test.data)
# Model performance
# (a) Prediction error, RMSE
RMSE(predictions, test.data$sales)
# (b) R-square
R2(predictions, test.data$sales)

# simple linear regression
model <- lm(sales ~ youtube, data = train.data)
summary(model)$coef

# predict()
newdata <- data.frame(youtube = c(0,  1000))
model %>% predict(newdata)

# multiple linear regression
model <- lm(sales ~ youtube + facebook + newspaper, 
            data = train.data)
summary(model)$coef

ggplot(marketing, aes(x = youtube, y = sales)) +
  geom_point() +
  stat_smooth()