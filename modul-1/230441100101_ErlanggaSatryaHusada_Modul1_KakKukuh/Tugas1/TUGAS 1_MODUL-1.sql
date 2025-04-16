CREATE DATABASE db_akademik;

USE db_akademik;

SHOW TABLES;

-- TABEL PRODI 
CREATE TABLE Prodi (
    id_prodi INT NOT NULL AUTO_INCREMENT,
    nama_prodi VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (id_prodi)
)ENGINE = INNODB;







-- TABEL MAHASISWA ---------------------------------------------------------------------------------------------------------------------
CREATE TABLE Mahasiswa (
    nim VARCHAR(10) NOT NULL,
    nama VARCHAR(100) NOT NULL,
    angkatan INT NOT NULL,
    id_prodi INT,
    PRIMARY KEY (nim),
    CONSTRAINT fk_prodi_mhs FOREIGN KEY (id_prodi) REFERENCES Prodi(id)
)ENGINE = INNODB;




#-- TABEL DOSEN -----------------------------------------------------------------------------------------------------------------
CREATE TABLE Dosen (
    nip VARCHAR(20) NOT NULL,
    nama VARCHAR(100) NOT NULL,
    gelar VARCHAR(50),
    id_prodi INT,
    PRIMARY KEY (nip),
    CONSTRAINT fk_prodi_dosen FOREIGN KEY (id_prodi) REFERENCES Prodi(id)
)ENGINE = INNODB;



-- TABEL MATAKULIAH
CREATE TABLE MataKuliah (
    id VARCHAR(10) NOT NULL,
    nama_mk VARCHAR(100) NOT NULL,
    sks INT NOT NULL,
    semester INT NOT NULL,
    id_prodi INT,
    PRIMARY KEY (id),
    CONSTRAINT fk_prodi_mk FOREIGN KEY (id_prodi) REFERENCES Prodi(id)
)ENGINE = INNODB;




-- TABEL RUANGAN
CREATE TABLE Ruangan (
    id INT NOT NULL AUTO_INCREMENT,
    nama_ruang VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT unique_nama_ruang UNIQUE (nama_ruang)
)ENGINE = INNODB;

DESC Ruangan;


-- TABEL JADWAL
CREATE TABLE Jadwal (
    id INT NOT NULL AUTO_INCREMENT,
    id_mk VARCHAR(10)  NOT NULL ,
    nip VARCHAR(20) NOT NULL,
    id_ruang INT NOT NULL,
    hari VARCHAR(10) NOT NULL,
    jam_mulai TIME,
    jam_selesai TIME,
    PRIMARY KEY (id),
    CONSTRAINT fk_jadwal_mk FOREIGN KEY (id_mk) REFERENCES MataKuliah(id),
    CONSTRAINT fk_jadwal_dosen FOREIGN KEY (nip) REFERENCES Dosen(nip),
    CONSTRAINT fk_jadwal_ruang FOREIGN KEY (id_ruang) REFERENCES Ruangan(id)
)ENGINE = INNODB;





-- TABEL KRS
CREATE TABLE KRS (
    id INT NOT NULL AUTO_INCREMENT,
    nim VARCHAR(10) NOT NULL,
    id_jadwal INT,
    semester INT NOT NULL,
    tahun_ajaran VARCHAR(10),
    PRIMARY KEY (id),
    CONSTRAINT fk_krs_mhs FOREIGN KEY (nim) REFERENCES Mahasiswa(nim),
    CONSTRAINT fk_krs_jadwal FOREIGN KEY (id_jadwal) REFERENCES Jadwal(id)
)ENGINE = INNODB;
#-----------------------------------------------




#--------------------------------
#query bebas
ALTER TABLE Prodi CHANGE id_prodi id INT NOT NULL AUTO_INCREMENT;
DESC prodi;
SHOW TABLES;

SELECT id, nama_prodi FROM Prodi;

INSERT INTO Prodi (nama_prodi) 
VALUES	('Teknik Informatika'), 
	('Sistem Informasi'), 
	('Teknik Elektro');


#------------------------------------

SHOW TABLES


DESC Mahasiswa;

#rubah struktur
ALTER TABLE krs 
DROP FOREIGN KEY fk_;

#
ALTER TABLE Mahasiswa
MODIFY nim VARCHAR(12) NOT NULL;

#
ALTER TABLE KRS
MODIFY nim VARCHAR(12) NOT NULL;

SHOW TABLES;

DROP TABLE Dosen;
DESC Dosen;


SELECT * FROM Mahasiswa;
SELECT * FROM Prodi;

INSERT INTO mahasiswa (nim, nama, angkatan, id_prodi)
VALUES ('230441100101', 'Erlangga Satrya Husada', '2023', 2),
       ('230441100045', 'Muhammad Naufal Fahmi', '2021', 2),
       ('230441100147', 'Muhammad Maulana Khanif', '2022', 2),
       ('230441100199', 'Vikas Irman Wansyah', '2019', 2),
       ('230441100088', 'Isma Yafa Nur Zamzami Ramaddahni', '2019', 2),
       ('230441100104', 'Dylan Aktarreza', '2024', 1),
       ('230441100012', 'Muhammad Fajri Alfaini', '2024', 3),
       ('230441100034', 'Agus Wedi', '2023', 1),
       ('230441100066', 'Alvyan Karnawan Putra', '2023', 3),
       ('230441100134', 'Yahya Ahmad', '2021', 3);
       
		


