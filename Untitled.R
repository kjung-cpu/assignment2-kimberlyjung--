
penguins <- read.csv("/Users/kimberlyjung/Documents/GitHub/assignment2-kimberlyjung--/penguins.csv")

#1. Summary statistics
summary(penguins)

#2. Frequency table comparing island and species
tab1 <- table(penguins$island, penguins$species)
tab1

#3. Mean body mass by species
body_mass_means <- tapply(
  penguins$body_mass_g,
  penguins$species,
  mean,
  na.rm = TRUE
)
body_mass_means

#4. Correlation between bill length &  depth
cor(
  penguins$bill_length_mm,
  penguins$bill_depth_mm,
  use = "complete.obs"
)

# Save analysis output to a text file
sink("penguins-output.txt")

cat("Penguin Analysis\n\n")

cat("1. Summary Statistics\n")
print(summary(penguins))

cat("\n2. Species by Island Frequency Table\n")
print(tab1)

cat("\n3. Mean Body Mass by Species (grams)\n")
print(body_mass_means)

cat("\n4. Correlation Between Bill Length and Bill Depth\n")
print(cor(
  penguins$bill_length_mm,
  penguins$bill_depth_mm,
  use = "complete.obs"
))

sink()

