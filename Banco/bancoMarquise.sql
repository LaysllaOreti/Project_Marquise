-- criação do BD
CREATE DATABASE banco_marquise;
USE banco_marquise;

-- criação tabela Gênero
CREATE TABLE genero(
	id_genero INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL UNIQUE
);

-- criação tabela Diretor 
CREATE TABLE diretor(
	id_diretor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL UNIQUE
);

-- criação tabela Ator 
CREATE TABLE ator(
	id_ator INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL UNIQUE
);

-- criação tabela Produtora
CREATE TABLE produtora(
	id_produtora INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL UNIQUE
);

-- criação tabela Usuario
CREATE TABLE usuario(
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR (255) NOT NULL UNIQUE,
    tipo_usuario ENUM ('Comum', 'Administrador')
);

-- criação tabela Filme
CREATE TABLE filme(
	id_filme INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL UNIQUE,
    ano YEAR NOT NULL,
    sinopse TEXT NOT NULL,
    poster VARCHAR (255),
    status_aprovacao ENUM ('Aprovado', 'Pendente_Adicao', 'Pendente_Edicao') 
    NOT NULL 
    DEFAULT 'Pendente_Adicao',
    id_produtora INT,
    FOREIGN KEY (id_produtora) REFERENCES produtora(id_produtora)
);

-- criação da tabela intermediária filme_ator
CREATE TABLE filme_ator(
	id_filme INT,
    FOREIGN KEY (id_filme) REFERENCES filme(id_filme),
    id_ator INT,
    FOREIGN KEY (id_ator) REFERENCES ator(id_ator),
    
    -- chave primária composta
    PRIMARY KEY (id_filme, id_ator)
);

-- criação da tabela intermediária filme_genero
CREATE TABLE filme_genero(
	id_filme INT,
    FOREIGN KEY (id_filme) REFERENCES filme(id_filme),
    id_genero INT,
    FOREIGN KEY (id_genero) REFERENCES genero(id_genero),
    
    -- chave primária composta
    PRIMARY KEY (id_filme, id_genero)
);

-- criação da tabela intermediária filme_diretor
CREATE TABLE filme_diretor(
	id_filme INT,
    FOREIGN KEY (id_filme) REFERENCES filme(id_filme),
    id_diretor INT,
    FOREIGN KEY (id_diretor) REFERENCES diretor(id_diretor),
    
    -- chave primária composta
    PRIMARY KEY (id_filme, id_diretor)
);

-- população das tabelas
-- usuário
INSERT INTO usuario (nome, email, senha, tipo_usuario) VALUES
('Layslla Eduarda', 'laysllaEduarda@email.com', 'l1008', 'Administrador'),
('Leticia Roth', 'leticiaRoth@email.com', 'm1008', 'Comum'),
('Clara Nunes', 'clara@email.com', 'o789', 'Comum'),
('Davi Luiz', 'davi@email.com', 'p123', 'Comum'),
('Eva Mendes', 'eva@email.com', 'q456', 'Comum'),
('Felipe Neto', 'felipe@email.com', 'r789', 'Comum'),
('Gabriela Pires', 'gabi@email.com', 's123', 'Comum'),
('Heitor Martins', 'heitor@email.com', 't456', 'Comum'),
('Inês Brasil', 'ines@email.com', 'a123', 'Comum'),
('Jonas Silva', 'jonas@email.com', 'b456', 'Comum'),
('Karla Souza', 'karla@email.com', 'c789', 'Administrador'),
('Léo Batista', 'leo@email.com', 'd123', 'Comum'),
('Maria Clara', 'maria@email.com', 'e456', 'Comum'),
('Nuno Leal', 'nuno@email.com', 'f789', 'Comum'),
('Otávio Jr', 'otavio@email.com', 'g123', 'Comum'),
('Pedro Pascal', 'pedro@email.com', 'h456', 'Administrador'),
('Quintino Rocha', 'quino@email.com', 'i789', 'Comum'),
('Raissa Oliveira', 'raissa@email.com', 'j123', 'Comum'),
('Silvio Santos', 'silvio@email.com', 'k456', 'Administrador'),
('Tomás Alves', 'tomas@email.com', 'l789', 'Comum');
  
-- generos
INSERT INTO genero (nome) VALUES
('Ação'),
('Aventura'),
('Comédia'),
('Drama'),
('Terror'),
('Romance'),
('Ficção Científica'),
('Animação'),
('Suspense'),
('Fantasia');

