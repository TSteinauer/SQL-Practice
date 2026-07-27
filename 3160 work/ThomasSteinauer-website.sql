CREATE DATABASE IF NOT EXISTS my_web_db;
CREATE TABLE IF NOT EXISTS users (
    user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email_address VARCHAR(100) NULL,
    first_name VARCHAR(45) NULL,
    last_name VARCHAR(45) NULL
)  ENGINE=INNODB;
CREATE TABLE IF NOT EXISTS products (
	product_id  INT  PRIMARY KEY  AUTO_INCREMENT,
    product_name  VARCHAR(45) NULL
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS downloads (

  download_id   INT  PRIMARY KEY AUTO_INCREMENT,
  user_id      INT NULL,
  download_date DATETIME NULL,
  filename      VARCHAR(50),
  product_id    INT NULL,

  CONSTRAINT fk_downloads_users
  FOREIGN KEY (user_id) REFERENCES users (user_id),

  CONSTRAINT fk_downloads_products
  FOREIGN KEY (product_id) REFERENCES products (product_id)
) ENGINE = InnoDB;
-- was giving me 1062 error-- 
INSERT INTO users VALUES (null, 'saraa.riazi@gmail.com', 'Sara', 'Riazi');

INSERT INTO users VALUES (null, 'johnsmith@gmail.com', 'John', 'Smith');

INSERT INTO users (email_address,first_name,last_name) 
VALUES ('janedoe@yahoo.com', 'Jane', 'Doe');
INSERT INTO users (email_address,first_name,last_name) 
VALUES ('jackbown@msn.com', 'Jack', NULL);

INSERT INTO products (product_id, product_name) VALUES (null, 'Local Music Vol. 1');
INSERT INTO products (product_id, product_name) VALUES (null, 'Local Music Vol. 2');

INSERT INTO downloads VALUES (null, 1, NOW(), 'pedals_are_falling.mp3', 1),
 (NULL, 2, NOW(), 'turn_signal.mp3', 1),
 (NULL, 2, NOW(), 'one_horse_town.mp3', 2);
 
 update users set email_address = 'john.smith@yahoo.com' where user_id = 2;
 -- DELETE FROM users WHERE user_id=1; --
 delete from downloads where user_id = 1;
