# Assignment 2: Penguins Data Analysis_Tina Wei
setwd("/Users/weijiayi/Desktop/assignment2-tw")

#1. Load the dataset
penguins <- read.csv("penguins.csv")

#Summary Statistics
summary(penguins)
head(penguins)
str(penguins)
## Key Findings
# The dataset contains 344 observations and 8 variables:
# --> species, island, bill measurements, flipper length, body mass, sex, and year
# - Mean bill length: 43.92 mm
# - Mean bill depth: 17.15 mm
# - Mean flipper length: 200.9 mm
# - Mean body mass: approximately 4,202 g
# - Body mass range: 2,700–6,300 g

##============================================================================##
#2. Descriptive Analysis
#a.Count penguins by species
species_counts <- table(penguins$species)
print(species_counts)
View(species_counts)

# Calculate percentages
species_percentages <- prop.table(species_counts) * 100
# Create a results table
species_results <- data.frame(
  Species = names(species_counts),
  Count = as.vector(species_counts),
  Percentage = round(as.vector(species_percentages), 2)
)
View(species_results)

#b. Compare Average Body Mass by Species
# Calculate average body mass for each species
average_mass <- aggregate(
  body_mass_g ~ species,
  data = penguins,
  FUN = function(x) mean(x, na.rm = TRUE)
)
# View the results
print(average_mass)
View(average_mass)
##============================================================================##
#3. Export Analysis Results
# Export species counts and percentages
write.csv(
  species_results,
  "species_counts.csv",
  row.names = FALSE
)

##============================================================================##
#4. Visualize Average Body Mass by Species
png("average_body_mass_plot.png", width = 800, height = 600)
barplot(
  average_mass$body_mass_g,
  names.arg = average_mass$species,
  main = "Mean Body Mass by Penguin Species",
  xlab = "Species",
  ylab = "Average Body Mass (g)",
  col = "lightblue"
)
dev.off()