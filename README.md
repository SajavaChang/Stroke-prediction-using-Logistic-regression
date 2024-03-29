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
### From a Statistical Perspective Model
**Part I** &nbsp; (see *Stroke prediction using Logistic regression.ipynb - 4.3*)
* Marital status and presence of heart disease have no significant effect on stroke
* Older age, hypertension, higher glucose level and higher BMI increase the risk of stroke
* Men have lower risk of stroke than women
* Work types in descending order of stroke risk: children, private, government, self-employed
* Poeple who live in rural have lower risk of stroke than Poeple live in urban
* Smoking status in descending order of stroke risk: smokes, formerly smoked, never smoked
* In fact, the model results are different from my expected as follows:
  1. Heart disease has no significant effect on stroke
  2. Children has higher risk of stroke than workers
  
**Part II** &nbsp; (see *age and categorical variables.R*)
* After further exploration of the relationship between the variable "age" and other categorical variables, it was found that age is significantly different between the group means of those variables in picture below
![Boxplots for Age and Categorical Variables](https://github.com/SajavaChang/Stroke-prediction-using-Logistic-regression/blob/main/Boxplots%20for%20Age%20and%20Categorical%20Variables.png)
* Based on above, I believe the variable "age" may affect the estimated coefficients for some of other variables. To prove my idea, I sampled 747 data from the raw data and built the model using only the variables of age, hypertension, heart_disease, ever_married and work_type. And then, compared to another model built without the variable "age", found that:
  * Heart disease has significant impact on stroke
  * Work types in descending order of stroke risk is self-employed, private, government and children, the directionality of the estimated coefficients were opposite.

**Finally, I would like to say...**
* Obviously, if the researcher has no domain knowledge, it is sometimes difficult to judge whether the model results are reasonable
* Tip for future researchers: Study different age groups separately, for example "stroke prediction in prime adults (25-44 year-old)". At this point, there is no need to put the variable "age" in the model.


### From a ML Perspective Model
* Compared with statistics concerned with the influencing factors of dependent variable, machine learning focuses almost entirely on **the accuracy of predictions**. Statistical methods use the P value to determine the significance of an independent variables, whereas machine learning does not care about the P value. Instead, I think we can standardize the independent variables and judge the sensitivity of the independent variable to the dependent variable by the absolute value of the estimated coefficient of the model.
* In terms of model results, the accuracy of the model is 78.19%, CI : 2.92%
