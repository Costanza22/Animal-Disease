-- Selecionar todos os animais com febre
SELECT a.animal_id, a.tipo_animal, a.raca, s.sintoma 
FROM animais a
JOIN sintomas s ON a.animal_id = s.animal_id
WHERE s.sintoma = 'febre';

-- Atualizar o diagnóstico de um animal
UPDATE diagnosticos SET diagnostico = 'alergia' WHERE animal_id = 1;

-- Remover um animal
DELETE FROM animais WHERE animal_id = 1;
