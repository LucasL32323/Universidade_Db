# 🎓 Universidade_Db

Banco de dados **Universidade** em SQL Server, feito nas aulas de Banco de Dados: docentes, turmas, alunos, disciplinas e notas.

## 🗂️ Modelo

```
turmas 1 ──< alunos 1 ──< notas >── 1 disciplinas >── 1 docentes
```

| Tabela | Chave | Destaques |
|---|---|---|
| `docentes` | `id_docente` | — |
| `turmas` | `id_turma` (IDENTITY) | `ds_turma` único |
| `alunos` | `id_matricula` | FK para `turmas` |
| `disciplinas` | `id_disciplina` (IDENTITY) | FK para `docentes` |
| `notas` | `id_nota` (IDENTITY) | FK para `alunos` e `disciplinas`, uma nota por aluno/disciplina, NP1/NP2/exame entre 0 e 10 |

## 📄 Arquivos

| Arquivo | O que faz |
|---|---|
| `Universidade_Bd_Fixed.sql` | Cria o banco do zero, as tabelas e insere todos os dados (inclusive as notas). **Rode primeiro.** |
| `Script Universidade COMPLETO.sql` | Exercícios de consulta: `SELECT`, `WHERE`, `AND`/`OR`, `LIKE`, `ORDER BY` |
| `SQLQuery11.sql` | Exercício de `INSERT` de docentes e busca com `LIKE` |

## ▶️ Como usar

No SQL Server Management Studio, abra e execute os arquivos nesta ordem:

1. `Universidade_Bd_Fixed.sql`
2. `Script Universidade COMPLETO.sql`
3. `SQLQuery11.sql`
   Testes

   SELECT COUNT(*) FROM alunos
SELECT COUNT(*) FROM notas
SELECT COUNT(vl_np1) FROM notas
SELECT COUNT(vL_np2) FROM notas

SELECT COUNT(vl_np1) FROM notas
WHERE vl_np1 is NULL

SELECT COUNT(vl_np2) FROM notas
WHERE vl_np2 is NULL

SELECT COUNT(vl_np1) FROM notas
WHERE vl_np1 = null

SELECT COUNT(vL_np1) FROM notas 
WHERE vl_np1 = null


SELECT COUNT(id_turma) AS Qtde FROM turmas


SELECT COUNT(*) FROM alunos
SELECT COUNT(*) FROM docentes
SELECT COUNT(*) FROM disciplinas
SELECT COUNT(*) FROM notas
SELECT COUNT(*) FROM alunos
SELECT COUNT(id_turma) FROM alunos WHERE id_turma =3

SELECT COUNT(*) AS Qtde FROM docentes
WHERE nm_docente LIKE 'Mar%'
SELECT COUNT(*) FROM disciplinas WHERE id_docente = '9233013999'
SELECT COUNT(*) AS Qtde FROM disciplinas
WHERE id_docente = '9233013999'

SELECT COUNT(*) AS Qtde FROM notas
WHERE id_disciplina = 24
SELECT COUNT(*) FROM notas WHERE id_disciplina = 24
SELECT COUNT(vl_np1) AS Qtde_NP1 FROM notas
WHERE id_disciplina = 2
SELECT COUNT(*) FROM notas WHERE id_disciplina =2 
SELECT COUNT(vl_np2) AS Qtde_NP2 FROM notas
WHERE id_disciplina = 13
SELECT COUNT(*) FROM notas WHERE id_disciplina = 13
SELECT COUNT(*) FROM notas WHERE id_nota = vl_np1 
SELECT COUNT(*) FROM notas WHERE id_nota = vl_exame
SELECT COUNT(vl_np1) AS Qtde_NP1 FROM notas
WHERE id_disciplina = 10

SELECT MIN(vl_np1) AS Menor_nota FROM notas
SELECT MAX(vl_np1) AS Maior_nota FROM notas

SELECT MIN(vl_np2) AS Menor_nota FROM notas
SELECT MAX(vl_np2) AS Menor_nota FROM notas WHERE id_disciplina = 13
SELECT MAX(vl_np2) AS Maior_nota from notas WHERE id_disciplina = 17
SELECT MIN and MAX(vl_np2) AS Menor_nota and As Maior_nota FROM notas WHERE id_disciplina = 19
SELECT MIN(vl_exame) As Menor_nota from notas WHERE id_disciplina = 10


SELECT AVG(vl_np2) FROM notas WHERE id_disciplina =13
SELECT ROUND (AVG(vl_np2),1) FROM notas WHERE id_disciplina =13
SELECT ROUND(AVG(vl_np1),1) FROM notas WHERE id_disciplina = 2
SELECT ROUND(AVG(vl_np2),1) FROM notas WHERE id_disciplina =24
SELECT ROUND(AVG(vl_np1),1) FROM  notas,alunos WHERE id_disciplina = 24 and id_turma =4
SELECT ROUND(AVG(vl_np1),1) FROM  notas,alunos WHERE id_disciplina = 2 and id_turma =4
SELECT SUM(vl_np1) AS Somatoria_NP1 FROM notas
SELECT AVG(vl_np1) FROM notas WHERE id_disciplina = 19
SELECT SUM(vl_np1)/COUNT(vl_np1) As Somatoria_NP1 FROM notas WHERE id_disciplina = 19








 





 
