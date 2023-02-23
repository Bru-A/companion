DROP database companion;
CREATE DATABASE companion;
USE companion;

CREATE TABLE usuario
(id_usuario smallint primary key auto_increment,
nome_usuario varchar(70) not null,
login varchar(30),
email varchar(70),
senha varchar(16),
CREATED_AT DATETIME DEFAULT NOW());

drop table terreno;
CREATE TABLE terreno
(id_terreno smallint primary key auto_increment,
latitude_terreno DECIMAL(10,8),
longitude_terreno DECIMAL(10,8),
id_usuario smallint,
CREATED_AT DATETIME DEFAULT NOW());

drop table guilda;
CREATE TABLE guilda
(id_guilda smallint primary key auto_increment,
nome_guilda varchar(30),
id_terreno smallint,
id_arvore smallint,
id_supressora smallint,
id_repelent smallint,
id_polinizadora smallint,
id_fixadora smallint,
id_cobertura smallint,
CREATED_AT DATETIME DEFAULT NOW());

CREATE TABLE arvore
(id_arvore smallint primary key auto_increment,
nome_arvore varchar(30),
info_arvore MEDIUMTEXT,
CREATED_AT DATETIME DEFAULT NOW());

CREATE TABLE supressora
(id_supressora smallint primary key auto_increment,
nome_supressora varchar(30),
info_supressora MEDIUMTEXT,
CREATED_AT DATETIME DEFAULT NOW());

CREATE TABLE repelente
(id_repelente smallint primary key auto_increment,
nome_repelente varchar(30),
info_repelente MEDIUMTEXT,
CREATED_AT DATETIME DEFAULT NOW());

CREATE TABLE polinizadora
(id_polinizadora smallint primary key auto_increment,
nome_polinizadora varchar(30),
info_polinizadora MEDIUMTEXT,
CREATED_AT DATETIME DEFAULT NOW());

CREATE TABLE fixadora
(id_fixadora smallint primary key auto_increment,
nome_fixadora varchar(30),
info_fixadora MEDIUMTEXT,
CREATED_AT DATETIME DEFAULT NOW());

CREATE TABLE cobertura
(id_cobertura smallint primary key auto_increment,
nome_cobertura varchar(30),
info_cobertura MEDIUMTEXT,
CREATED_AT DATETIME DEFAULT NOW());

ALTER TABLE terreno ADD CONSTRAINT fk_terreno FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario);
ALTER TABLE guilda ADD CONSTRAINT fk_terrenoguilda FOREIGN KEY (id_terreno) REFERENCES terreno(id_terreno);
ALTER TABLE guilda ADD CONSTRAINT fk_arvoreguilda FOREIGN KEY (id_arvore) REFERENCES arvore(id_arvore);
ALTER TABLE guilda ADD CONSTRAINT fk_supressoraguilda FOREIGN KEY (id_supressora) REFERENCES supressora(id_supressora);
ALTER TABLE guilda ADD CONSTRAINT fk_repelenteguilda FOREIGN KEY (id_repelent) REFERENCES repelente(id_repelente);
ALTER TABLE guilda ADD CONSTRAINT fk_polinizadoraguilda FOREIGN KEY (id_polinizadora) REFERENCES polinizadora(id_polinizadora);
ALTER TABLE guilda ADD CONSTRAINT fk_fixadoraguilda FOREIGN KEY (id_fixadora) REFERENCES fixadora(id_fixadora);
ALTER TABLE guilda ADD CONSTRAINT fk_coberturaguilda FOREIGN KEY (id_cobertura) REFERENCES cobertura(id_cobertura);


