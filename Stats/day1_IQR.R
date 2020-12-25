# day1:IQR

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

get_q1_q2_q3 <- function(x) {
    q2 <- median(x)
    if (length(x) %% 2 != 0) {
        bidx <-  ceiling(length(x) / 2)
        x1 <- x[1:(bidx - 1)]
        x3 <- x[(bidx + 1):length(x)]
        q1 <- median(x1)
        q3 <- median(x3)
    } else{
        bidx <- length(x) / 2
        x1 <- x[1:bidx]
        x3 <- x[(bidx + 1):length(x)]
        q1 <- median(x1)
        q3 <- median(x3)
    }
    return(list(q1 = q1, q2 = q2, q3 = q3))
}
##############################################
T <- readLines(n = 3)

n <- as.numeric(T[1])

if (n >= 5 && n <= 50) {
    x <- as.numeric(unlist(strsplit(T[2], " ")))
    f <- as.numeric(unlist(strsplit(T[3], " ")))
}

if ((min(x) > 0 &&
     max(x) <= 100) && (sum(f) > 0 && sum(f) <= 10 ^ 3)) {
    arr <- c()
    for (i in 1:n) {
        arr <- c(arr, rep(x[i], f[i]))
    }
    if (length(arr) == sum(f)) {
        arr <- sort(arr, decreasing = FALSE)
        res <- get_q1_q2_q3(arr)
        iqr <- res$q3 - res$q1
        iqr <- round(iqr, 1)
        write(format(iqr, nsmall = 1), stdout())
    }
}
