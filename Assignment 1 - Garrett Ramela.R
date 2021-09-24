# Foundations of AI
# Assignment 1
# Garrett Ramela

# Ensure that your current working directory is set up properly.
# setwd("~/Documents/George Washington University/Foundations of AI/Assignment 1")

# Read the College.csv data set into RStudio.
college <- read.csv('College.csv') 

# Add a new column named rownames that R will not perform calculations on.
rownames(college) = college[ ,1]
fix(college)

# Remove the college column and only show the rownames column.
college = college [ , -1]
fix(college)

# Using the summary, head, and View functions to get a feel for the college data set.
summary(college)
head(college)
View(college)

# Create a series of plots across the numerical variables within the college data set after
# making the first column a numerical field.
college[, 1] = as.numeric(factor(college[, 1]))
pairs(college[,1:10])

# Use the boxplot() function to produce side-by-side box plots of Outstate versus Private
boxplot(Outstate ~ Private,
        xlab = "No = Public School / Yes = Private School",
        ylab = "Out-of-State Tuition Rate",
        col = "Blue")

# Creating variable Elite that includes the top 10 percent of students from high schools and
# append the field to the existing college data set.
Elite = rep("No", nrow(college))
Elite[Top10perc > 50] = "Yes"
Elite = as.factor(Elite)
college = data.frame(college, Elite)

# Print a summary of the new college data set with the Elite column.
summary(college)

# Use the boxplot() function to produce side-by-side box plots of Outstate versus the new Elite variable.
boxplot(Outstate ~ Elite,
        xlab = "No = Not Elite School / Yes = Elite School",
        ylab = "Out-of-State Tuition Rate",
        col = "Blue")

# Print a series of six (6) histrograms showing distributions of applicants, accepted students,
# percentage of PhDs, student/faculty ratio, percent of alumni who donate, and graduation rate.
par(mfrow = c(2, 3))
hist(Apps,
     main = "Student Applicants",
     xlab = "Student Applicants",
     col = "Blue",
     breaks = 50)
hist(Accept,
     main = "Accepted Students",
     xlab = "Accepted Students",
     col = "Blue",
     breaks = 50)
hist(PhD,
     main = "PhD Faculty Percentage",
     xlab = "PhD Faculty Percentage",
     col = "Blue",
     breaks = 50)
hist(S.F.Ratio,
     main = "Student/Faculty Ratio",
     xlab = "Student/Faculty Ratio",
     col = "Blue",
     breaks = 50)
hist(perc.alumni,
     main = "Donating Alumni Percentage",
     xlab = "Donating Alumni Percentage",
     col = "Blue",
     breaks = 50)
hist(Grad.Rate,
     main = "Graduation Rate",
     xlab = "Graduation Rate",
     col = "Blue",
     breaks = 50)

# Use the plot() function to produce side-by-side box plots of Outstate versus Private
library(ggplot2)
ggplot(college, aes(x = S.F.Ratio, y = Outstate)) +
  geom_point(aes(color = Private, shape = Elite)) +
  geom_smooth(method = lm) +
  labs(title = "Student/Faculty Ratio Effect on Tuition",
       subtitle = "Grouped Across Public & Public Schools",
       x = "Student/Faculty Ratio",
       y = "Out-of-State Tuition Rate",
       color = "Private School",
       shape = "Elite School")

ggplot(college, aes(x = PhD, y = Outstate)) +
  geom_point(aes(color = Private, shape = Elite)) +
  geom_smooth(method = lm) +
  labs(title = "Faculty PhD Percentage Effect on Tuition",
       subtitle = "Grouped Across Public & Public Schools",
       x = "Faculty with PhDs Percentage",
       y = "Out-of-State Tuition Rate",
       color = "Private School",
       shape = "Elite School")

ggplot(college, aes(x = perc.alumni, y = Outstate)) +
  geom_point(aes(color = Private, shape = Elite)) +
  geom_smooth(method = lm) +
  labs(title = "Donating Alumni Percentage Effect on Tuition",
       subtitle = "Grouped Across Public & Public Schools",
       x = "Donating Alumni Percentage",
       y = "Out-of-State Tuition Rate",
       color = "Private School",
       shape = "Elite School")