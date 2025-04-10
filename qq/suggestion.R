#Install Packages
#install.packages("ggplot2")
#install.packages("car")
#install.packages("psych")
library('ggplot2')
library('car')
library('psych')


#### Dataset

student_df <- data.frame(
  Subject= 1:14,
  GPA= c(3.8, 4.0, 3.2, 3.5, 2.5, 3.0, 2.1, 2.8, 3.6, 4.0, 3.6, 3.4, 3.2, 2.0),
  Adaptability= c(45, 50, 45, 51, 60, 39, 42, 41, 46, 50, 53, 47, 48, 40),
  Self_Confidence = c(60, 10, 50, 25, 15, 80, 41, 14, 57, 68, 24, 95, 25, 36),
  IQ = c(105, 109, 102, 95, 92, 101, 99, 95, 94, 110, 104, 105, 98, 75),
  Gender = c("Female", "Female", "Female", "Female", "Male" , "Male", "Male", "Female", "Female", "Female", "Female", "Female", "Male", "Male"),
  Economic_Condition = c("Good", "Good", "Poor", "Good", 'Poor', 'Middle', 'Poor', 'Poor', 'Middle', 'Good', 'Good', 'Middle', 'Middle', 'Poor')
)
head(student_df)

student_df_encoded <- student_df
student_df_encoded$Gender <- ifelse(student_df_encoded$Gender == "Female", 1, 2)
student_df_encoded$Economic_Condition <- ifelse(student_df_encoded$Economic_Condition== "Poor", 1, ifelse(student_df_encoded$Economic_Condition== "Middle", 2, 3))
head(student_df_encoded)




#### 1.1. Normality test for continuous data
data <- student_df$GPA 
shapiro_result <- shapiro.test(data)
cat("Shapiro-Wilk Result Value is:", shapiro_result$statistic)
cat("Shapiro-Wilk test P-Value is:", shapiro_result$p.value)
if (shapiro_result$p.value <= 0){
  cat("\nReject Null Hypothesis. The data is not normally distributed.")
} else {
  cat("\nFail to Reject Null Hypothesis. This data is normally distributed.")
}
qqPlot(data, main="Q-Q Plot for IQ", ylab="IQ")




#### 1.2. Linear regression for GPA
gpa_model <- lm(GPA ~ Adaptability + Self_Confidence + IQ + Gender + Economic_Condition, data= student_df_encoded)
summary(gpa_model)




#### 1.3. Logistic Regression for Gender
gender_model <- glm(Gender ~ GPA + Adaptability + Self_Confidence + IQ, data= student_df_encoded)
summary(gender_model)

economic_model <- glm(Self_Confidence ~ Gender + Economic_Condition, data= student_df)
summary(economic_model)




#### 1.4. Cronbach's Alpha
dataset <- student_df_encoded[, c("GPA", "Economic_Condition")]
alpha = psych::alpha(dataset)
cat("Cronbach Alpha Value:", alpha$total$raw_alpha)














