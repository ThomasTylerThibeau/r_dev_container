quotidian <- function(namedVector = analyze())
{

}

# Sample named vector
word_vector <- c("apple" = 10, "banana" = 5, "cherry" = 8, "date" = 12, "elderberry" = 3)

# Specify the number of top words you want
n <- 3

# Sort the vector in descending order and select the top n words
top_words <- head(sort(word_vector, decreasing = TRUE), n)

# Create a bar chart
barplot(top_words, main = "Top N Words", xlab = "Words", ylab = "Frequency", col = "blue")
