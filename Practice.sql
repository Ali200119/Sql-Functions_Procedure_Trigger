-- Function

CREATE FUNCTION SayHelloWorld()
RETURNS NVARCHAR(50)
AS

BEGIN
    RETURN 'Hello World'
END

SELECT dbo.SayHelloWorld()



CREATE FUNCTION WriteWord(@word nvarchar(20))
RETURNS NVARCHAR(50)
AS

BEGIN
    RETURN @word
END

DECLARE @word nvarchar(20) = 'P135'

SELECT dbo.WriteWord(@word)



CREATE FUNCTION WriteWordsWithTwoParametr(@word nvarchar(20), @source nvarchar(20))
RETURNS NVARCHAR(50)
AS

BEGIN
    RETURN @word + @source
END

SELECT dbo.WriteWordsWithTwoParametr('Ali', 'P135') AS Data



CREATE FUNCTION SumOfNumbers(@num1 INT, @num2 INT)
RETURNS INT
AS

BEGIN
    RETURN @num1 + @num2
END

SELECT dbo.SumOfNumbers(10, 7)



CREATE FUNCTION GetCustomerCount()
RETURNS INT
AS

BEGIN
    DECLARE @count INT
    SELECT @count = COUNT(*) FROM Customers
    RETURN @count
END

SELECT dbo.GetCustomerCount()



CREATE FUNCTION GetCustomerAverageAgeById(@id INT)
RETURNS INT
AS

BEGIN
    DECLARE @avgAge INT
    SELECT @avgAge = AVG(Age) FROM Customers WHERE Id > @id
    RETURN @avgAge
END

SELECT dbo.GetCustomerAverageAgeById(4) AS 'Average Age'




-- Procedure

CREATE PROCEDURE usp_SayHelloWorld
AS

BEGIN
    PRINT 'Hello World'
END

EXEC usp_SayHelloWorld



CREATE PROCEDURE usp_SumOfNums
@num1 INT,
@num2 INT
AS

BEGIN
    PRINT @num1 + @num2
END

EXEC usp_SumOfNums 1, 2