-- diretores
INSERT INTO diretor (nome) VALUES
('Christopher Nolan'),
('Greta Gerwig'),
('Quentin Tarantino'),
('Steven Spielberg'),
('James Cameron'),
('Denis Villeneuve'),
('Martin Scorsese'),
('Jordan Peele'),
('Hayao Miyazaki'),
('Todd Phillips');

-- atores
INSERT INTO ator (nome) VALUES
('Leonardo DiCaprio'),
('Margot Robbie'),
('Tom Cruise'),
('Florence Pugh'),
('Cillian Murphy'),
('Zendaya'),
('Keanu Reeves'),
('Robert Downey Jr.'),
('Emma Stone'),
('Brad Pitt'),
('Christian Bale'),
('Ryan Gosling'),
('Ana de Armas'),
('Scarlett Johansson'),
('Morgan Freeman');

-- produtoras
INSERT INTO produtora (nome) VALUES
('Warner Bros'),
('Universal Pictures'),
('Paramount Pictures'),
('20th Century Studios'),
('Columbia Pictures'),
('Marvel Studios'),
('Pixar Animation Studios'),
('Legendary Pictures'),
('DreamWorks'),
('Netflix Studios');

-- filmes
INSERT INTO filme (titulo, ano, sinopse, poster, status_aprovacao, id_produtora) VALUES
('Oppenheimer', 2023, 'A história de J. Robert Oppenheimer e a criação da bomba atômica.', 'https://upload.wikimedia.org/wikipedia/pt/5/5b/Oppenheimer_poster.jpg', 'Aprovado', 1),
('Barbie', 2023, 'Barbie questiona o sentido de sua vida perfeita e embarca em uma jornada no mundo real.', 'https://upload.wikimedia.org/wikipedia/pt/8/82/Barbie_%282023%29.jpg', 'Aprovado', 2),
('Avatar: O Caminho da Água', 2022, 'Jake Sully e Neytiri enfrentam novas ameaças para proteger sua família em Pandora.', 'https://upload.wikimedia.org/wikipedia/pt/5/54/Avatar_The_Way_of_Water_poster.jpg', 'Aprovado', 3),
('Duna: Parte Um', 2021, 'Paul Atreides viaja para o perigoso planeta Arrakis, onde o destino da humanidade será decidido.', 'https://upload.wikimedia.org/wikipedia/en/8/8e/Dune_%282021_film%29.jpg', 'Aprovado', 8),
('Homem de Ferro', 2008, 'Tony Stark cria uma armadura poderosa e se torna o super-herói Homem de Ferro.', 'https://upload.wikimedia.org/wikipedia/en/0/02/Iron_Man_%282008_film%29_poster.jpg', 'Aprovado', 6),
('O Rei Leão', 2019, 'Um jovem leão precisa aceitar seu destino como rei da selva.', 'https://upload.wikimedia.org/wikipedia/pt/d/d1/The_Lion_King_%282019%29.jpg', 'Aprovado', 7),
('Corra!', 2017, 'Um jovem negro descobre o terrível segredo da família de sua namorada branca.', 'https://upload.wikimedia.org/wikipedia/pt/0/02/Get_Out_2017.png', 'Aprovado', 4),
('Coringa', 2019, 'A origem sombria de Arthur Fleck, um homem marginalizado que se torna o Coringa.', 'https://upload.wikimedia.org/wikipedia/pt/6/63/Joker_%282019%29.jpg', 'Aprovado', 1),
('Interstellar', 2014, 'Exploradores viajam por um buraco de minhoca em busca de um novo lar para a humanidade.', 'https://upload.wikimedia.org/wikipedia/pt/3/3a/Interstellar_Filme.png', 'Aprovado', 1),
('La La Land', 2016, 'Um músico e uma atriz vivem um intenso romance enquanto buscam sucesso em Los Angeles.', 'https://upload.wikimedia.org/wikipedia/pt/c/c0/La_La_Land_%28filme%29.png', 'Aprovado', 5),
('John Wick', 2014, 'Um ex-assassino busca vingança contra criminosos que destruíram sua vida.', 'jhttps://upload.wikimedia.org/wikipedia/en/9/98/John_Wick_TeaserPoster.jpg', 'Aprovado', 5),
('Pulp Fiction', 1994, 'Histórias interligadas de crime e redenção nas ruas de Los Angeles.', 'https://upload.wikimedia.org/wikipedia/pt/8/82/Pulp_Fiction_cover.jpg', 'Aprovado', 5),
('O Resgate do Soldado Ryan', 1998, 'Soldados arriscam tudo para resgatar um único homem durante a Segunda Guerra Mundial.', 'https://upload.wikimedia.org/wikipedia/en/a/ac/Saving_Private_Ryan_poster.jpg', 'Aprovado', 3),
('O Lobo de Wall Street', 2013, 'A ascensão e queda de um corretor de ações obcecado por riqueza e excessos.', 'https://upload.wikimedia.org/wikipedia/pt/8/8d/The_Wolf_of_Wall_Street.jpg', 'Aprovado', 1),
('O Grande Gatsby', 2013, 'Um misterioso milionário realiza festas extravagantes em busca de um amor perdido.', 'https://upload.wikimedia.org/wikipedia/pt/2/26/TheGreatGatsby2012Poster.jpg', 'Aprovado', 5),
('O Segredo de Brokeback Mountain', 2005, 'Dois cowboys vivem um amor proibido no interior dos EUA.', 'https://upload.wikimedia.org/wikipedia/pt/a/a1/Brokeback_mountain.jpg', 'Aprovado', 4),
('O Labirinto do Fauno', 2006, 'Uma menina descobre um mundo mágico e sombrio durante a Guerra Civil Espanhola.', 'https://upload.wikimedia.org/wikipedia/en/6/67/Pan%27s_Labyrinth.jpg', 'Aprovado', 4),
('A Viagem de Chihiro', 2001, 'Uma garota entra em um mundo mágico e precisa libertar seus pais transformados em porcos.', 'https://upload.wikimedia.org/wikipedia/pt/3/3b/A_Viagem_de_Chihiro.JPG', 'Aprovado', 7),
('Top Gun: Maverick', 2022, 'Pete “Maverick” Mitchell treina uma nova geração de pilotos de elite.', 'https://upload.wikimedia.org/wikipedia/pt/d/d2/Top_Gun_Maverick.jpg', 'Aprovado', 3),
('Parasita', 2019, 'Uma família pobre se infiltra na vida de uma família rica com consequências devastadoras.', 'https://upload.wikimedia.org/wikipedia/pt/b/be/Parasite_poster.jpg', 'Aprovado', 9);

