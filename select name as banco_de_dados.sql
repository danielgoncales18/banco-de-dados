select name as banco_de_dados
from sys.databases
order by name; 

use Dbdanielgoncales;
GO


SELECT name from sys.tables;
GO

create table estudante(
    idestudante int PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    turma VARCHAR(50) NOT NULL,
    apelido VARCHAR(30) NOT NULL
);

create table videos(
    idvideo int PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    data_publicacao date NOT NULL,
    duracao time not NULL,
    matricula_estudante int NOT NULL,
    FOREIGN KEY (matricula_estudante) REFERENCES estudante(idestudante) 
)

;

--inserindo dados na tabela estudantes

INSERT INTO estudante (idestudante, nome, turma, apelido)
VALUES
    (1, 'thor', 'Turma A', 'thor'),
    (2, 'natasha romanoff', 'Turma 2B', 'viuva negra'),
    (3, 'tony stark', 'Turma 3b', 'homen de ferro'),
    (4, 'mary jane','Turma C', 'mj'),
    (5, 'peter parker', 'Turma 2a', 'homen-aranha'),
    (6, 'clark kent', 'Turma 2C', 'superman'),
    (7, 'barry allen', 'Turma 2C', 'flash'),
    (8, 'arthur curry', 'Turma 2a', 'aquaman'),
    (9, 'bruce wayne', 'Turma 2b', 'batman'),
    (10, 'diana prince', 'Turma 2C', 'mulher-maravilha');

SELECT * FROM estudante;



-- Inserindo dados na tabela videos (nome da tabela correto: videos)
INSERT INTO Videos (IdVideo, Titulo, Descricao, data_publicacao, Duracao, matricula_estudante)
VALUES
(1, 'Teia de Dados','Homem-Aranha I', '2023-01-15', '00:45:00', 1),
(2, 'Amor e Ação','Mary Jane II', '2023-02-20', '00:50:00', 2),
(3, 'Homem de Ferro: Ascensão','Tony Stark III', '2023-03-10', '01:30:00', 3),
(4, 'Agente Secreta','Natasha Romanoff IV', '2023-04-05', '01:15:00', 4),
(5, 'Deus do Trovão','Thor Odinson V', '2023-05-12', '01:20:00', 5),
(6, 'Cavaleiro das Trevas','Bruce Wayne VI', '2023-06-18', '01:40:00', 6),
(7, 'O Homem de Aço','Clark Kent VII', '2023-07-22', '01:25:00', 7),
(8, 'A Princesa Guerreira','Diana Prince VIII', '2023-08-30', '01:35:00', 8),
(9, 'Velocidade Extrema','Barry Allen IX', '2023-09-14', '01:10:00', 9),
(10, 'Rei dos Mares','Arthur Curry X', '2023-10-05', '01:50:00', 10);

SELECT * FROM videos;

/* alterar dados de uma linha com updadet*/
UPDATE estudante
SET apelido = 'aranha'
WHERE idestudante = 1;


SELECT --select responsavel por selecionar os dados das tabelas videos e estudantes
 v.titulo, --v . titulo seleciona o titulo 
 e.nome AS autor,--e.nome seleciona o nome do estudante da tabela estudantes e renomeia a coluna como autor 
 e.apelido AS heroi,--e. apelido seleciona o apelido do estudante da tabela e renomeia a coluna como heroi
 v.duracao --v.duracao seleciona a duraracao do video da tabela videos
FROM videos AS V -- from videos as v seleciona a tabela videos e renomeia como v 
INNER JOIN estudante AS E -- inner join estudantes as e seleciona a tabela estudantes e renomeia como e
ON v.matricula_estudante = e.idestudante;