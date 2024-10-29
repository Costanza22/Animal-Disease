# Metadados do Dataset

## Descrição das Tabelas

| Nome da Tabela | Colunas                               | Descrição                                      |
|----------------|---------------------------------------|------------------------------------------------|
| animais        | animal_id, tipo_animal, idade, raca, historico_saude | Informações sobre os animais de estimação      |
| sintomas       | sintoma_id, animal_id, sintoma      | Sintomas relatados pelos tutores               |
| diagnosticos   | diagnostico_id, animal_id, diagnostico| Diagnósticos realizados para os animais        |

## Descrição das Colunas

| Nome da Coluna | Tipo de Dado | Descrição                                   |
|----------------|--------------|---------------------------------------------|
| animal_id      | INT          | Identificador único do animal                |
| tipo_animal    | VARCHAR(10)  | Tipo do animal (cão, gato, etc.)           |
| idade          | INT          | Idade do animal em anos                     |
| raca           | VARCHAR(50)  | Raça do animal                              |
| historico_saude| VARCHAR(100) | Histórico de saúde do animal                 |
| sintoma_id     | INT          | Identificador único do sintoma              |
| sintoma        | VARCHAR(100) | Descrição do sintoma                        |
| diagnostico_id | INT          | Identificador único do diagnóstico           |
| diagnostico    | VARCHAR(100) | Descrição do diagnóstico                     |
