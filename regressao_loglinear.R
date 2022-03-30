library(lmtest)
library(dplyr)
library(xtable)

idade <- rep(c('30<', '30+'), each = 4, times = 1)
fuma <- rep(c('5<', '5+'), each = 2, times = 2)
gestacao <-  rep(c('260<', '260+'), each = 1, times = 4)
nao <- c(50, 41, 9, 4, 24, 14, 6, 1)
sim <- c(315, 147, 40, 11, 4012, 1594, 459, 124)

sobreviveu_nao <- data.frame(idade, fuma, gestacao, freq = nao)
sobreviveu_nao <- mutate(sobreviveu_nao, sobreviveu = 'não')
sobreviveu_sim <- data.frame(idade, fuma, gestacao, freq = sim)
sobreviveu_sim <- mutate(sobreviveu_sim, sobreviveu = 'sim')

dados <- rbind(sobreviveu_sim, sobreviveu_nao)
dados <- dados[, c(1, 2, 3, 5, 4)]


# modelo com variaveis independentes
modelo1 <- glm(freq ~ ., data = dados, family = poisson())
modelo1_summary <- summary(modelo)
knitr::kable(modelo1_summary$coefficients)

# teste do modelo com variaveis independentes
pchisq(modelo1$deviance, df = modelo1$df.residual, lower.tail = F)


modelo_sat <- glm(sim + nao ~ idade*fuma*gestacao, data = dados, family = poisson())

summary(modelo_sat)

mod1=step(modelo_sat,direction='both')
summary(mod1)
