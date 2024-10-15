import pandas as pd
from faker import Faker
import random

fake = Faker()

#Geração de Dados Sintéticos

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


# Visualizar os dados gerados
print(df_animais.head())


#Pré-processamento de Dados

# Exemplo de limpeza de dados
df_animais.drop_duplicates(inplace=True)
df_sintomas.drop_duplicates(inplace=True)
df_diagnosticos.drop_duplicates(inplace=True)

#Análise Descritiva dos Dados (ADD)

# Verificando valores ausentes
print(df_animais.isnull().sum())
print(df_sintomas.isnull().sum())
print(df_diagnosticos.isnull().sum())

#Análise Exploratória dos Dados (AED)
# Análise descritiva
print(df_animais.describe())
print(df_sintomas.describe())
print(df_diagnosticos.describe())