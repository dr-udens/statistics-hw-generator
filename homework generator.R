n <- 29
path <- "C:/Users" #write the folder path where you want the files here
for (x in 1:n){

r12 <- -0.4
r23 <- 0.6
r13 <- -0.3

sigma <- rbind(c(1, r12, r13),
               c(r12, 1, r23),
               c(r13, r23, 1))
#sigma <- sigma + diag(ncol(sigma))*0.01
#det(sigma)

mu1 <- 4
mu2 <- rnorm(n = 1, mean = 2.6, sd = 1.4)
mu3 <- rnorm(n=1, mean = 73, sd = 41)

mu <- c(mu1, mu2, mu3)

#generate the data frame
set.seed(x)
df <- as.data.frame(mvrnorm(n=100, mu=mu, Sigma=sigma))
df$V1 <- round(df$V1, digits = 0)

library(writexl)
write_xlsx(df, paste(path, "/homework", as.character(x), ".xlsx"))
}
# files will be named "homework1.xlsx"