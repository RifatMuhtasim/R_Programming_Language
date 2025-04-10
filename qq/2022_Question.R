

#### 1.i) Identify Influential Factors of academic performance of students.
summary(gpa_model)




#### 1.ii) Is there any variation of academic performance with respect to gender and economic condition.
#For Gender
ttest_result <- t.test(GPA ~ Gender, data= student_df)
cat("TTest Value is:", ttest_result$statistic)
cat("TTest P-Value is:", ttest_result$p.value)
if (ttest_result$p.value <= 0.05){
  cat("Reject Null Hypothesis. There is a significant difference between them.")
} else {
  cat("Fail to Reject Null Hypothesis. There is no difference")
}
print(ttest_result)

#ANOVA 
anova_result <- aov(GPA ~ Economic_Condition, data= student_df)
print(summary(anova_result))

tukey_test <- TukeyHSD(anova_result)
print(tukey_test)





#### 2.i) Using the best fitted model, forecast the production and consumption of tea in Bangladesh.
production_df <- data.frame(
  Year = 2010:2021,
  Production_thousands_kg = c(60.04, 59.13, 62.52, 66.26, 63.88, 67.38, 85.95, 78.95, 82.13, 96.07, 86.39, 96.51),
  Consumption_thousands_kg = c(57.63, 58.50, 61.19, 64.00, 67.17, 77.57, 81.64, 85.93, 90.45, 65.20, 95.02, 65.24)
)
tail(production_df)

prod_model <- lm(Production_thousands_kg ~ Year, data= production_df)
cons_model <- lm(Consumption_thousands_kg ~ Year, data= production_df)
summary(prod_model)
summary(cons_model)
future_years <- data.frame(Year= c(2022, 2023, 2024))
prod_predict <- predict(prod_model, newdata = future_years)
cons_predict <- predict(cons_model, newdata = future_years)
cat("Production Prediction:", prod_predict)
cat("Consumption Prediction:", cons_predict)





#### 2. ii) Is there any significant relationship between production and consumption
corr_result <- cor.test(production_df$Production_thousands_kg, production_df$Consumption_thousands_kg)
cat("Correlation value is:", corr_result$estimate)
if (corr_result$p.value <= 0.05){
  cat("Reject Null Hypothesis. There is a diffrence")
} else {
  cat("Fail to Reject Null Hypothesis. There is no difference")
}








