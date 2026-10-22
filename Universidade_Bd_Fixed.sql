-- ============================================
-- Banco Universidade - Criação + Dados (SQL Server)
-- Salve este arquivo em UTF-8
-- ============================================

USE master;
GO

-- Destrói o BD se existir (derruba conexões abertas antes)
IF DB_ID('Universidade') IS NOT NULL
BEGIN
    ALTER DATABASE Universidade SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Universidade;
END
GO

-- Criação do Banco de Dados
CREATE DATABASE Universidade;
GO

USE Universidade;
GO

-- Tab. Docentes
CREATE TABLE docentes
(
    id_docente  CHAR(10)      NOT NULL,
    nm_docente  NVARCHAR(50)  NOT NULL,
    CONSTRAINT pk_docentes PRIMARY KEY (id_docente)
);
GO

-- Tab. Turmas
CREATE TABLE turmas
(
    id_turma  INT IDENTITY(1,1) NOT NULL,
    ds_turma  CHAR(6)           NOT NULL,
    CONSTRAINT pk_turmas   PRIMARY KEY (id_turma),
    CONSTRAINT uq_ds_turma UNIQUE (ds_turma)
);
GO

-- Tab. Alunos
CREATE TABLE alunos
(
    id_matricula  CHAR(7)       NOT NULL,
    nm_aluno      NVARCHAR(50)  NOT NULL,
    dt_matricula  DATE          NOT NULL,
    id_turma      INT           NULL,
    CONSTRAINT pk_alunos        PRIMARY KEY (id_matricula),
    CONSTRAINT fk_alunos_turmas FOREIGN KEY (id_turma) REFERENCES turmas (id_turma)
);
GO

-- Tab. Disciplinas
CREATE TABLE disciplinas
(
    id_disciplina  INT IDENTITY(1,1) NOT NULL,
    ds_disciplina  VARCHAR(60)       NOT NULL,
    id_docente     CHAR(10)          NULL,
    CONSTRAINT pk_disciplinas          PRIMARY KEY (id_disciplina),
    CONSTRAINT fk_disciplinas_docentes FOREIGN KEY (id_docente) REFERENCES docentes (id_docente)
);
GO

-- Tab. Notas
CREATE TABLE notas
(
    id_nota        INT IDENTITY(1,1) NOT NULL,
    id_disciplina  INT               NOT NULL,
    id_matricula   CHAR(7)           NOT NULL,
    vl_np1         DECIMAL(4,2)      NULL,
    vl_np2         DECIMAL(4,2)      NULL,
    vl_exame       DECIMAL(4,2)      NULL,
    CONSTRAINT pk_notas             PRIMARY KEY (id_nota),
    CONSTRAINT fk_notas_disciplinas FOREIGN KEY (id_disciplina) REFERENCES disciplinas (id_disciplina),
    CONSTRAINT fk_notas_alunos      FOREIGN KEY (id_matricula)  REFERENCES alunos (id_matricula),
    CONSTRAINT uq_notas_aluno_disc  UNIQUE (id_disciplina, id_matricula),
    CONSTRAINT ck_vl_np1   CHECK (vl_np1   BETWEEN 0 AND 10),
    CONSTRAINT ck_vl_np2   CHECK (vl_np2   BETWEEN 0 AND 10),
    CONSTRAINT ck_vl_exame CHECK (vl_exame BETWEEN 0 AND 10)
);
GO

-- ============================================
-- Inserção de dados
-- ============================================

-- Inclusão na Tab. Turmas
INSERT INTO turmas (ds_turma)
VALUES ('DS1A51'),
       ('DS2B51'),
       ('DS3C51'),
       ('DS4D51');
GO

-- Inclusão na Tab. Docentes
INSERT INTO docentes (id_docente, nm_docente)
VALUES ('9233251013', N'LUIZ ANTONIO MOURA'),
       ('9233158269', N'ARMANDO ALENCAR'),
       ('9233201456', N'HUMBERTO GUIMARÃES'),
       ('9233199257', N'BENEDITO DA SILVA');
GO

-- Inclusão na Tab. Alunos (busca o id da turma pelo nome, sem depender do IDENTITY)
INSERT INTO alunos (id_matricula, nm_aluno, dt_matricula, id_turma)
SELECT v.id_matricula, v.nm_aluno, v.dt_matricula, t.id_turma
FROM (VALUES
        ('G9403H0', N'ALICE FERNANDES', CAST('2024-01-20' AS DATE), 'DS1A51'),
        ('G05CAI5', N'DAVID DA SILVA',  CAST('2024-01-22' AS DATE), 'DS1A51'),
        ('T547BH0', N'GUSTAVO VICTAL',  CAST('2024-01-27' AS DATE), 'DS1A51'),
        ('G73IEJ1', N'MELYSSA ARAUJO',  CAST('2024-02-02' AS DATE), 'DS2B51'),
        ('G7737I4', N'RENAN RIBEIRO',   CAST('2024-02-02' AS DATE), 'DS2B51')
     ) AS v (id_matricula, nm_aluno, dt_matricula, ds_turma)
JOIN turmas t ON t.ds_turma = v.ds_turma;
GO

-- Inclusão na Tab. Disciplinas
INSERT INTO disciplinas (ds_disciplina, id_docente)
VALUES ('ANALISE DE SISTEMAS ORIENTADA A OBJETOS', '9233251013'),
       ('BANCO DE DADOS',                          '9233158269'),
       ('ENGENHARIA DE SOFTWARE',                  '9233201456'),
       ('FUNDAMENTOS DE SISTEMAS OPERACIONAIS',    '9233199257'),
       ('ORGANIZACAO DE COMPUTADORES',             '9233199257');
GO

-- Inclusão na Tab. Notas (busca o id da disciplina pelo nome, sem depender do IDENTITY)
INSERT INTO notas (id_disciplina, id_matricula, vl_np1, vl_np2, vl_exame)
SELECT d.id_disciplina, v.id_matricula, v.vl_np1, v.vl_np2, v.vl_exame
FROM (VALUES
        ('G9403H0', 'BANCO DE DADOS',                          8.50, 7.00, NULL),
        ('G9403H0', 'ENGENHARIA DE SOFTWARE',                  6.00, 4.50, 7.00),
        ('G05CAI5', 'BANCO DE DADOS',                          4.00, 6.50, 6.00),
        ('G05CAI5', 'ANALISE DE SISTEMAS ORIENTADA A OBJETOS', 9.00, 8.50, NULL),
        ('T547BH0', 'ENGENHARIA DE SOFTWARE',                  3.50, 5.50, 5.00),
        ('T547BH0', 'FUNDAMENTOS DE SISTEMAS OPERACIONAIS',    7.50, 8.00, NULL),
        ('G73IEJ1', 'BANCO DE DADOS',                          10.00, 9.50, NULL),
        ('G73IEJ1', 'ORGANIZACAO DE COMPUTADORES',             2.00, 3.00, 4.50),
        ('G7737I4', 'ENGENHARIA DE SOFTWARE',                  5.00, 5.00, NULL),
        ('G7737I4', 'BANCO DE DADOS',                          6.50, 4.00, 5.50)
     ) AS v (id_matricula, ds_disciplina, vl_np1, vl_np2, vl_exame)
JOIN disciplinas d ON d.ds_disciplina = v.ds_disciplina;
GO
