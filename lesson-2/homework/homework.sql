----- *** Asosiy darajadagi vazifalar (10) *** -----
----- 1. Ustunlar bilan xodimlar jadvalini yarating: EmpID INT, Ism (VARCHAR(50)) va Ish haqi (DECIMAL(10,2)).
create database homework_02
use homework_02
create table xodimlar (EmpID INT, Ism VARCHAR(50), Ish_haqi DECIMAL(10,2))
select * from xodimlar


----- 2. Turli xil INSERT INTO yondashuvlaridan foydalangan holda 
----- Xodimlar jadvaliga uchta yozuvni kiriting (bir qatorli va bir nechta qatorli qo'shimchalar).
INSERT INTO xodimlar values 
	(1, 'Jasur', 5020.5)
INSERT INTO xodimlar values 
	(2, 'Sardor', 5000.2),
	(3, 'Guli', 5050.5),
	(4, 'Nilu', 4000.1)
select * from xodimlar

----- 3. Xodimning ish haqini 7000 ga yangilang, bunda EmpID = 1.
update xodimlar
set Ish_haqi = 7000
where EmpID = 1
select * from xodimlar

----- 4. EmpID = 2 bo'lgan Xodimlar jadvalidan yozuvni o'chiring.
delete xodimlar
where EmpID = 2
select * from xodimlar

----- 5. DELETE, TRUNCATE va DROP o'rtasidagi farqga qisqacha ta'rif bering.
-- delete -> jadval ichidagi qatorlarni o'chiradi where orqali shart berib tanlab o'chirish ham mumkin;
-- truncate -> jadvaldagi barcha ma'lumotlarni o'chiradi where orqali shart berib bo'lmaydi;
-- drop -> jadvalni butunlay o'chirib tashlaydi.

----- 6. Xodimlar jadvalidagi Ism ustunini VARCHAR(100) ga o'zgartiring.
ALTER TABLE xodimlar
ALTER COLUMN Ism VARCHAR(100);
select * from xodimlar
EXEC sp_help xodimlar;

----- 7. Xodimlar jadvaliga yangi bo'lim bo'limi (VARCHAR(50)) qo'shing.
ALTER TABLE xodimlar
ADD Bolim VARCHAR(50);
select * from xodimlar

----- 8. Ish haqi ustunining ma'lumotlar turini FLOAT ga o'zgartiring.
ALTER TABLE xodimlar
ALTER COLUMN Ish_haqi FLOAT;
select * from xodimlar
EXEC sp_help xodimlar;

----- 9. DepartamentID (INT, PRIMARY KEY) va DepartmentName (VARCHAR(50)) ustunlari bilan boshqa bo'limlar jadvalini yarating.
CREATE TABLE bolimlar (DepartamentID INT PRIMARY KEY, DepartmentName VARCHAR(50))
select * from bolimlar

----- 10. Xodimlar jadvalidan barcha yozuvlarni tuzilishini o'chirmasdan olib tashlang.
delete xodimlar
select * from xodimlar

----- *** O'rta darajadagi vazifalar (6) *** -----
----- 1. INSERT INTO SELECT usuli yordamida Bo'limlar jadvaliga beshta yozuvni kiriting 
----- (siz xohlagan narsani ma'lumot sifatida yozishingiz mumkin).
INSERT INTO bolimlar values
(1, 'Tashqi'),
(2, 'Ichki'),
(3, 'Savdo'),
(4, 'Kadr'),
(5, 'Bux')
select * from bolimlar

----- 2. Ish haqi > 5000 bo'lgan barcha xodimlar bo'limini "Menejment" ga yangilang.
INSERT INTO xodimlar values 
	(1, 'Jasur', 5020.5, 'Tashqi'),
	(2, 'Sardor', 5000.2, 'Ichki'),
	(3, 'Guli', 5050.5, 'Savdo'),
	(4, 'Nilu', 4000.1, 'Tashqi')

update xodimlar
set Bolim = 'Menejment'
where Ish_haqi > 5000
select * from xodimlar

----- 3. Barcha xodimlarni olib tashlaydigan, lekin jadval tuzilmasini buzilmasdan saqlaydigan so'rov yozing.
truncate table xodimlar
select * from xodimlar

----- 4. Xodimlar jadvalidan bo'lim ustunini tashlang.
ALTER TABLE xodimlar
DROP COLUMN Bolim;
select * from xodimlar

----- 5. SQL buyruqlari yordamida Xodimlar jadvalining nomini StaffMembers deb o'zgartiring.
EXEC sp_rename 'xodimlar', 'StaffMembers';
select * from StaffMembers

----- 6. Bo'limlar jadvalini ma'lumotlar bazasidan butunlay olib tashlash uchun so'rov yozing.
drop table mahsulotlar

----- *** Yuqori darajadagi vazifalar (9) *** -----
----- 1. Mahsulotlar nomli jadvalni kamida 5 ta ustundan iborat yarating, jumladan: ProductID (Birlamchi kalit), 
----- Mahsulot nomi (VARCHAR), Kategoriya (VARCHAR), Narx (DECIMAL)
create table mahsulotlar (ProductID int Primary Key, Mahsulot_nomi VARCHAR(50), Kategoriya VARCHAR(50), Narx DECIMAL)
select * from mahsulotlar

----- 2. Narx har doim 0 dan katta bo'lishini ta'minlash uchun CHECK cheklovini qo'shing.
ALTER TABLE mahsulotlar
ADD CONSTRAINT chk_narx_musbat
CHECK (Narx > 0);
insert into mahsulotlar values
(1, 'Olma', 'meva', 15000),
(2, 'Nok', 'meva', 20000),
(3, 'Bodring', 'sabsovot', 10000),
(4, 'Pamidor', 'sabzovot', 12000)
select * from mahsulotlar

----- 3. DEFAULT qiymati 50 bo'lgan StockQuantity ustunini qo'shish uchun jadvalni o'zgartiring.
ALTER TABLE mahsulotlar
ADD StockQuantity int default 50;

insert into mahsulotlar (ProductID, Mahsulot_nomi, Kategoriya, Narx)
values (5, 'Banan', 'sitrus_meva', 15000)
select * from mahsulotlar

----- 4. Turkum nomini ProductCategory deb o‘zgartiring
EXEC sp_rename 'mahsulotlar.Kategoriya', 'ProductCategory', 'COLUMN';
select * from mahsulotlar

----- 5. Standart INSERT INTO so'rovlari yordamida Mahsulotlar jadvaliga 5 ta yozuvni kiriting.
insert into mahsulotlar (ProductID, Mahsulot_nomi, ProductCategory, Narx)
values
	(6, 'Behi', 'meva', 25000),
	(7, 'Olcha', 'meva', 30000),
	(8, 'Qovoq', 'poliz', 5000),
	(9, 'Qovun', 'poliz', 7000),
	(10, 'tarvuz', 'poliz', 3000)
select * from mahsulotlar

----- 6. Barcha Mahsulotlar maʼlumotlarini oʻz ichiga olgan Products_Backup nomli 
----- zaxira jadvalini yaratish uchun SELECT INTO dan foydalaning.
SELECT * INTO Products_Backup FROM mahsulotlar;
select * from Products_Backup

----- 7. Mahsulotlar jadvalining nomini Inventar deb o'zgartiring.
EXEC sp_rename 'mahsulotlar', 'Inventar';
select * from Inventar

----- 8. Narx ma'lumotlar turini DECIMAL(10,2) dan FLOAT ga o'zgartirish uchun Inventar jadvalini o'zgartiring.
ALTER TABLE Inventar
DROP CONSTRAINT chk_narx_musbat;

ALTER TABLE Inventar
ALTER COLUMN Narx FLOAT;
SELECT * FROM Inventar;

----- 9. Inventar jadvaliga 1000 dan boshlanadigan va 5 ga oshiriladigan ProductCode nomli IDENTITY ustunini qo'shing.
SELECT 
    IDENTITY(INT, 1000, 5) AS ProductCode,
    *
INTO Inventar_temp
FROM Inventar;
DROP TABLE Inventar;
EXEC sp_rename 'Inventar_temp', 'Inventar';
SELECT * FROM Inventar;
