# Load libraries -----------------------------------------------------------

library(tidyverse)
library(broom)
library(ggplot2)
library(performance)   # For model checks
library(ggpubr)        # Optional: arrange diagnostic plots
library(car)           # For advanced diagnostic plots

# Load and prepare data ----------------------------------------------------

data("mtcars")

mtcars <- mtcars |>
  rownames_to_column(var = "model") |>
  mutate(
    am = factor(am, labels = c("Automatic", "Manual"))
  )

# Fit models ---------------------------------------------------------------

# Simple model: mpg ~ am
model_simple <- lm(mpg ~ am, data = mtcars)

# Adjusted model: mpg ~ am + wt + hp
model_adjusted <- lm(mpg ~ am + wt + hp, data = mtcars)

# Tidy model summaries
simple_summary <- tidy(model_simple)
adjusted_summary <- tidy(model_adjusted)
model_metrics   <- glance(model_adjusted)

# Confidence interval for adjusted transmission coefficient
confint_am <- confint(model_adjusted)["amManual", ]

# Diagnostics summary (assumptions and residuals)
check_model(model_adjusted)
