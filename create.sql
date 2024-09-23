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

-- Inserindo dados
INSERT INTO animais (tipo_animal, idade, raca, historico_saude)
VALUES ('cão', 5, 'Golden Retriever', 'vacinação completa');

INSERT INTO sintomas (animal_id, sintoma)
VALUES (1, 'febre'), (1, 'perda de apetite'), (1, 'tosse');

INSERT INTO diagnosticos (animal_id, diagnostico)
VALUES (1, 'infecção respiratória');
