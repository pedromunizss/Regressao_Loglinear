idade <- rep(c('30 >', '30 <'), each = 4, times = 1)
fuma <- rep(c('5 <', '5 >'), each = 2, times = 2)
gestacao <-  rep(c('260 <', '260 >'), each = 1, times = 4)
nao <- c(50, 41, 9, 4, 24, 14, 6, 1)
sim <- c(315, 147, 40, 11, 4012, 1594, 459, 124)

dados <- data.frame(idade, fuma, gestacao, nao, sim)
