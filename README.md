

---

## a. Domínio de Problema

O problema envolve a previsão de doenças em animais de estimação, como cães e gatos, a partir de sintomas relatados por tutores. Esses sintomas podem incluir febre, tosse, perda de apetite, entre outros. A previsão de doenças é crucial para permitir diagnósticos precoces em clínicas veterinárias, ajudando a identificar possíveis condições, como infecções, alergias ou viroses, com base em dados coletados dos animais.

![dog6](https://github.com/user-attachments/assets/d57ee2d3-12f9-4eb1-835b-68243bf25696)

## Acesso

Google Collab !(https://colab.research.google.com/drive/1m3Dn-49iTqdczO4kkfMqZp6z5p6uwifX?usp=sharing)

## Justificativa para a Análise Preditiva

A previsão de doenças permite que clínicas veterinárias ofereçam tratamentos mais rápidos e eficazes, reduzindo o tempo de recuperação dos animais e potencialmente salvando vidas. Esse cenário é ideal para análise preditiva (AP), já que diferentes fatores (sintomas, raça, idade) influenciam o diagnóstico final.

## b. Justificativa da Escolha do Modelo Relacional

Modelo Relacional (MySQL):

Um banco de dados relacional (MySQL) é utilizado para garantir consultas mais complexas e garantir a integridade dos dados. É útil para cruzar informações como raça, idade e sintomas de forma estruturada, e para realizar consultas específicas para relatórios.

Casos de uso: Bancos relacionais são vantajosos quando se deseja realizar consultas complexas envolvendo junções de tabelas (ex.: cruzar os sintomas com o diagnóstico final em grandes conjuntos de dados).

## c. Modelos de Exemplos para Modelo Relacional

Modelo Relacional (MySQL):

Para um banco de dados relacional, seria interessante um esquema que divida as informações em diferentes tabelas, como animais, sintomas e diagnósticos, e utilizar relações entre elas.

**(código)**

```sql
CREATE TABLE animais (
  animal_id INT PRIMARY KEY AUTO_INCREMENT,
  tipo_animal VARCHAR(10),
  idade INT,
  raca VARCHAR(50),
  historico_saude VARCHAR(100)
);

CREATE TABLE sintomas (
  sintoma_id INT PRIMARY KEY AUTO_INCREMENT,
  animal_id INT,
  sintoma VARCHAR(100),
  FOREIGN KEY (animal_id) REFERENCES animais(animal_id)
);

CREATE TABLE diagnosticos (
  diagnostico_id INT PRIMARY KEY AUTO_INCREMENT,
  animal_id INT,
  diagnostico VARCHAR(100),
  FOREIGN KEY (animal_id) REFERENCES animais(animal_id)
);
```

<img width="458" alt="disease1" src="https://github.com/user-attachments/assets/2a6361bb-bc83-448e-8e33-818f7b94a945">

## d. Exemplos de Manipulação de Dados no Banco Escolhido

### Relacional (MySQL):

Exemplo de consultas e manipulação de dados em MySQL:

**(código)**

```sql
-- Inserindo dados
INSERT INTO animais (tipo_animal, idade, raca, historico_saude)
VALUES 
  ('cão', 5, 'Golden Retriever', 'vacinação completa'),
  ('gato', 3, 'Persa', 'vacinação completa'),
  ('cão', 2, 'Labrador', 'vacinação em dia'),
  ('coelho', 1, 'Mini Rex', 'sem histórico de doenças'),
  ('pássaro', 4, 'Canário', 'sem histórico de doenças');

INSERT INTO sintomas (animal_id, sintoma)
VALUES 
  (1, 'febre'), 
  (1, 'perda de apetite'), 
  (1, 'tosse'),
  (2, 'vomito'),
  (2, 'letargia'),
  (3, 'dificuldade em respirar'),
  (4, 'cantar excessivamente');

INSERT INTO diagnosticos (animal_id, diagnostico)
VALUES 
  (1, 'infecção respiratória'),
  (2, 'gastroenterite'),
  (3, 'asma'),
  (4, 'estresse ambiental');

-- Consulta para selecionar animais com febre:
SELECT a.tipo_animal, s.sintoma 
FROM animais a 
JOIN sintomas s ON a.animal_id = s.animal_id 
WHERE s.sintoma = 'febre';
```

<img width="608" alt="disease2" src="https://github.com/user-attachments/assets/232589f2-bc02-447d-927e-11c3b632a2fc">

```sql
-- Atualizar diagnóstico de um animal:
UPDATE diagnosticos 
SET diagnostico = 'nova condição' 
WHERE animal_id = 1;
```

<img width="699" alt="disease3" src="https://github.com/user-attachments/assets/6b7c1fad-c9e0-41be-951b-1a6c7a210ebd">

## e. Justificativa da Escolha para AP, Data Warehouse, Data Lake ou Data Lakehouse

A escolha de um Data Lakehouse é ideal para este cenário. Ele combina a flexibilidade e escalabilidade de um Data Lake, que pode armazenar dados estruturados e não estruturados de forma eficiente (como registros de consultas em JSON e históricos médicos variados), com a capacidade de Data Warehousing, permitindo análises preditivas complexas e consultas rápidas. Assim, é possível ter o melhor de ambos os mundos, facilitando a ingestão de grandes volumes de dados sobre animais e donos, bem como análises detalhadas para prever doenças e sugerir tratamentos.

## Geração de Dados Sintéticos

Para enriquecer a base de dados, foi realizada a geração de dados sintéticos utilizando as bibliotecas `pandas` e `faker` do ecossistema Python. Isso permitiu criar registros que simulam a realidade, como diferentes tipos de animais, sintomas e diagnósticos.

### Exemplo de Geração de Dados Sintéticos

```python
import pandas as pd
from faker import Faker
import random

fake = Faker()

# Gerar dados sintéticos para a tabela 'animais'
def gerar_dados_animais(n):
    dados = []
    for _ in range(n):
        tipo_animal = random.choice(['cão', 'gato', 'coelho', 'pássaro'])
        idade = random.randint(1, 15)
        raca = fake.word()
        historico_saude = random.choice(['vacinação completa', 'vacinação em dia', 'sem histórico de doenças'])
        dados.append((tipo_animal, idade, raca, historico_saude))
    return dados

animais = gerar_dados_animais(100)
df_animais = pd.DataFrame(animais, columns=['tipo_animal', 'idade', 'raca', 'historico_saude'])

# Gerar dados para sintomas e diagnósticos...

# Visualizar os dados gerados
print(df_animais.head())
```

## Pré-processamento de Dados

Foi necessário efetuar processos de limpeza de dados, incluindo:

1. **Remoção de Duplicatas**: Verificação e remoção de registros duplicados.
2. **Tratamento de Valores Ausentes**: Análise de valores ausentes e decisões sobre preenchimento ou remoção.
3. **Normalização de Texto**: Verificação de inconsistências em campos de texto.

```python
# Exemplo de limpeza de dados
df_animais.drop_duplicates(inplace=True)
df_sintomas.drop_duplicates(inplace=True)
df_diagnosticos.drop_duplicates(inplace=True)

# Verificando valores ausentes
print(df_animais.isnull().sum())
print(df_sintomas.isnull().sum())
print(df_diagnosticos.isnull().sum())
```

## Análise Descritiva dos Dados (ADD)

Realizamos uma análise descritiva utilizando métodos como `describe()` para obter estatísticas básicas.

```python
# Análise descritiva
print(df_animais.describe())
print(df_sintomas.describe())
print(df_diagnosticos.describe())
```

## Análise Exploratória dos Dados (AED)

Visualizações foram realizadas para identificar padrões e insights nos dados.

```python
import seaborn as sns
import matplotlib.pyplot as plt

# Gráfico de distribuição da idade dos animais
sns.histplot(df_animais['idade'], bins=15, kde=True)
plt.title('Distribuição da Idade dos Animais')
plt.xlabel('Idade')
plt.ylabel('Frequência')
plt.show()
```

---
