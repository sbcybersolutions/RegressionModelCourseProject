# Boxplot: MPG by transmission
p1 <- ggplot(mtcars, aes(x = am, y = mpg, fill = am)) +
  geom_boxplot(width = 0.5, alpha = 0.7, outlier.shape = NA) +
  geom_jitter(width = 0.1, color = "black", alpha = 0.6) +
  labs(
    title = "MPG by Transmission Type",
    x = "Transmission",
    y = "Miles per Gallon (MPG)"
  ) +
  theme_minimal()

# Plot adjusted model results
mtcars_aug <- augment(model_adjusted)

p2 <- ggplot(mtcars_aug, aes(x = am, y = mpg)) +
  geom_boxplot(aes(fill = am), alpha = 0.4, outlier.shape = NA) +
  geom_jitter(aes(size = wt, color = hp), width = 0.1, alpha = 0.7) +
  labs(
    title = "Adjusted MPG by Transmission",
    x = "Transmission",
    y = "Miles per Gallon (MPG)"
  ) +
  theme_minimal()

# Arrange visuals in appendix-style format
ggarrange(p1, p2, ncol = 1, nrow = 2)
