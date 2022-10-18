# Stroke prediction using Logistic regression
Stroke prediction using Logistic regression from both Statistical and Machine Learning Perspective



## Data Source
[Stroke Prediction Dataset](https://www.kaggle.com/datasets/fedesoriano/stroke-prediction-dataset)



## Research Methods and Process

### Feature Engineering _ 1
* Missing values imputation
* Deal with Groups with a particularly small number of categorical variables

### Descriptive Statistics
* Continuous variables
  * Quartile, Mean, Skewness & Kurtosis
  * Correlation coefficient
* Categorical Variables
  * Count & Proportion for each group of categorical variables
  * Chi-square test

### Feature Engineering _ 2
* Repetitive sampling for **stroke = 1** due to the large difference in the number of **stroke = 1** and **stroke = 0**
* Dummy coding

### Building a Logistic Regression Model
#### From a Statistical Perspective
* Full model
* Model selection - Backward, criteria is AIC
#### From a Machine Learning Perspective
* Model a hundred times and find the best
* Cross Validation



## Research Result
Compared with statistics concerned with the influencing factors of dependent variable, machine learning focuses almost entirely on the accuracy of predictions. Statistical methods use the P value to determine the significance of an independent variables, whereas machine learning does not care about the P value. Instead, we can standardize the independent variables and judge the sensitivity of the independent variable to the dependent variable by the absolute value of the estimated coefficient of the model.
