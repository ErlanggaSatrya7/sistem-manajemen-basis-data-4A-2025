DROP DATABASE db_tiket_bioskop;

CREATE DATABASE db_tiket_bioskop;

USE db_tiket_bioskop;

#Tabel FILM
CREATE TABLE film (
    id VARCHAR(5) NOT NULL,
    judul_film VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    durasi INT NOT NULL,
    PRIMARY KEY(id)
)ENGINE = INNODB;


DROP TABLE Film;
#------------------------------------------------------------

#Tabel Studio
CREATE TABLE studio (
    id VARCHAR(5) NOT NULL,
    nama_studio VARCHAR(50) NOT NULL,
    kapasitas INT NOT NULL,
    PRIMARY KEY (id)
)ENGINE = INNODB;

#----------------------------------------------------------------------------------------

#Tabel Pelanggan
CREATE TABLE pelanggan (
    id VARCHAR(5) NOT NULL,
    nama VARCHAR(100) NOT NULL,
    no_telepon VARCHAR(15),
    PRIMARY KEY (id)
)ENGINE = INNODB;


#-----------------------------------------------------------------------------------

#Tabel Jadwal
CREATE TABLE jadwal (
    id VARCHAR(5) NOT NULL,
    id_film VARCHAR(5) NOT NULL,
    id_studio VARCHAR(5) NOT NULL,
    Waktu_Tayang DATETIME,
    PRIMARY KEY (id),
    CONSTRAINT fk_jadwal_film FOREIGN KEY (id_film) REFERENCES film (id),
    CONSTRAINT fk_jadwal_studio FOREIGN KEY (id_studio) REFERENCES studio(id)
)ENGINE = INNODB;

SHOW TABLES;

#--------------


#Tabel Tiket
CREATE TABLE tiket (
    id VARCHAR(5) NOT NULL,
    id_jadwal VARCHAR(5),
    id_pelanggan VARCHAR(5),
    no_kursi VARCHAR(5) NOT NULL,
    Harga INT NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT fk_tiket_jadwal FOREIGN KEY (id_jadwal) REFERENCES jadwal(id),
    CONSTRAINT fk_tiket_pelanggan FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id)
)ENGINE = INNODB;



#Tabel Pembayaran
CREATE TABLE pembayaran (
    id VARCHAR(5) NOT NULL,
    id_tiket VARCHAR(5),
    metode_pembayaran VARCHAR(20),
    total_bayar INT,
    tanggal_bayar DATE,
    PRIMARY KEY (id),
    CONSTRAINT fk_pembayaran_tiket FOREIGN KEY (id_tiket) REFERENCES Tiket(id)
)ENGINE = INNODB;

SHOW TABLES;


#INSERT
#1.
INSERT INTO film VALUES
('F001', 'Spider-man 3', 'Action', 90),
('F002', 'Detektif Malam', 'Thriller', 120),
('F003', 'Romansa 2045', 'Drama', 110);
SELECT * FROM film;

DROP TABLE  film;

TRUNCATE film;

SHOW TABLES;

USE db_tiket_bioskop;
SELECT *