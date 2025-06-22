setwd("/workspaces/r_dev_container/MnM5")
mnm <- read.csv("mms.csv")

colors <- unique(mnm$color)
colors

types <- unique(mnm$type)

## #1
## find the mean and standard deviation for diameter and mass using
## type, type+color

for(kind in types)
{
  avgw <- mean(mnm$mass[mnm$type == kind])
  avgs <- mean(mnm$diameter[mnm$type == kind])
  stdw <- sd(mnm$mass[mnm$type == kind])
  stds <- sd(mnm$diameter[mnm$type == kind])
  cat(kind, "\nmean weight:\t", avgw, "\nmean size:\t", avgs,
      "\nstd weight:", stdw, "\nstd size:", stds,"\n")

  cat("\n\n",kind,"color breakdown:\n")
  for(clr in colors)
  {
    tcaw <- mean(mnm$mass[mnm$type == kind & mnm$color == clr])
    tcas <- mean(mnm$diameter[mnm$type == kind & mnm$color == clr])
    tcstdw <- sd(mnm$mass[mnm$type == kind & mnm$color == clr])
    tcstds <- sd(mnm$diameter[mnm$type == kind & mnm$color == clr])
    cat(clr, "\nmean weight is:\t", tcaw, "\nmean size is:\t", tcas,
        "\nstd weight:", tcstdw,"\nstd size:", tcstds,"\n\n")
  }

}

## #2
## proportion of each type of color

## I don't need to subtract for the header, right?
mnm
## nope.. okay
total = nrow(mnm)
total

for(clr in colors)
{
  clrcnt = sum(mnm$color == clr)
  cat(clr, "appears",100 * clrcnt/total, "% of the time. (", clrcnt, "/", total, ")\n")
}


## #3 bar chart of #2

## some extra fuckery to get the height to accept it
counts <- numeric(length(colors))

## could have just gone back and modified 2, sure...

for(i in seq_along(colors))
{
  clr <- colors[i]
  counts[i] <- sum(mnm$color == clr)
}

barplot(counts, names.arg = colors, main = "Count of Colors", xlab = "Colors", ylab = "Counts", col = "darkorange")
## orange because it's the only color that doesn't get spelled out, so it seems fair...

## #4
## no, they're not. Oh, you want more... okay.. shit (where's tableau when I need it?!) [kidding, of course]

## type-color-count (interesting that numeric sets it to a vector...)

for(kind in types)
{
  i = 1
  for(clr in colors)
  {
    ## set the (row)column-vector to hold, reusing counts
    counts[i] <- sum(mnm$color == clr & mnm$type == kind)
    i <- i + 1 ## really, for all R has, it doesn't have ++ or +=?
  }
  barplot(counts, names.arg = colors, main = "Colors on Types", xlab = "Colors", ylab = "Counts", col = "pink")
}

## as I suspected, no... (I had an 18-bar plot, but, the counts on the different sizes fucked it up and the labeling
## was too difficult for me to figure out)


## #5 && #6
## are mnms of different type the same weight, hard no (recall #1)

for(kind in types)
{
  stdw <- sd(mnm$mass[mnm$type == kind])
  stds <- sd(mnm$diameter[mnm$type == kind])
  avg <- mean(mnm$mass[mnm$type == kind])
  imprint <- mean(mnm$diameter[mnm$type == kind])
  cat(kind, "\nweight:", stdw, "\nstd size:", stds,"\naverage weight:\t",avg,
      "\naverage size:", imprint,
      "\nstd weight / avg weight", stdw / avg,
      "\nstd size / average size", stds / imprint,
      "\n\n")
}

## fairly consistent plain M&Ms, but the other two vary quite a bit (should I have used variance?)


## #6 see above


## #7
## ... what?? are we using average or literally picking m&ms from the pile?
## plain          369.9 G
## peanut         369.9 G
## peanut butter  360   G


for(kind in types)
{
  cat(kind, sum(mnm$mass[mnm$type == kind]), "\n")
}

## damn, all over... okay
plain <- sort(mnm$mass[mnm$type == "plain"], decreasing = T)
pnut <- sort(mnm$mass[mnm$type == "peanut"], decreasing = T)
pb <- sort(mnm$mass[mnm$type == "peanut butter"], decreasing = T)
## wow, the smallest is less than half the largest...
pb
pnut ## close here, too

## let's see what AI says...
# Function to find if there is a subset with a given sum
subset_sum <- function(weights, target) {
  n <- length(weights)
  dp <- matrix(FALSE, n + 1, target + 1)
  dp[1, 1] <- TRUE

  for (i in 1:n) {
    for (j in 1:(target + 1)) {
      if (j < weights[i]) {
        dp[i + 1, j] <- dp[i, j]
      } else {
        dp[i + 1, j] <- dp[i, j] || dp[i, j - weights[i]]
      }
    }
  }

  return(dp[n + 1, target + 1])
}

