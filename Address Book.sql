--UC1:
CREATE DATABASE ADDRESSBOOK_SERVICE
SELECT * FROM SYS.DATABASES
USE ADDRESSBOOK_SERVICE

--UC2:
CREATE TABLE ADDRESS_BOOK(
ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
FIRST_NAME VARCHAR(25) NOT NULL,
LAST_NAME VARCHAR(25) NOT NULL,
ADDRESS VARCHAR(100) NOT NULL,
CITY VARCHAR(25) NOT NULL,
STATE VARCHAR(25) NOT NULL,
ZIP_CODE FLOAT NOT NULL,
PHONE_NUMBER FLOAT NOT NULL,
EMAIL VARCHAR(50) NOT NULL)

SELECT * FROM ADDRESS_BOOK

--UC3:
INSERT INTO ADDRESS_BOOK VALUES('Elavarasu','Appusamy','11A','Salem','Tamil Nadu',654321,9087654321,'elavarasu@gmail.com')
INSERT INTO ADDRESS_BOOK VALUES('Nantha','Gopal','12B','Coimbatore','Tamil Nadu',645321,8907654321,'nantha@gmail.com')
INSERT INTO ADDRESS_BOOK VALUES('Senthil','Kumar','13C','Dindigul','Tamil Nadu',634521,7890123456,'senthil@gmail.com')
INSERT INTO ADDRESS_BOOK VALUES('Thamarai','Selvan','14D','Tirupur','Tamil Nadu',621345,6543217890,'thamarai@gmail.com')
INSERT INTO ADDRESS_BOOK VALUES('Steven','John','15E','Chennai','Tamil Nadu',456321,9907564231,'steven@gmail.com')
INSERT INTO ADDRESS_BOOK VALUES('Appusamy','Muniyapagounder','11A','Komarapalayam','Tamil Nadu',654321,6789054123,'appusamy@gmail.com')
INSERT INTO ADDRESS_BOOK VALUES('Sudha','Shanmugam','16F','Coimbatore','Tamil Nadu',645312,7890654321,'sudha@gmail.com')
INSERT INTO ADDRESS_BOOK VALUES('Sarasmani','Appusamy','11A','Komarapalayam','Tamil Nadu',456321,9786672345,'saras@gmail.com','Family')

--UC4:
UPDATE ADDRESS_BOOK SET CITY = 'Komarapalayam' WHERE FIRST_NAME = 'Elavarasu'

--UC5:
DELETE FROM ADDRESS_BOOK WHERE FIRST_NAME = 'Steven'

--UC6:
SELECT * FROM ADDRESS_BOOK WHERE CITY = 'Komarapalayam'
SELECT * FROM ADDRESS_BOOK WHERE STATE = 'Tamil Nadu'

--UC7:
SELECT CITY, COUNT(CITY) AS CITY_COUNT FROM ADDRESS_BOOK GROUP BY CITY
SELECT STATE, COUNT(STATE) AS STATE_COUNT FROM ADDRESS_BOOK GROUP BY STATE

--UC8:
SELECT * FROM ADDRESS_BOOK WHERE CITY = 'Komarapalayam' ORDER BY FIRST_NAME ASC

--UC9:
ALTER TABLE ADDRESS_BOOK ADD TYPE VARCHAR(20) NOT NULL DEFAULT('')
UPDATE ADDRESS_BOOK SET TYPE = 'Family' WHERE FIRST_NAME = 'Elavarasu'
UPDATE ADDRESS_BOOK SET TYPE = 'Family' WHERE FIRST_NAME = 'Appusamy'
UPDATE ADDRESS_BOOK SET TYPE = 'Family' WHERE FIRST_NAME = 'Sudha'
UPDATE ADDRESS_BOOK SET TYPE = 'Family' WHERE FIRST_NAME = 'Sarasmani'
UPDATE ADDRESS_BOOK SET TYPE = 'Friends' WHERE FIRST_NAME = 'Nantha'
UPDATE ADDRESS_BOOK SET TYPE = 'Friends' WHERE FIRST_NAME = 'Senthil'
UPDATE ADDRESS_BOOK SET TYPE = 'Friends' WHERE FIRST_NAME = 'Thamarai'

