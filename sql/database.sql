CREATE TABLE server (
    id_server INT AUTO_INCREMENT PRIMARY KEY,
    nama_server VARCHAR(100),
    lokasi VARCHAR(100),
    status ENUM('ONLINE','OFFLINE','MAINTENANCE')
);


CREATE TABLE game (
    id_game INT AUTO_INCREMENT PRIMARY KEY,
    nama_game VARCHAR(100),
    genre VARCHAR(50),
    developer VARCHAR(100)
);


CREATE TABLE deploy_game (
    id_deploy INT AUTO_INCREMENT PRIMARY KEY,
    id_server INT,
    id_game INT,
    tanggal_deploy DATE,
    FOREIGN KEY (id_server) REFERENCES server(id_server),
    FOREIGN KEY (id_game) REFERENCES game(id_game)
);


CREATE TABLE shop_item (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    nama_item VARCHAR(100),
    harga INT,
    game_id INT,
    FOREIGN KEY (game_id) REFERENCES game(id_game)
);