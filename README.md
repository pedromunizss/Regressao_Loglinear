# Regressao Loglinear

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
