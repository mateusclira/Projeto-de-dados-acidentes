-- Schema db_acidentes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_acidentes
-- -----------------------------------------------------
--DROP DATABASE db_acidentes
--CREATE DATABASE db_acidentes;
USE db_acidentes ;

-- -----------------------------------------------------
-- Table `d_causaacidente`
-- -----------------------------------------------------
CREATE TABLE d_causaacidente (
  id_causaacidente INT NOT NULL,
  d_causaacidente VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (id_causaacidente))


-- -----------------------------------------------------
-- Table `d_classificacaoacidente`
-- -----------------------------------------------------
CREATE TABLE d_classificacaoacidente (
  d_classificacaoacidente INT NOT NULL,
  PRIMARY KEY (d_classificacaoacidente))

-- -----------------------------------------------------
-- Table `d_condicaometereologica`
-- -----------------------------------------------------
CREATE TABLE d_condicaometereologica (
  id_condicaometereologica INT NOT NULL,
  d_condicaometereologicacol VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_condicaometereologica))
-- -----------------------------------------------------
-- Table `d_dataacidente`
-- -----------------------------------------------------
CREATE TABLE d_dataacidente (
  data_acidente INT NOT NULL,
  d_dataacidente DATE NOT NULL,
  PRIMARY KEY (data_acidente))

-- -----------------------------------------------------
-- Table `d_diasemana`
-- -----------------------------------------------------
CREATE TABLE d_diasemana (
  d_diasemana INT NOT NULL,
  d_diasemana_nomes VARCHAR(45) NOT NULL,
  PRIMARY KEY (d_diasemana))


-- -----------------------------------------------------
-- Table `d_fasedia`
-- -----------------------------------------------------
CREATE TABLE d_fasedia (
  id_fasedia INT NOT NULL,
  d_fasediacol VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (id_fasedia))



-- -----------------------------------------------------
-- Table `d_horario`
-- -----------------------------------------------------
CREATE TABLE d_horario (
  id_horario INT NOT NULL,
  d_horario TIMESTAMP NOT NULL,
  PRIMARY KEY (id_horario))


-- -----------------------------------------------------
-- Table `d_localizacao`
-- -----------------------------------------------------
CREATE TABLE d_localizacao (
  d_localizacao INT NOT NULL,
  d_uf VARCHAR(2) NOT NULL,
  d_br INT NOT NULL,
  d_km INT NULL DEFAULT NULL,
  PRIMARY KEY (d_localizacao))



-- -----------------------------------------------------
-- Table `d_tipoacidente`
-- -----------------------------------------------------
CREATE TABLE d_tipoacidente (
  idd_tipoacidente INT NOT NULL,
  d_tipoacidentecol VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (idd_tipoacidente))


-- -----------------------------------------------------
-- Table `d_tipopista`
-- -----------------------------------------------------
CREATE TABLE d_tipopista (
  d_tipopista INT NOT NULL,
  PRIMARY KEY (d_tipopista))

-- -----------------------------------------------------
-- Table `f_acidente`
-- -----------------------------------------------------
CREATE TABLE f_acidente (
  id_acidentes INT NOT NULL,
  id_causaacidente INT NULL DEFAULT NULL,
  id_classificacaoacidente INT NULL DEFAULT NULL,
  id_condicaometeorologica INT NULL DEFAULT NULL,
  id_dataacidente INT NULL DEFAULT NULL,
  id_diasemana INT NULL DEFAULT NULL,
  id_fasedia INT NULL DEFAULT NULL,
  id_horario INT NULL DEFAULT NULL,
  id_localizacao INT NULL DEFAULT NULL,
  id_tipoacidente INT NULL DEFAULT NULL,
  id_tipopista INT NULL DEFAULT NULL,
  INDEX fk_id_classificacaoacidente_idx (id_classificacaoacidente),
  INDEX fk_id_condicaometeorologica_idx (id_condicaometeorologica),
  INDEX fk_id_causaacidente_idx (id_causaacidente),
  INDEX fk_id_dataacidente_idx (id_dataacidente),
  INDEX fk_id_diasemana_idx (id_diasemana),
  INDEX fk_id_fasedia_idx (id_fasedia),
  INDEX fk_id_horario_idx (id_horario),
  INDEX fk_id_localizacao_idx (id_localizacao),
  INDEX fk_id_tipoacidente_idx (id_tipoacidente),
  INDEX fk_id_tipopista_idx (id_tipopista),
  CONSTRAINT fk_id_causaacidente
    FOREIGN KEY (id_causaacidente)
    REFERENCES d_causaacidente (id_causaacidente),
  CONSTRAINT fk_id_classificacaoacidente
    FOREIGN KEY (id_classificacaoacidente)
    REFERENCES d_classificacaoacidente (d_classificacaoacidente),
  CONSTRAINT fk_id_condicaometeorologica
    FOREIGN KEY (id_condicaometeorologica)
    REFERENCES d_condicaometereologica (id_condicaometereologica),
  CONSTRAINT fk_id_dataacidente
    FOREIGN KEY (id_dataacidente)
    REFERENCES d_dataacidente (data_acidente),
  CONSTRAINT fk_id_diasemana
    FOREIGN KEY (id_diasemana)
    REFERENCES d_diasemana (d_diasemana),
  CONSTRAINT fk_id_fasedia
    FOREIGN KEY (id_fasedia)
    REFERENCES d_fasedia (id_fasedia),
  CONSTRAINT fk_id_horario
    FOREIGN KEY (id_horario)
    REFERENCES d_horario (id_horario),
  CONSTRAINT fk_id_localizacao
    FOREIGN KEY (id_localizacao)
    REFERENCES d_localizacao (d_localizacao),
  CONSTRAINT fk_id_tipoacidente
    FOREIGN KEY (id_tipoacidente)
    REFERENCES d_tipoacidente (idd_tipoacidente),
  CONSTRAINT fk_id_tipopista
    FOREIGN KEY (id_tipopista)
    REFERENCES d_tipopista (d_tipopista))