# Example usage
target_weight <- 369.9
result <- subset_sum(pnut, target_weight)

if (result) {
  print("There is a subset of weights that sums to the target weight.")
} else {
  print("No subset of weights sums to the target weight.")
}
## above, dynamic programming approach.
###################################################
## below, simpler break point approach.
## (this would work, for valued customers, set condition at the end, for valued pockets, set break point at beginning)
#find_subset <- function(weights, target, current = c(), index = 1) {
#  if (target == 0) {
#    return(current)
#  }
#  if (target < 0 || index > length(weights)) {
#    return(NULL)
#  }
#
#  # Include the current weight
#  with_current <- find_subset(weights, target - weights[index], c(current, weights[index]), index + 1)
#
#  # Exclude the current weight
#  without_current <- find_subset(weights, target, current, index + 1)
#
#  return(if (!is.null(with_current)) with_current else without_current)
#}

## gotta rerun my shell a lot and this is super slow...

# Example usage
#result_combination <- find_subset(pnut, target_weight)

#if (!is.null(result_combination)) {
#  print(paste("Combination found:", toString(result_combination)))
#} else {
#  print("No combination of weights sums to the target weight.")
#}
#############################################################
#############################################################
## still #7
## plain          369.9 G (actual 399.55)
## peanut         369.9 G (actual 397.45)
## peanut butter  360   G (actual 361.42)

## the smallest we can make is .72, (2) .73, .74, (2) .76
plain
plainOver <- 399.55 - 369.9 # (29.65, wow, over an ounce extra!)
## okay... well, I say we just add up a bunch from the vectors and make it even

x = sum(plain[1:419])
x
369.9 - x ## 3.98 (3.98 / 5 = .796)
.8 + .8 + .8 + .79 + .79

## SOLUTION TO PLAIN ##
## sort them by weight, descending. Take the first 419 M&Ms then numbers 430-434
## AND VIOLA, you have EXACT Weight. Don't worry about the profits or the customer...

## and since this is actually a cheap question that I've over-killed to not even find the desired solutions for
## (one answer that covers 2, and an algorithm that I didn't write which could solve all of them) I'm moving on


## #8
## Now we are going to revise the procedure:  color matters.  As you add M&Ms
## to the bag, you must first generate their color randomly and then use the
## parameters from that color (calculated in Step 1 B) to specify the values
## for weight and diameter randomly using a distribution.  Use the same
## assumptions for your previous bag samples. (20 points)

## plain / peanut / peanut butter weights
## blue       brown       green       orange      red         yellow
## 0.86023    0.87058     0.86989     0.86480     0.85448     0.86547
## 2.57593    2.57130     2.68074     2.57035     2.62650     2.56704
## 1.85250    1.80310     1.92029     1.73000     1.47048     1.73962

colors <- sort(colors)
colors

## plain color weights
pcw <- c(0.86023, 0.87058, 0.86989, 0.86480, 0.85448, 0.86547)
## pnut color weights
pncw <- c(2.57593, 2.57130, 2.68074, 2.57035, 2.62650, 2.56704)
## pnut butter color weights
pbcw <- c(1.85250, 1.80310, 1.92029, 1.73000, 1.47048, 1.73962)

## wait a minute... but the color distribution isn't flat...
makeOver <- function(weightVector, colorOrder, targetWeight)
{
  ## initialize weight, blank color tally, total tally (redundant but easy and inexpensive)
  weight <- 0
  colorDist <- rep(0, 6)
  total <- 0
  ## repeat while under, this should execute once more bringing it over
  while(weight < targetWeight)
  {
    m <- sample(1:6, 1)
    weight <- weight + weightVector[m]
    colorDist[m] <- colorDist[m] + 1
    total <- total + 1
  }
  cat(total, "M&M's for a weight of", weight, "\n")
  for(x in 1:6)
  {
    cat("Color", colorOrder[x], "was picked", colorDist[x], "times\n")
  }
}

makeOver(pcw, colors, 369.9)
makeOver(pncw, colors, 369.9)
makeOver(pbcw, colors, 360)


makeUnder <- function(weightVector, colorOrder, targetWeight)
{
  ## initialize weight, blank color tally, total tally (redundant but easy and inexpensive)
  weight <- 0
  colorDist <- rep(0, 6)
  total <- 0
  ## repeat while under,...
  repeat
  {
    m <- sample(1:6, 1)

    ## sentinel value
    if(weight + weightVector[m] > targetWeight)
    {break}
    ## didn't break, add weight, add color tally and total
    weight <- weight + weightVector[m]
    colorDist[m] <- colorDist[m] + 1
    total <- total + 1
  }

  cat(total, "M&M's for a weight of", weight, "\n")
  for(x in 1:6)
  {
    cat("Color", colorOrder[x], "was picked", colorDist[x], "times\n")
  }
}


makeUnder(pcw, colors, 369.9)
makeUnder(pncw, colors, 369.9)
makeUnder(pbcw, colors, 360)


## #9
