USE Universidade;
GO

SELECT * FROM DOCENTES

SELECT * FROM DISCIPLINAS

SELECT nm_aluno, dt_matricula FROM ALUNOS

SELECT * FROM notas
WHERE vl_np1 > 5

SELECT * FROM NOTAS
WHERE vl_np2 > 5

SELECT * FROM NOTAS
WHERE vl_np1 > 5 OR vl_np2 > 5

SELECT * FROM NOTAS
WHERE vl_np1 > 5 AND vl_np2 > 5

SELECT * FROM NOTAS
WHERE vl_np1 > 5 AND id_disciplina = 2

SELECT * FROM NOTAS
WHERE (vl_np1 >= 5 OR vl_np2 >= 5) AND id_disciplina = 3

SELECT * FROM TURMAS
WHERE ds_turma LIKE '%A%'

SELECT * FROM DOCENTES
WHERE id_docente = '9233251013'

SELECT * FROM TURMAS
WHERE ds_turma = 'DS3C51'

SELECT * FROM ALUNOS
WHERE dt_matricula > '2024-01-31'

SELECT * FROM ALUNOS
WHERE id_matricula LIKE '%G%'
ORDER BY nm_aluno DESC
