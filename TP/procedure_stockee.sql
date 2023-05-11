DELIMITER && 
CREATE PROCEDURE GetAllUsers(IN idd INT, OUT tuple VARCHAR (250)) BEGIN
SELECT
  username INTO tuple
FROM
  users
WHERE
  id = idd;
END && 

DELIMITER;
call GetAllUsers(1, @uname);
select
  @uname;
