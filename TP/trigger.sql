DROP table if exists users_audit;
CREATE TABLE users_audit (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  changedat DATETIME DEFAULT NULL,
  action VARCHAR(50) DEFAULT NULL
);

## Create a trigger
CREATE TRIGGER before_users_update 
BEFORE UPDATE ON users 
FOR EACH ROW
 INSERT INTO
  users_audit
 SET
  action = 'update',
  username = OLD.username,
  changedat = NOW();

## Tester le trigger
update
  users
set
  username = "toto";
select
  *
from
  users_audit;
