# Atomic vectors
die <- c(1, 2, 3, 4 , 5, 6)
die
is.vector(die)

# Types of atomic vectors 1. Doubles
num <- c(1, 2, 4, 5, 7, 8)
num
typeof(num)

# Integer vectors
int <- c(-3L, -2L, 2L, 3L)
int
typeof(int)

# character vectors
text <- c("Hello", "world")
text
typeof(text)

# Exercise 1, spot the difference between a character string and a number
number <- 1
number
typeof(number)

txt <- "1"
txt
typeof(txt)

# logical vectors
4 > 5
5 < 8

# complex and raw vectors
comp <- c(1 + 1i, 1 + 2i, 1 + 3i)
comp
typeof(comp)

raw(4)
typeof(raw(4))

# Exercise 2, create the name of the ace spades
hand <- c("ace", "king", "queen", "jack", "ten")
hand
typeof(hand)

# attributes, name
names(die)
names(die) <- c("one", "two", "three", "four", "five", "six")
names(die)
die
die + 2

names(die) <- NULL
names(die)

# attributes, dimension
dim(die) <- c(2, 3)
die
dim(die) <- c(3, 2)
die
dim(die) <- c(1, 2, 3)
die

# Matrices
matrice <- matrix(die, nrow = 2)
matrice

matrice <- matrix(die, nrow = 2, byrow = TRUE)
matrice

# Exercise 3,creating matrix
name1 <- c("ace", "king", "queen", "jack", "ten", "spades", "spades", "spades", "spades", "spades")
name1
dim(name1) <- c(5, 2)
name1

# dates and time
time <- Sys.time()
time
typeof(time)
class(time)

#Exercise 4, use list to store playing cards
card <- list("ace", "hearts", 1)
card