DESC Jadwal;

DESC Matakuliah;

DESC KRS;

SHOW TABLES;

SHOW CREATE TABLE KRS;

ALTER TABLE krs 
DROP FOREIGN KEY fk_krs_mhs;

ALTER TABLE krs 
ADD CONSTRAINT fk_krs_mhs FOREIGN KEY (nim) REFERENCES Mahasiswa(nim);

#--------------------------
#dosen

DESC Dosen;

SELECT * FROM Dosen;

INSERT INTO Dosen (nip, nama, gelar, id_prodi)
VALUES ('D001', 'MUHAMMAD YUSUF', 'ST, M.MT.', 2),
       ('D002', 'YUDHA DWI PUTRA NEGARA', 'S.Kom., M.Kom.', 2),
       ('D003', 'MUHAMMAD ALI SYAKUR', 'S.Si., M.T.', 2),
       ('D004', 'DONI ABDUL FATAH', 'S.Kom., M.Kom.', 2),
       ('D005', 'FIRMANSYAH ADIPUTRA', 'ST.M.Cs', 2),
       ('D006', 'FIRLI IRHAMNI', 'ST., M.Kom.', 1),
       ('D007', 'SRI HERAWATI', 'ST., M.Cs', 3),
       ('D008', 'MOHAMMAD SYARIEF', 'ST., M.Cs', 1),
       ('D009', 'Dr.WAHYUDI SETIAWAN', 'S.Kom., M.Kom.', 3),
       ('D010', 'ROSIDA VIVIN NAHARI', 'S.Kom,.MT', 3);
       
       
#Matakuliah

DESC MataKuliah;

SELECT * FROM matakuliah;

INSERT INTO MataKuliah (id, nama_mk, sks, semester, id_prodi) VALUES
('MK001', 'ANALISA PROSES BISNIS', 3, 1, 1),
('MK002', 'DESAIN MANAJEMEN JARINGAN', 3, 2, 1),
('MK003', 'E-BUSINESS DAN E-COMMERCE', 3, 4, 1),
('MK004', 'PEMROGRAMAN BERBASIS OBJEK', 3, 3, 2),
('MK005', 'PEMROGRAMAN BERBASIS WEB', 3, 1, 3),
('MK006', 'Pemrograman Web', 3, 4, 1),
('MK007', 'PENGANTAR BASIS DATA', 2, 3, 2),
('MK008', 'DATA MINING', 3, 5, 1),
('MK009', 'MANAJEMEN PROYEK IT', 3, 2, 1),
('MK010', 'PEMROGRAMAN BERGERAK', 3, 1, 1);

DESC ruangan;

SELECT * FROM ruangan;



#-------------------------------------------------------------------------------



INSERT INTO Ruangan (nama_ruang) 
VALUES	('Lab TI '), 
	('Lab BIS'), 
	('RKBF-307'), 
	('RKBF-408');
	
INSERT INTO Jadwal (id_mk, nip, id_ruang, hari, jam_mulai, jam_selesai) VALUES
('MK001', 'D001', 1, 'Senin', '08:00:00', '10:00:00'),
('MK002', 'D002', 2, 'Selasa', '10:00:00', '12:00:00'),
('MK003', 'D003', 3, 'Rabu', '13:00:00', '15:00:00'),
('MK006', 'D004', 1, 'Kamis', '08:00:00', '10:00:00'),
('MK008', 'D005', 2, 'Jumat', '10:00:00', '12:00:00');

SELECT * FROM jadwal;

SHOW CREATE TABLE jadwal;


#--------------------------------------------------------------------------------

SELECT * FROM KRS;

SHOW CREATE TABLE KRS;

SELECT * FROM Mahasiswa;

INSERT INTO KRS (nim, id_jadwal, semester, tahun_ajaran) VALUES
('230441100101', 1, 1, '2023/2024'),
('230441100012', 2, 2, '2023/2024'),
('230441100104', 3, 4, '2023/2024'),
('230441100199', 4, 3, '2023/2024'),
('230441100088', 5, 5, '2023/2024');

TRUNCATE KRS;
TRUNCATE Prodi;
TRUNCATE Ruangan;


USE db_akademik;

SELECT * FROM Prodi;
SELECT * FROM Dosen;
SELECT * FROM Mahasiswa;
SELECT * FROM Matakuliah;

SELECT * FROM Jadwal;
SELECT * FROM KRS;

                        
SHOW CREATE TABLE Prodi;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       

#------------------
#Tampilkan Mahasiswa dan Nama Prodi nya
SELECT m.nama, p.nama_prodi
FROM Mahasiswa AS m
JOIN prodi AS p ON (m.id_prodi = p.id);
