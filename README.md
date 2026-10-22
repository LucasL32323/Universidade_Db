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