--UC10:
SELECT TYPE, COUNT(TYPE) AS TYPE_COUNT FROM ADDRESS_BOOK GROUP BY TYPE

--UC11:
INSERT INTO ADDRESS_BOOK VALUES('Anand','Raj','20Z','Neyveli','Tamil Nadu',612345,6543217890,'anand@gmail.com','Friends')
INSERT INTO ADDRESS_BOOK VALUES('Anand','Raj','20Z','Neyveli','Tamil Nadu',612345,6543217890,'anand@gmail.com','Family')

--UC12:
--CREATING CONTACT_TYPE TABLE
CREATE TABLE CONTACT_TYPE(
TYPE_ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
TYPE_NAME VARCHAR(25) NOT NULL)

INSERT INTO CONTACT_TYPE VALUES('Family'),('Friends'),('Colleagues')

SELECT * FROM CONTACT_TYPE

--CREATING CONTACT_ADDRESS TABLE
CREATE TABLE CONTACT_ADDRESS(
CONTACT_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
FIRST_NAME VARCHAR(25) NOT NULL,
LAST_NAME VARCHAR(25) NOT NULL,
ADDRESS VARCHAR(100) NOT NULL,
CITY VARCHAR(25) NOT NULL,
STATE VARCHAR(25) NOT NULL,
ZIP_CODE FLOAT NOT NULL,
EMAIL VARCHAR(50) NOT NULL,
TYPE_ID INT NOT NULL)

SELECT * FROM CONTACT_ADDRESS

INSERT INTO CONTACT_ADDRESS VALUES('Elavarasu','Appusamy','11A','Salem','Tamil Nadu',654321,'elavarasu@gmail.com',1)
INSERT INTO CONTACT_ADDRESS VALUES('Nantha','Gopal','12B','Coimbatore','Tamil Nadu',645321,'nantha@gmail.com',2)
INSERT INTO CONTACT_ADDRESS VALUES('Senthil','Kumar','13C','Dindigul','Tamil Nadu',634521,'senthil@gmail.com',2)
INSERT INTO CONTACT_ADDRESS VALUES('Thamarai','Selvan','14D','Tirupur','Tamil Nadu',621345,'thamarai@gmail.com',2)
INSERT INTO CONTACT_ADDRESS VALUES('Steven','John','15E','Chennai','Tamil Nadu',456321,'steven@gmail.com',3)
INSERT INTO CONTACT_ADDRESS VALUES('Appusamy','Muniyapagounder','11A','Komarapalayam','Tamil Nadu',654321,'appusamy@gmail.com',1)
INSERT INTO CONTACT_ADDRESS VALUES('Sudha','Shanmugam','16F','Coimbatore','Tamil Nadu',645312,'sudha@gmail.com',1)
INSERT INTO CONTACT_ADDRESS VALUES('Sarasmani','Appusamy','11A','Komarapalayam','Tamil Nadu',456321,'saras@gmail.com',1)

--CREATING CONTACT_PHONE TABLE
CREATE TABLE CONTACT_PHONE(
CONTACT_ID INT NOT NULL,
FIRST_NAME VARCHAR(25) NOT NULL,
PHONE_1 FLOAT NOT NULL,
PHONE_2 FLOAT NULL)

INSERT INTO CONTACT_PHONE VALUES(1,'Elavarasu',9087654321,6987523410)
INSERT INTO CONTACT_PHONE (CONTACT_ID,FIRST_NAME,PHONE_1) VALUES(2,'Nantha',8907654321)
INSERT INTO CONTACT_PHONE VALUES(3,'Senthil',7890123456,7689054321)
INSERT INTO CONTACT_PHONE VALUES(4,'Thamarai',6543217890,8906745123)
INSERT INTO CONTACT_PHONE VALUES(5,'Steven',9907564231,7908645231)
INSERT INTO CONTACT_PHONE (CONTACT_ID,FIRST_NAME,PHONE_1) VALUES(6,'Appusamy',6789054123)
INSERT INTO CONTACT_PHONE VALUES(7,'Sudha',7890654321,6795321405)
INSERT INTO CONTACT_PHONE VALUES(8,'Sarasmani',9786672345,8755428901)