-- filme X gênero
INSERT INTO filme_genero (id_filme, id_genero) VALUES
(1, 4), (1, 7),
(2, 3), (2, 6),
(3, 2), (3, 7),
(4, 2), (4, 7),
(5, 1), (5, 7),
(6, 8), (6, 2),
(7, 5), (7, 9),
(8, 4), (8, 9),
(9, 7), (9, 4),
(10, 3), (10, 6),
(11, 1), (11, 9),
(12, 1), (12, 3),
(13, 1), (13, 4),
(14, 3), (14, 4),
(15, 4), (15, 6),
(16, 4), (16, 6),
(17, 9), (17, 10),
(18, 8), (18, 10),
(19, 1), (19, 2),
(20, 4), (20, 9);

-- filme X diretor
INSERT INTO filme_diretor (id_filme, id_diretor) VALUES
(1, 1),   
(2, 2),  
(3, 5),   
(4, 6),   
(5, 5),   
(6, 4),  
(7, 8), 
(8, 10),  
(9, 1),   
(10, 2),  
(11, 3), 
(12, 3), 
(13, 4), 
(14, 7),  
(15, 7), 
(16, 7),  
(17, 4),  
(18, 9),  
(19, 4), 
(20, 8);

-- filme X ator
INSERT INTO filme_ator (id_filme, id_ator) VALUES
(1, 5), (1, 4),
(2, 2), (2, 12),
(3, 3), (3, 6),
(4, 5), (4, 6),
(5, 8), (5, 1),
(6, 9), (6, 14),
(7, 13), (7, 14),
(8, 10), (8, 1),
(9, 1), (9, 11),
(10, 9), (10, 12),
(11, 7), (11, 15),
(12, 10), (12, 1),
(13, 15), (13, 3),
(14, 1), (14, 2),
(15, 1), (15, 2),
(16, 11), (16, 12),
(17, 9), (17, 14),
(18, 9), (18, 6),
(19, 3), (19, 15),
(20, 14), (20, 13);

-- selects
SELECT * FROM genero;
SELECT * FROM diretor;
SELECT * FROM ator;
SELECT * FROM produtora;
SELECT * FROM usuario;
SELECT * FROM filme;
SELECT * FROM filme_ator;
SELECT * FROM filme_genero;
SELECT * FROM filme_diretor;