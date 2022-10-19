a <- read.csv("C:/Users/VN43072/Downloads/healthcare-dataset-stroke-data.csv", header=T)

a$bmi[is.na(a$bmi)] <- mean(as.numeric(a$bmi), na.rm = T)  # Impute fields with bmi as NA by means
a$bmi <- as.numeric(a$bmi)
a <- a[-which(a$gender == 'Other'),]   # Delete a data 'gender = Other'
a$work_type[which(a$work_type == 'Never_worked')] <- 'children'  #  Merge 'work_type=Never_worked' and 'work_type=children' 


# Relationship between age and categorical variables
summary(aov(age~hypertension, data=a))   # P-value: <2e-16
summary(aov(age~heart_disease, data=a))  # P-value: <2e-16
summary(aov(age~ever_married, data=a))   # P-value: <2e-16
summary(aov(age~work_type, data=a))      # P-value: <2e-16

par(mfcol=c(2,2))
boxplot(age~hypertension, data=a)
boxplot(age~heart_disease, data=a)
boxplot(age~ever_married, data=a)
boxplot(age~work_type, data=a)


# Sampling
table(a$stroke)
##    0    1 
## 4861  249
a0 <- a[which(a$stroke=='0'),]
a0 <- a0[sample(nrow(a0), size = 498, replace = F), ]
a2 <- rbind(a[which(a$stroke=='1'),], a0)


# Remove "age" from the model
m1<- glm(stroke~gender+hypertension+heart_disease+ever_married+work_type+Residence_type+avg_glucose_level+bmi+smoking_status,
             data=a2, family = "binomial")
summary(m1)
##                              Estimate Std. Error z value Pr(>|z|)    
##  genderMale                  0.142971   0.176181   0.812 0.417076    
##  hypertension                0.716174   0.224285   3.193 0.001407 ** 
##  heart_disease               0.963513   0.270658   3.560 0.000371 ***
##  ever_marriedYes             0.660938   0.252513   2.617 0.008859 ** 
##  work_typeGovt_job           2.119422   0.800967   2.646 0.008143 ** 
##  work_typePrivate            2.327055   0.771333   3.017 0.002554 ** 
##  work_typeSelf-employed      2.862030   0.790390   3.621 0.000293 ***
##  Residence_typeUrban         0.194992   0.171795   1.135 0.256365    
##  avg_glucose_level           0.006238   0.001617   3.857 0.000115 ***
##  bmi                        -0.032866   0.013716  -2.396 0.016570 *  
##  smoking_statusnever smoked -0.299333   0.225963  -1.325 0.185271    
##  smoking_statussmokes       -0.395405   0.271870  -1.454 0.145838    
##  smoking_statusUnknown      -0.423157   0.258441  -1.637 0.101558    

