## weighted mean
# cat('\014')
# 5
# 10 40 30 50 20
# 1 2 3 4 5

f <- file("stdin")
on.exit(close(f))
T <- readLines(f)

n <- as.numeric(T[1])

if(n >= 5 && n <= 50){
    x <- as.numeric(unlist(strsplit(T[2], " ")))
    w <- as.numeric(unlist(strsplit(T[3], " ")))
}

if ((min(x) > 0 && max(x) <= 100) && (min(w) > 0 && max(w) <= 100)) {
    wmean <- sum(x*w)/sum(w)
    wmean <- round(wmean, 1)
    write(format(wmean, nsmall = 1), stdout())
}

