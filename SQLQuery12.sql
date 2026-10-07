CREATE DATABASE universidade3
use Universidade2
INSERT INTO (id_matricula, nm_aluno, dt_matricula, id_turma)
VALUES ('@3242335', 'Alice Fernandes' , CAST ('2024-01-20' AS Date), 1),
('@3242335', 'David da Silva' , CAST ('2024-01-22' AS Date), 1),
('@3242335', 'Gustavo Victal' , CAST ('2024-01-21' AS Date), 2),
('@3242335', 'Renan Ribeiro' , CAST ('2024-01-23' AS Date), 2)
