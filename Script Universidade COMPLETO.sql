SELECT *FROM DOCENTES

SELECT *FROM DISCIPLINAS

SELECT nm_aluno, dt_matricula FROM ALUNOS

SELECT * FROM notas
WHERE vl_np1 > 5

SELECT*FROM NOTAS
WHERE vl_np2 > 5

SELECT*FROM NOTAS
WHERE  vl_np1 >5 OR vl_np2 >5

SELECT*FROM NOTAS
WHERE vl_np1 >5 AND vl_np2 >5

SELECT*FROM NOTAS
WHERE vl_np1 > 5 AND id_disciplina =24

SELECT*FROM NOTAS
WHERE (vl_np1 >= 5 OR vl_np2 >= 5) AND id_disciplina = 3

SELECT *FROM TURMAS
WHERE ds_turma LIKE '%A%'

SELECT *FROM DOCENTES
WHERE id_docente = '9233251013'

SELECT*FROM TURMAS
WHERE ds_turma = 'DS3P41'

SELECT*FROM ALUNOS
WHERE id_matricula > '2026-01-31'

SELECT*FROM ALUNOS
WHERE id_matricula LIKE '%G%'	
ORDER BY nm_aluno DESC








