# Regressão Loglinear

## Resumo

Os dados para este projeto se referem a informações sobre mulheres
em período de gestação e faz menção a suas idades, fumar durante a gestação,
duração da gestação e também se o bebê sobreviveu. O objetivo da análise é verificar
se existe uma associação entre essas informações. Para verificar tal suposição será
utilizado o modelo log-linear. Através deste modelo mostraremos que existe uma
associação entre essas variáveis.

## Introdução

Muito se fala sobre as terríveis consequências do tabagismo na saúde
humana - doenças cardiovasculares (infarto, angina, AVC) e doenças
respiratórias. No caso de mulheres em período de gestação, os impactos ocasionados
pelo fumo no decorrer da gestação, isto é, relação do fumo com nascimentos prematuros;
os possíveis danos ao desenvolvimento de pulmões e cérebro do bebê; risco de
sangramentos excessivos na hora parto entre outros agravamentos.

Propõe-se neste relatório, discorrer sobre as consequências do uso de cigarro
durante a gestação, em especial, sua relação com a sobrevivência
dos bebês perinatal.

## Dados

Temos informações disponíveis sobre 3 variáveis classificadas para 6.851 mulheres,
que entraram no estudo durante o primeiro trimestre, retornaram para check-ups
repetidos e diários mantidos no curso de suas gestações e no desenvolvimento de
seus filhos até uma idade de três anos.

Fonte: *N.Wermuth, pp.279-295 in Proc.9th International Biometrics Conference,Vol. 1
(1976)*.

### Descrição das variáveis

 (A): Idade da mãe, classificada em "menos de 30 anos" (30<) ou "maior ou igual a 30 anos" (30+)
 
 (G): Tempo de Gestação, classificada de "197 a 260 dias"(260<) ou "261 ou mais"(260+)
 
 (S): Se a mãe fumou durante a gestação, classificada em "fumou mais de 5 cigarros"(5+) ou "menos"(5<)  
 
 (I): Se o Bebê sobreviveu, classificada em Sim ou Não


| Idade(A) | Fuma(S) | Gestação(G) | Sobreviveu:<br>Não | Sobreviveu:<br>Sim |
|:--------:|:-------:|:-----------:|:------------------:|:------------------:|
|    <30   |    <5   |     <260    |         50         |         315        |
|          |         |     260+    |         41         |         147        |
|          |    5+   |     <260    |          9         |         40         |
|          |         |     260+    |          4         |         11         |
|    30+   |    <5   |     <260    |         24         |        4012        |
|          |         |     260+    |         14         |        1594        |
|          |    5+   |     <260    |          6         |         459        |
|          |         |     260+    |          1         |         124        |

## Metodologia

Para verificar os padrões de associações entre as variáveis categóricas usaremos
o modelo log-linear que consiste em modelar a frequência de uma tabela de contingência
em termos da associação entre as variáveis.

$$log(\mu) = \alpha + \beta_1x_1 + \beta_2x2 + ... + \beta_kx_k$$

onde $\mu$ é a variável resposta que resulta na contagem ou taxa.

### Seleção do Modelo

Para verificar se as variáveis são independentes usamos a seguinte estrutura de
modelo log-linear

$$log(\mu) = \lambda + \lambda^A + \lambda^G + \lambda^S + \lambda^I$$

Deste modelo, obtemos as seguintes estimativas

|              |   Estimate| Std. Error|   z value| Pr(>\|z\|)        |
|:-------------|----------:|----------:|---------:|------------------:|
|(Intercept)   |  1.2967567|  0.0920840|  14.08232|                  0|
|idade30<      | -2.3129044|  0.0422037| -54.80330|                  0|
|fuma5<        |  2.2487132|  0.0411147|  54.69363|                  0|
|gestacao260<  |  0.9316678|  0.0268326|  34.72151|                  0|
|sobreviveusim |  3.8062150|  0.0828286|  45.95292|                  0|

Se repararmos as estimativas dos coeficientes e os respectivos p-valores
somos levados a dizer que o modelo está bem ajustado, ou seja, as variáveis são
independentes. Agora, para testar a qualidade do ajuste usaremos a distribuição
asssintótica $G^2$ (deviance do resíduo), com n-p graus de liberdade. Considerando
a hipótese nulo de que o modelo se ajusta bem e que $G^2$ é assintoticamente
equivalente a $\chi^2$, chegamos a p-valor de $3.15445e-74$, que nos leva a rejeitar
a adequabilidade do modelo.


Sabendo que há uma estrutura de interação entre as variáveis, precisa-mos encontrar
um modelo que melhor explique essas interações. Para encontrá-lo primeiro criamos
um modelo de associação conjunta (modelo saturado):

$$log(\mu) = \lambda + \lambda^{ASGI}_{ijkl}$$

Como se trata de um modelo hierárquico ele contém todas as interações de ordem inferior.
Ele descreve perfeitamente qualquer conjunto de frequências esperadas positivas.
Porém não é muito interessante usá-lo pois ele contém o número máximo de parâmetros
que o modelo pode ter, violando a lei da parcimônia. A partir do modelo saturado
utilizamos o método de seleção automática Stepwise com o critério AIC, para selecionar
o melhor modelo. Feito isso encontramos o modelo com independência condicional entre (AG,AI,GI,GS,IS)

|                           |   Estimate| Std. Error|    z value| Pr(>\|z\|)        |
|:--------------------------|----------:|----------:|----------:|------------------:|
|(Intercept)                |  0.5887362|  0.2910900|   2.022523|          0.0431223|
|idade30<                   |  0.9379422|  0.1880075|   4.988855|          0.0000006|
|fuma5<                     |  2.1244516|  0.2498510|   8.502875|          0.0000000|
|gestacao260<               |  0.8688786|  0.2006949|   4.329350|          0.0000150|
|sobreviveusim              |  4.2170045|  0.2880706|  14.638790|          0.0000000|
|idade30<:gestacao260<      | -0.1655720|  0.0959934|  -1.724826|          0.0845588|
|fuma5<:gestacao260<        | -0.4113172|  0.0994959|  -4.134010|          0.0000356|
|idade30<:sobreviveusim     | -3.3113469|  0.1845236| -17.945386|          0.0000000|
|fuma5<:sobreviveusim       |  0.4437538|  0.2447117|   1.813374|          0.0697742|
|gestacao260<:sobreviveusim |  0.4648119|  0.1800294|   2.581867|          0.0098267

Testando a adequabilidade do modelo (o mesmo teste feito para o modelo com variáveis
independentes), chegamos a p-valor de 0.99903, ou seja, não rejeitamos a hipotese de que
o modelo se ajusta bem aos dados.