USE Universidade;
GO

-- Docentes que ainda não estão no script principal
-- (LUIZ ANTONIO MOURA já é inserido no Universidade_Bd_Fixed.sql)
INSERT INTO docentes (id_docente, nm_docente)
VALUES ('9233133211', N'ANTONIO CARLOS SANT ANNA'),
       ('9233108256', N'RAFAEL SOUZA SILVA'),
       ('9233256808', N'ANA LUIZA MAGALHÃES');
GO

-- Docentes cujo nome começa com ANTONIO
SELECT * FROM docentes
WHERE nm_docente LIKE 'ANTONIO%';
