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
m1<- glm(stroke~age+hypertension+heart_disease+ever_married+work_type,
         data=a2, family = "binomial")
summary(m1)
##                          Estimate Std. Error z value Pr(>|z|)    
##  (Intercept)            -4.051489   0.723755  -5.598 2.17e-08 ***
##  age                     0.079704   0.007308  10.907  < 2e-16 ***
##  hypertension            0.644057   0.244730   2.632   0.0085 ** 
##  heart_disease           0.783667   0.313572   2.499   0.0124 *  
##  ever_marriedYes        -0.067337   0.315747  -0.213   0.8311    
##  work_typeGovt_job      -1.325078   0.869637  -1.524   0.1276    
##  work_typePrivate       -1.238982   0.847327  -1.462   0.1437    
##  work_typeSelf-employed -1.769842   0.892604  -1.983   0.0474 *   


m2<- glm(stroke~hypertension+heart_disease+ever_married+work_type,
         data=a2, family = "binomial")
summary(m2)
##                          Estimate Std. Error z value Pr(>|z|)   
##  (Intercept)             -3.4177     0.7186  -4.756 1.97e-06 ***
##  hypertension             1.0117     0.2196   4.608 4.07e-06 ***
##  heart_disease            1.6153     0.2914   5.543 2.97e-08 ***
##  ever_marriedYes          0.8011     0.2466   3.249  0.00116 ** 
##  work_typeGovt_job        1.6301     0.7846   2.078  0.03774 *  
##  work_typePrivate         1.8152     0.7566   2.399  0.01643 *  
##  work_typeSelf-employed   1.9943     0.7766   2.568  0.01023 * 

