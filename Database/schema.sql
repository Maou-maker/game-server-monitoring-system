DROP TABLE IF EXISTS maintenance;
DROP TABLE IF EXISTS server_log;
DROP TABLE IF EXISTS player;
DROP TABLE IF EXISTS admin;
DROP TABLE IF EXISTS server;
DROP TABLE IF EXISTS game;

CREATE TABLE game (
    id_game INTEGER PRIMARY KEY AUTOINCREMENT,
    nama_game TEXT NOT NULL,
    genre TEXT
);

CREATE TABLE server (
    id_server INTEGER PRIMARY KEY AUTOINCREMENT,
    id_game INTEGER NOT NULL,
    nama_server TEXT NOT NULL,
    ip_address TEXT NOT NULL,
    status TEXT CHECK(status IN ('Online','Offline','Maintenance')) NOT NULL,
    FOREIGN KEY (id_game) REFERENCES game(id_game)
);

CREATE TABLE admin (
    id_admin INTEGER PRIMARY KEY AUTOINCREMENT,
    nama_admin TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

CREATE TABLE player (
    id_player INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE NOT NULL,
    email TEXT UNIQUE NOT NULL,
    tanggal_daftar DATE
);

CREATE TABLE server_log (
    id_log INTEGER PRIMARY KEY AUTOINCREMENT,
    id_server INTEGER NOT NULL,
    waktu DATETIME DEFAULT CURRENT_TIMESTAMP,
    cpu_usage REAL,
    ram_usage REAL,
    player_online INTEGER,
    FOREIGN KEY (id_server) REFERENCES server(id_server)
);

CREATE TABLE maintenance (
    id_maintenance INTEGER PRIMARY KEY AUTOINCREMENT,
    id_server INTEGER NOT NULL,
    id_admin INTEGER NOT NULL,
    tanggal_mulai DATE,
    tanggal_selesai DATE,
    status TEXT CHECK(status IN ('Scheduled','Completed')) NOT NULL,
    FOREIGN KEY (id_server) REFERENCES server(id_server),
    FOREIGN KEY (id_admin) REFERENCES admin(id_admin)
);