-- INSERT INTO 
INSERT INTO Usuario (nome_usuario,login,email,senha) VALUES ('usuario1','user1','user1@gmail.com','user1pass');
INSERT INTO Terreno (latitude_terreno,longitude_terreno) VALUES ('42.496','35.496');
INSERT INTO guilda (nome_guilda) VALUES ('Maça do amor');
INSERT INTO arvore (nome_arvore,info_arvore) VALUES ('Maça',' árvore frutífera da família Rosaceae, tem o nome científico Malus domestica.Talvez as maçãs tenham sido uma das primeiras frutas consumidas pelo homem na natureza, além de uma daquelas que começaram a crescer antes. ser cultivado.' );
INSERT INTO supressora (nome_supressora,info_supressora) VALUES ('Redwood Sorrel','info supressora');
INSERT INTO repelente (nome_repelente,info_repelente) VALUES ('Dill','info repelente');
INSERT INTO polinizadora (nome_polinizadora,info_polinizadora) VALUES ('nomepoli','infopoli');
INSERT INTO fixadora (nome_fixadora,info_fixadora) VALUES ('nomefixadora','infofixadora');
INSERT INTO cobertura (nome_cobertura,info_cobertura) VALUES ('nomecobertura','infocoberturacoberturacoberturacobertura');

-- AUDIT: GUARDA OS VALORES QUE FORAM DELETADOS OU APÓS UPDATE E TAMBÉM NOVOS
drop table terreno_audit;
CREATE TABLE terreno_audit(
id int primary key auto_increment,
latitude_terreno_old DECIMAL,
latitude_terreno_new DECIMAL,
longitude_terreno_old DECIMAL,
longitude_terreno_new DECIMAL,
id_usuario_old smallint,
id_usuario_new smallint,
responsible_user varchar(100) NOT NULL,
operation varchar(100) NOT NULL,
createdat datetime default now()
);
drop table guilda_audit;
CREATE TABLE guilda_audit(
id int primary key auto_increment,
id_guilda_old SMALLINT,
id_guilda_NEW SMALLINT,
nome_guilda_old varchar(30),
nome_guilda_new varchar(30),
id_terreno_old smallint,
id_terreno_new smallint,
id_arvore_old smallint,
id_arvore_new smallint,
id_supressora_old smallint,
id_supressora_new smallint,
id_repelent_old smallint,
id_repelent_new smallint,
id_polinizadora_old smallint,
id_polinizadora_new smallint,
id_fixadora_old smallint,
id_fixadora_new smallint,
id_cobertura_old smallint,
id_cobertura_new smallint,
responsible_user varchar(100) NOT NULL,
operation varchar(100) NOT NULL,
createdat datetime default now()
);
drop table arvore_audit;
CREATE TABLE arvore_audit(
id int primary key auto_increment,
id_arvore_old smallint,
id_arvore_new smallint,
nome_arvore_old varchar(30),
nome_arvore_new varchar(30),
info_arvore_old MEDIUMTEXT,
info_arvore_new MEDIUMTEXT,
responsible_user varchar(100) NOT NULL,
operation varchar(100) NOT NULL,
createdat datetime default now()
);
drop table supressora_audit;
CREATE TABLE supressora_audit(
id_supressora_old smallint,
id_supressora_new smallint,
nome_supressora_old varchar(30),
nome_supressora_new varchar(30),
info_supressora_old MEDIUMTEXT,
info_supressora_new MEDIUMTEXT,
responsible_user varchar(100) NOT NULL,
operation varchar(100) NOT NULL,
createdat datetime default now()
);
drop table repelente_audit;
CREATE TABLE repelente_audit(
id_repelente_old smallint,
id_repelente_new smallint,
nome_repelente_old varchar(30),
nome_repelente_new varchar(30),
info_repelente_old MEDIUMTEXT,
info_repelente_new MEDIUMTEXT,
responsible_user varchar(100) NOT NULL,
operation varchar(100) NOT NULL,
createdat datetime default now()
);
drop table polinizadora_audit;
CREATE TABLE polinizadora_audit(
id_polinizadora_old smallint,
id_polinizadora_new smallint,
nome_polinizadora_old varchar(30),
nome_polinizadora_new varchar(30),
info_polinizadora_old MEDIUMTEXT,
info_polinizadora_new MEDIUMTEXT,
responsible_user varchar(100) NOT NULL,
operation varchar(100) NOT NULL,
createdat datetime default now()
);
drop table fixadora_audit;
CREATE TABLE fixadora_audit(
id_fixadora_old smallint,
id_fixadora_new smallint,
nome_fixadora_old varchar(30),
nome_fixadora_new varchar(30),
info_fixadora_old MEDIUMTEXT,
info_fixadora_new MEDIUMTEXT,
responsible_user varchar(100) NOT NULL,
operation varchar(100) NOT NULL,
createdat datetime default now()
);
drop table cobertura_audit;
CREATE TABLE cobertura_audit(
id_cobertura_old smallint,
id_cobertura_new smallint,
nome_cobertura_old varchar(30),
nome_cobertura_new varchar(30),
info_cobertura_old MEDIUMTEXT,
info_cobertura_new MEDIUMTEXT,
responsible_user varchar(100) NOT NULL,
operation varchar(100) NOT NULL,
createdat datetime default now()
);