SELECT * FROM CONTACT_PHONE

--ADDING CONSTRAINTS TO THE TABLE
ALTER TABLE CONTACT_ADDRESS ADD CONSTRAINT FK_CONTACT_TYPE FOREIGN KEY(TYPE_ID) REFERENCES CONTACT_TYPE(TYPE_ID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE CONTACT_PHONE ADD CONSTRAINT FK_CONTACT_PHONE FOREIGN KEY(CONTACT_ID) REFERENCES CONTACT_ADDRESS(CONTACT_ID) ON DELETE CASCADE ON UPDATE CASCADE

--UC13:Ensuring UC6, UC7, UC8, UC10
SELECT * FROM CONTACT_ADDRESS WHERE CITY = 'Komarapalayam'
SELECT * FROM CONTACT_ADDRESS WHERE STATE = 'Tamil Nadu'

SELECT CITY, COUNT(CITY) AS CONTACT_ADDRESS FROM ADDRESS_BOOK GROUP BY CITY
SELECT STATE, COUNT(STATE) AS CONTACT_ADDRESS FROM ADDRESS_BOOK GROUP BY STATE

SELECT * FROM CONTACT_ADDRESS WHERE CITY = 'Komarapalayam' ORDER BY FIRST_NAME ASC

SELECT TYPE_NAME,COUNT(TYPE_NAME) AS COUNT FROM CONTACT_TYPE CT INNER JOIN CONTACT_ADDRESS CA ON CT.TYPE_ID = CA.TYPE_ID GROUP BY TYPE_NAME
SELECT TYPE_NAME,CA.FIRST_NAME,PHONE_1 FROM CONTACT_TYPE CT INNER JOIN CONTACT_ADDRESS CA ON CT.TYPE_ID = CA.TYPE_ID 
INNER JOIN CONTACT_PHONE CP ON CA.CONTACT_ID = CP.CONTACT_ID

--PROCEDURE FOR ADDING CONTACTS IN ADDRESS_BOOK TABLE
GO
CREATE OR ALTER PROCEDURE [dbo].[AddContacts]
(@FIRST_NAME VARCHAR(25),
@LAST_NAME VARCHAR(25),
@ADDRESS VARCHAR(100),
@CITY VARCHAR(25),
@STATE VARCHAR(25),
@ZIP_CODE FLOAT,
@PHONE_NUMBER FLOAT,
@EMAIL VARCHAR(50),
@TYPE VARCHAR(20))
AS
BEGIN
INSERT INTO ADDRESS_BOOK VALUES(@FIRST_NAME,@LAST_NAME,@ADDRESS,@CITY,@STATE,@ZIP_CODE,@PHONE_NUMBER,@EMAIL,@TYPE)
END

--PROCEDURE FOR UPDATE DATA IN ADDRESS_BOOK TABLE
GO
CREATE OR ALTER PROCEDURE [dbo].[UpdateTable]
(@ADDRESS VARCHAR(100),
@ID INT)
AS
BEGIN
UPDATE ADDRESS_BOOK SET ADDRESS = @ADDRESS WHERE ID = @ID
END

--PROCEDURE FOR DELETE DATA IN ADDRESS_BOOK TABLE
GO
CREATE OR ALTER PROCEDURE [dbo].[DeleteData]
(@ID INT)
AS
BEGIN
DELETE FROM ADDRESS_BOOK WHERE ID = @ID
END

DELETE FROM ADDRESS_BOOK WHERE FIRST_NAME = 'Jeeva'
select * from ADDRESS_BOOK