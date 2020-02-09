/* ------------------------------ LIST OF FIXED DATABASE ROLES----------------------------------------
Fixed-Database role name
Description
db_owner
Members of the db_owner fixed database role can perform all configuration and maintenance activities on the database, and can also drop the database in SQL Server. (In SQL Database and SQL Data Warehouse, some maintenance activities require server-level permissions and cannot be performed by db_owners.)
db_securityadmin
Members of the db_securityadmin fixed database role can modify role membership and manage permissions. Adding principals to this role could enable unintended privilege escalation.
db_accessadmin
Members of the db_accessadmin fixed database role can add or remove access to the database for Windows logins, Windows groups, and SQL Server logins.
db_backupoperator
Members of the db_backupoperator fixed database role can back up the database.
db_ddladmin
Members of the db_ddladmin fixed database role can run any Data Definition Language (DDL) command in a database.
db_datawriter
Members of the db_datawriter fixed database role can add, delete, or change data in all user tables.
db_datareader
Members of the db_datareader fixed database role can read all data from all user tables.
db_denydatawriter
Members of the db_denydatawriter fixed database role cannot add, modify, or delete any data in the user tables within a database.
db_denydatareader
Members of the db_denydatareader fixed database role cannot read any data in the user tables within a database.
*/


--CREATE USER [Umar]
--	WITH DEFAULT_SCHEMA = dbo
--GO

--GRANT CONNECT TO [Umar]
--GO

--ALTER ROLE db_datareader ADD MEMBER [Umar]
--GO

--ALTER ROLE db_datawriter ADD MEMBER [Umar]
--GO
----TO REMOVE BELOW PERMISSION WHEN ALL SET UP
--ALTER ROLE db_ddladmin ADD MEMBER [Umar]
--GO

--GRANT EXECUTE ON SCHEMA :: dbo TO [Umar]
--GO

--CREATE USER [John]
--	WITH DEFAULT_SCHEMA = dbo
--GO

--GRANT CONNECT TO [John]
--GO

--ALTER ROLE db_datareader ADD MEMBER [John]
--GO

--ALTER ROLE db_datawriter ADD MEMBER [John]
--GO
----TO REMOVE BELOW PERMISSION WHEN ALL SET UP
--ALTER ROLE db_ddladmin ADD MEMBER [John]
--GO

--GRANT EXECUTE ON SCHEMA :: dbo TO [John]
--GO
