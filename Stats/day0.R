cat("\014")

# 10
# 64630 11735 14216 99233 14470 4978 73429 38120 51135 67060

# Day 0: Mean, Median, and Mode
f <- file("stdin")
on.exit(close(f))
T <- readLines(f)

N <- as.numeric(T[1])

arr <- as.numeric(unlist(strsplit(T[2], " ")))

write(sum(arr)/N, stdout())

arr <- sort(arr)

if (length(arr)%%2 != 0){
    idx <- ceiling(length(arr)/2)
    median <- arr[idx]
}else{
    idx <- length(arr)/2
    median <- (arr[idx] + arr[idx+1])/2
}

#print(paste('median = ', median))
write(median, stdout())


df <- as.data.frame(table(arr))

idx <- which(df$Freq == max(df$Freq))

#print(paste('mode = ', arr[idx[1]]))
write(arr[idx[1]], stdout())

# T <- strsplit(T, " ")
# Ti <- as.numeric(T[[1]])
# write(Ti, stdout())
