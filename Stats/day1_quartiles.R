# day1:Quartile
# f <- file("stdin")
# on.exit(close(f))
# 9
# 3 7 8 5 12 14 21 13 18
cat('\014')
##############################################
get_median <- function(arr) {
    if (length(arr) %% 2 != 0) {
        idx <- ceiling(length(arr) / 2)
        median <- arr[idx]
    } else{
        idx <- length(arr) / 2
        median <- (arr[idx] + arr[idx + 1]) / 2
    }
    return(median)
}
##############################################
T <- readLines(n = 2)

n <- as.numeric(T[1])

if (n >= 5 && n <= 50) {
    x <- as.numeric(unlist(strsplit(T[2], " ")))
}

if (min(x) > 0 && max(x) <= 10 ^ 2) {
    x <- sort(x, decreasing = FALSE)
    q2 <- get_median(x)
    
    if (length(x) %% 2 != 0) {
        bidx <-  ceiling(length(x) / 2)
        x1 <- x[1:(bidx - 1)]
        x3 <- x[(bidx + 1):length(x)]
        q1 <- get_median(x1)
        q3 <- get_median(x3)
    } else{
        bidx <- length(x) / 2
        x1 <- x[1:bidx]
        x3 <- x[(bidx + 1):length(x)]
        q1 <- get_median(x1)
        q3 <- get_median(x3)
    }
    
    # res <- sqrt(sum((x - mean) ^ 2) / n)
    # res <- round(res, 1)
    # write(format(res, nsmall = 1), stdout())
    write(q1, stdout())
    write(q2, stdout())
    write(q3, stdout())
}