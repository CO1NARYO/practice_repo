# Assignment: Data Visualization and Manipulation in R
# Purpose: Analyzing the German Credit Risk Dataset


#Libraries or packages needed
library(ggplot2) #Data visualization
library(dplyr) #Data Manipulation 
library(readxl) #Reads German Credit Risk Excel File

#----Data----
German_Credit_Risk <- read_excel("C:/Users/cedie/Downloads/German Credit Risk.xlsx") #
View(German_Credit_Risk)
DATA <- German_Credit_Risk
attach(DATA)
detach(DATA)


#Declaring custom function to calculate loan risk score 
calculate_risk <- function(amount, duration){
  risk_score <- amount / duration #The function calculates a simple risk score based on credit amount and duration.
  return(risk_score)
} 
 
#The risk score basically estimates how risky a borrower is based on their credit data. 
#The risk score helps to summarize the probability that a borrower might fail to repay a loan.


#Demonstration of function
calculate_risk(5003, 24)

#------Data Structures------

#Using Vector
credit_vector <- DATA$Credit_amount #This extracts a vector of credit amounts

credit_vector #Outputs the vector

# FACTOR (Ordered)
# Create ordered factor for risk level
risk_factor <- factor(German_Credit_Risk$Risk,
                      levels = c("good", "bad"),
                      ordered = TRUE)

risk_factor #Outputs the risk factor in an ordered form 


# TABLE
# Create frequency table for risk
risk_table <- table(DATA$Risk)

risk_table #Outputs the number of "bad" and "good" payers based on the frequencies of the Risk column. 

# DATA FRAME
# Create a new smaller dataframe
credit_df <- data.frame(
  Age = DATA$Age,
  Sex = DATA$Sex,
  Credit_amount = DATA$Credit_amount,
  Duration = DATA$Duration,
  Risk = DATA$Risk
)

credit_df


#-----DATA MANIPULATION-----

# Select specific columns
credit_selected <- DATA %>% 
  select(Age, Sex, Credit_amount, Duration, Risk)

head(DATA) #This displays the first 6 rows of the dataset with its selected columns and categories, German_Credit_Risk. 

# Filter borrowers older than 40
credit_filtered <- DATA %>%
  filter(Age > 40)

head(credit_filtered)

# Create new variable (monthly credit payment)
credit_mutated <- DATA %>%
  mutate(monthly_payment = Credit_amount / Duration)

head(credit_mutated)

# Sort dataset by highest credit amount
credit_sorted <- DATA %>%
  arrange(desc(Credit_amount))

head(credit_sorted)


# Summarize dataset
credit_summary <- DATA %>%
  summarise(
    average_credit = mean(Credit_amount),
    max_credit = max(Credit_amount),
    min_credit = min(Credit_amount)
  )

credit_summary


#------Data Visualization Using Base R------

# Histogram of Credit Amount
hist(DATA$Credit_amount,
     main = "Distribution of Credit Amount",
     xlab = "Credit Amount",
     col = "lightblue",
     border = "black")

# Boxplot of Credit Amount by Risk
boxplot(Credit_amount ~ Risk,
        data = DATA,
        main = "Credit Amount by Risk Level",
        xlab = "Risk",
        ylab = "Credit Amount",
        col = c("green","red"))


#------Data Visualization Using GGPLOT2------

# Scatter plot: Age vs Credit Amount
ggplot(DATA, aes(x = Age, y = Credit_amount)) +
  geom_point(color = "blue") +
  labs(
    title = "Age vs Credit Amount",
    x = "Age",
    y = "Credit Amount"
  )

# Bar chart: Risk distribution
ggplot(DATA, aes(x = Risk, fill = Risk)) +
  geom_bar() +
  labs(
    title = "Distribution of Credit Risk",
    x = "Risk Level",
    y = "Count"
  )


# Boxplot using ggplot2
ggplot(DATA, aes(x = Risk, y = Credit_amount, fill = Risk)) +
  geom_boxplot() +
  labs(
    title = "Credit Amount by Risk Level",
    x = "Risk",
    y = "Credit Amount"
  )