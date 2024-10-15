-- Inserindo dados
MariaDB [animaldisease]> INSERT INTO animais (tipo_animal, idade, raca, historico_saude)
    -> VALUES ('cão', 5, 'Golden Retriever', 'vacinação completa');

INSERT INTO sintomas (animal_id, sintoma)
    -> VALUES (1, 'febre'), (1, 'perda de apetite'), (1, 'tosse');

INSERT INTO diagnosticos (animal_id, diagnostico)
    -> VALUES (1, 'infecção respiratória');

     INSERT INTO animais (tipo_animal, idade, raca, historico_saude)
    -> VALUES
    ->   ('gato', 3, 'Persa', 'vacinação completa'),
    ->   ('cão', 2, 'Labrador', 'vacinação em dia'),
    ->   ('coelho', 1, 'Mini Rex', 'sem histórico de doenças'),
    ->   ('pássaro', 4, 'Canário', 'sem histórico de doenças');

     INSERT INTO sintomas (animal_id, sintoma)
    -> VALUES
    ->   (2, 'vomito'),
    ->   (2, 'letargia'),
    ->   (3, 'dificuldade em respirar'),
    ->   (4, 'cantar excessivamente');

    INSERT INTO diagnosticos (animal_id, diagnostico)
    -> VALUES
    ->   (2, 'gastroenterite'),
    ->   (3, 'asma'),
    ->   (4, 'estresse ambiental');

    select * from sintomas;
+------------+-----------+-------------------------+
| sintoma_id | animal_id | sintoma                 |
+------------+-----------+-------------------------+
|          1 |         1 | febre                   |
|          2 |         1 | perda de apetite        |
|          3 |         1 | tosse                   |
|          4 |         2 | vomito                  |
|          5 |         2 | letargia                |
|          6 |         3 | dificuldade em respirar |
|          7 |         4 | cantar excessivamente   |
+------------+-----------+-------------------------+

select * from animais;
+-----------+-------------+-------+------------------+--------------------------+
| animal_id | tipo_animal | idade | raca             | historico_saude          |
+-----------+-------------+-------+------------------+--------------------------+
|         1 | c?o         |     5 | Golden Retriever | vacina??o completa       |
|         2 | gato        |     3 | Persa            | vacina??o completa       |
|         3 | c?o         |     2 | Labrador         | vacina??o em dia         |
|         4 | coelho      |     1 | Mini Rex         | sem hist?rico de doen?as |
|         5 | p?ssaro     |     4 | Can?rio          | sem hist?rico de doen?as |
+-----------+-------------+-------+------------------+--------------------------+