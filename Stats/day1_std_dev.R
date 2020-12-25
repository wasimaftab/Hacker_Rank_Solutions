# f <- file("stdin")
# on.exit(close(f))
# 5
# 10 40 30 50 20
cat('\014')
T <- readLines(n = 2)

n <- as.numeric(T[1])

if(n >= 5 && n <= 100){
    x <- as.numeric(unlist(strsplit(T[2], " ")))
}

if (min(x) > 0 && max(x) <= 10^5) {
    mean <- sum(x)/n
    res <- sqrt(sum((x-mean)^2)/n)
    res <- round(res, 1)
    write(format(res, nsmall = 1), stdout())
}