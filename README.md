## a.  Domínio de Problema
O problema envolve a previsão de doenças em animais de estimação, como cães e gatos, a partir de sintomas relatados por tutores. Esses sintomas podem incluir febre, tosse, perda de apetite, entre outros. A previsão de doenças é crucial para permitir diagnósticos precoces em clínicas veterinárias, ajudando a identificar possíveis condições, como infecções, alergias ou viroses, com base em dados coletados dos animais.

![dog6](https://github.com/user-attachments/assets/d57ee2d3-12f9-4eb1-835b-68243bf25696)

## Justificativa para a Análise Preditiva:

A previsão de doenças permite que clínicas veterinárias ofereçam tratamentos mais rápidos e eficazes, reduzindo o tempo de recuperação dos animais e potencialmente salvando vidas. Esse cenário é ideal para análise preditiva (AP), já que diferentes fatores (sintomas, raça, idade) influenciam o diagnóstico final.

## b. Justificativa da Escolha do Modelo Relacional
Modelo Relacional (MySQL):

Um banco de dados relacional (MySQL) é utilizado para garantir consultas mais complexas e garantir a integridade dos dados. É útil para cruzar informações como raça, idade e sintomas de forma estruturada, e para realizar consultas específicas para relatórios.

Casos de uso: Bancos relacionais são vantajosos quando se deseja realizar consultas complexas envolvendo junções de tabelas (ex.: cruzar os sintomas com o diagnóstico final em grandes conjuntos de dados).


## c. Modelos de Exemplos para Modelo Relacional
Modelo Relacional (MySQL):
Para um banco de dados relacional, seria interessante um esquema que divida as informações em diferentes tabelas, como animais, sintomas e diagnosticos, e utilizar relações entre elas.
**(código)**

<img width="458" alt="disease1" src="https://github.com/user-attachments/assets/2a6361bb-bc83-448e-8e33-818f7b94a945">

## d. Exemplos de Manipulação de Dados no Banco Escolhido
Relacional (MySQL):
Exemplo de consultas e manipulação de dados em MySQL:
**(código)**

## Consulta para selecionar animais com febre:

<img width="608" alt="disease2" src="https://github.com/user-attachments/assets/232589f2-bc02-447d-927e-11c3b632a2fc">

## Atualizar diagnóstico de um animal:

<img width="699" alt="disease3" src="https://github.com/user-attachments/assets/6b7c1fad-c9e0-41be-951b-1a6c7a210ebd">


## e. Justificativa para Escolha de Data Lake
Data Lake: Um Data Lake pode ser útil se os dados forem armazenados de forma bruta, como logs de sintomas e histórico médico, imagens de exames e dados clínicos complexos que possam ser usados para análise futura. Seria adequado para armazenar dados não estruturados e estruturados, permitindo análises com ferramentas de Machine Learning.