-- Triggers
-- triggers terreno
DELIMITER //
CREATE TRIGGER audit_create_terreno
AFTER INSERT ON terreno FOR EACH ROW 
BEGIN 
	INSERT INTO terreno_audit(
		latitude_terreno_new,
		longitude_terreno_new,
		id_usuario_new,
		responsible_user,
		operation) 
	VALUES
    (
		NEW.latitude_terreno,
        NEW.longitude_terreno,
        NEW.id_usuario,
        CURRENT_USER(),
        "NOVO_TERRENO"
    ); END //
    DELIMITER ;
   
    DELIMITER //
CREATE TRIGGER audit_update_terreno
AFTER UPDATE ON terreno FOR EACH ROW 
BEGIN 
	INSERT INTO terreno_audit(
		latitude_terreno_old,
		latitude_terreno_new,
        longitude_terreno_old,
		longitude_terreno_new,
        id_usuario_old,
		id_usuario_new,
		responsible_user,
		operation) 
	VALUES
    (
		OLD.latitude_terreno,
		NEW.latitude_terreno,
		OLD.longitude_terreno,
        NEW.longitude_terreno,
        NEW.id_usuario,
        CURRENT_USER(),
        "UPDATE_TERRENO"
    ); END //
    DELIMITER ;
    DROP TRIGGER audit_delete_terreno;
        DELIMITER //
CREATE TRIGGER audit_delete_terreno
AFTER DELETE ON terreno FOR EACH ROW 
BEGIN 
	INSERT INTO terreno_audit(
		latitude_terreno_old,
		longitude_terreno_old,
		id_usuario_old,
		Responsible_user,
		operation) 
	VALUES
    (
		OLD.latitude_terreno,
		OLD.longitude_terreno,
        CURRENT_USER(),
        "delete_TERRENO"
    ); END //
    DELIMITER ;
   
    -- Triggers guilda_audit
    DELIMITER //
CREATE TRIGGER audit_create_guilda
AFTER INSERT ON guilda FOR EACH ROW 
BEGIN 
	INSERT INTO guilda_audit(
		nome_guilda_new,
		responsible_user,
		operation) 
	VALUES
    (
		NEW.nome_guilda,
        CURRENT_USER(),
        "NOVa_guilda"
    ); END //
    DELIMITER ;
   
    DELIMITER //
CREATE TRIGGER audit_update_guilda
AFTER UPDATE ON guilda FOR EACH ROW 
BEGIN 
	INSERT INTO guilda_audit(
		nome_guilda_old,
		nome_guilda_new,
       	responsible_user,
		operation) 
	VALUES
    (
		OLD.nome_guilda,
		NEW.nome_guilda,
		CURRENT_USER(),
        "UPDATE_guilda"
    ); END //
    DELIMITER ;
    
    DROP TRIGGER audit_delete_guilda;
        DELIMITER //
