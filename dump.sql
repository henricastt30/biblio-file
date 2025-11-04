CREATE DATABASE biblio_file;
USE biblio_file;

CREATE TABLE users(
	id_user INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    senha VARCHAR(100)
);

CREATE TABLE livro(
	id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    autor VARCHAR(100),
    genero VARCHAR(100),
    total_paginas INT,
    tempo_leitura INT,
    nota INT,
    resenha VARCHAR(500),
    user_id INT,
    FOREIGN KEY (user_id)
    REFERENCES users(id_user)
);

CREATE TABLE likes(
	id_like INT PRIMARY KEY AUTO_INCREMENT,
    livro_id INT,
    FOREIGN KEY (livro_id)
    REFERENCES livro(id_livro),
    user_id INT,
    FOREIGN KEY (user_id)
    REFERENCES users(id_user)
);

CREATE TABLE comments(
	id_comment INT PRIMARY KEY AUTO_INCREMENT,
    comentario VARCHAR(500),
    livro_id INT,
    FOREIGN KEY (livro_id)
    REFERENCES livro(id_livro),
    user_id INT,
    FOREIGN KEY (user_id)
    REFERENCES users(id_user)
);

INSERT INTO users (nome, email, senha) VALUES
('Ana Silva', 'ana.silva@email.com', 'ana123'),
('Bruno Costa', 'bruno.costa@email.com', 'bruno456'),
('Carla Mendes', 'carla.mendes@email.com', 'carla789');

INSERT INTO livro (titulo, autor, genero, total_paginas, tempo_leitura, nota, resenha, user_id) VALUES
('1984', 'George Orwell', 'Distopia', 328, 480, 10, 'Um clássico aterrorizante sobre totalitarismo e vigilância.', 1), -- Ana
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 'Infantojuvenil', 96, 90, 9, 'Uma fábula poética sobre amizade, amor e o essencial invisível aos olhos.', 1), -- Ana
('Dom Casmurro', 'Machado de Assis', 'Romance', 256, 360, 8, 'Narrativa ambígua sobre ciúme e traição na visão de Bentinho.', 2), -- Bruno
('Clean Code', 'Robert C. Martin', 'Técnico', 464, 720, 10, 'Guia essencial para escrever código limpo, legível e manutenível.', 3), -- Carla
('Sapiens: Uma Breve História da Humanidade', 'Yuval Noah Harari', 'Não-ficção', 448, 660, 9, 'Panorama fascinante da evolução humana e suas revoluções.', 2); -- Bruno

INSERT INTO likes (livro_id, user_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 2),
(4, 1),
(4, 3),
(5, 2);

INSERT INTO comments (comentario, livro_id, user_id) VALUES
('Livro essencial para entender o mundo atual.', 1, 1),
('A vigilância nunca foi tão atual.', 1, 2),
('"O essencial é invisível aos olhos" - frase marcante!', 2, 3),
('Capitu traiu ou não? Machado nos deixa na dúvida!', 3, 2),
('Todo dev deveria ler pelo menos uma vez na vida.', 4, 1),
('Mudou minha visão sobre história e humanidade.', 5, 2);