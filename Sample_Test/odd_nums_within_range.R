cat('\014')

# odds within a range
l <- 3
r <- 13

arr <- c()

if (l %% 2 == 0) {
    temp <- l
    while (1) {
        temp <- temp + 1
        if (temp > r) {
            break
        } else{
            if ((temp %% 2) != 0) {
                write(temp, stdout())
                arr <- c(arr, temp)
            }
        }
    }
    # write("hello world", stdout())
} else{
    temp <- l
    write(temp, stdout())
    arr <- c(arr, temp)
    while (1) {
        temp <- temp + 2
        if (temp > r) {
            break
        } else{
            if ((temp %% 2) != 0) {
                write(temp, stdout())
                arr <- c(arr, temp)
            }
        }
    }
}