CREATE TRIGGER audit_delete_guilda
AFTER DELETE ON guilda FOR EACH ROW 
BEGIN 
	INSERT INTO guilda_audit(
		nome_guilda_old,
		Responsible_user,
		operation) 
	VALUES
    (
		OLD.nome_guilda,
        CURRENT_USER(),
        "delete_guilda"
    ); END //
    DELIMITER ;
    
    -- triggers arvore
 
    DELIMITER //
CREATE TRIGGER audit_create_arvore
AFTER INSERT ON arvore FOR EACH ROW 
BEGIN 
	INSERT INTO arvore_audit(
		nome_arvore_new,
        info_arvore_new,
		responsible_user,
		operation) 
	VALUES
    (
		NEW.nome_arvore,
        NEW.info_arvore,
        CURRENT_USER(),
        "NOVa_arvore"
    ); END //
    DELIMITER ;
   
    DELIMITER //
CREATE TRIGGER audit_update_arvore
AFTER UPDATE ON arvore FOR EACH ROW 
BEGIN 
	INSERT INTO arvore_audit(
		nome_arvore_old,
		nome_arvore_new,
        info_arvore_old,
		info_arvore_new,
       	responsible_user,
		operation) 
	VALUES
    (
		OLD.nome_arvore,
		NEW.nome_arvore,
        OLD.info_arvore,
		NEW.info_arvore,
		CURRENT_USER(),
        "UPDATE_arvore"
    ); END //
    DELIMITER ;
    
    DROP TRIGGER audit_delete_arvore;
        DELIMITER //
CREATE TRIGGER audit_delete_arvore
AFTER DELETE ON arvore FOR EACH ROW 
BEGIN 
	INSERT INTO arvore_audit(
		nome_arvore_old,
        info_arvore_old,
		Responsible_user,
		operation) 
	VALUES
    (
		OLD.nome_arvore,
        OLD.info_arvore,
        CURRENT_USER(),
        "delete_arvore"
    ); END //
    DELIMITER ;
    
    -- Trigger para validação de campos
   DELIMITER //
    CREATE TRIGGER valida_nomeguilda
    BEFORE INSERT ON guilda FOR EACH ROW
    BEGIN
		IF NEW.nome_guilda REGEXP '^([a-z]){4,20}$' THEN
        SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT = "Insira um nome de 4 a 20 caracteres";
        END IF;
	END //
	DELIMITER ;
    
      DELIMITER //
    CREATE TRIGGER valida_email
    BEFORE INSERT ON usuario FOR EACH ROW
    BEGIN
		IF NEW.email REGEXP '([-!#-*+/-9=?A-Z^-~]+(\.[-!#-*+/-9=?A-Z^-~]+)*|"([]!#-[^-~ \t]|(\\[\t -~]))+")@([-!#-*+/-9=?A-Z^-~]+(\.[-!#-*+/-9=?A-Z^-~]+)*|\[[\t -Z^-~]*])' THEN
        SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT = "Insira um email válido";
        END IF;
	END //
	DELIMITER ;
    
    -- Testando triggers
   SELECT * FROM TERRENO_audit;
   UPDATE terreno SET latitude_terreno = 66.666 where longitude_terreno=35.496;
   DELETE from terreno where longitude_terreno=35.496;
   
-- Função
DELIMITER //
CREATE FUNCTION ListaGuilda(arvore varchar(30), supressora varchar(30), repelent varchar(30),
polinizadora varchar(30), fixadora varchar(30), cobertura varchar(30))
RETURNS varchar(200) DETERMINISTIC
BEGIN
	RETURN CONCAT (ARVORE,supressora,repelent,polinizadora,fixadora,cobertura );
END //   
DELIMITER ;

SELECT ListaGuilda (nome_arvore, nome_supressora, nome_repelente,
nome_polinizadora, nome_fixadora, nome_cobertura) FROM arvore,supressora,repelente,polinizadora,fixadora,cobertura;

-- View





