CREATE DATABASE Course

USE Course

CREATE TABLE Students (
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(50) NOT NULL,
    Surname NVARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Email NVARCHAR(70) UNIQUE,
    [Address] NVARCHAR(70)
)

INSERT INTO Students VALUES
('Ali', 'Talibov', 21, 'aliit@code.edu.az', 'Xetai'),
('Cavid', 'Bashirov', 29, 'cavid@code.edu.az', 'Ehmedli'),
('Eclan', 'Qurbanov', 20, 'elcan@code.edu.az', 'Ulduz'),
('Konul', 'Ibrahimova', 27, 'konul@code.edu.az', 'Neftchiler')


CREATE TABLE StudentArchives (
    Id INT,
    [Name] NVARCHAR(50) NOT NULL,
    Surname NVARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Email NVARCHAR(70) UNIQUE,
    [Address] NVARCHAR(70)
)

CREATE TRIGGER trg_ArchiveStudent ON Students
AFTER DELETE
AS

BEGIN
    INSERT INTO StudentArchives
    SELECT Id, [Name], Surname, Age, Email, [Address] FROM DELETED
END




CREATE PROCEDURE usp_DeleteStudent
@id INT
AS

BEGIN
    DELETE FROM Students WHERE Id = @id
END



EXEC usp_DeleteStudent 2