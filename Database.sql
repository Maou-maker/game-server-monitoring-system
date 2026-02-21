-- Aktifkan foreign key (untuk SQLite)
PRAGMA foreign_keys = ON;

-- =========================
-- TABEL GAME
-- =========================
CREATE TABLE game (
    id_game INTEGER PRIMARY KEY AUTOINCREMENT,
    nama_game TEXT NOT NULL,
    genre TEXT,
    developer TEXT
);

-- =========================
-- TABEL SERVER
-- =========================
CREATE TABLE server (
    id_server INTEGER PRIMARY KEY AUTOINCREMENT,
    id_game INTEGER NOT NULL,
    nama_server TEXT NOT NULL,
    lokasi TEXT,
    status TEXT CHECK(status IN ('Online', 'Offline')) NOT NULL,
    FOREIGN KEY (id_game) REFERENCES game(id_game)
);

-- =========================
-- TABEL ADMIN
-- =========================
CREATE TABLE admin (
    id_admin INTEGER PRIMARY KEY AUTOINCREMENT,
    nama_admin TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    role TEXT
);

-- =========================
-- TABEL PLAYER
-- =========================
CREATE TABLE player (
    id_player INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE NOT NULL,
    email TEXT UNIQUE NOT NULL,
    tanggal_daftar DATE
);

-- =========================
-- TABEL SERVER LOG (Monitoring)
-- =========================
CREATE TABLE server_log (
    id_log INTEGER PRIMARY KEY AUTOINCREMENT,
    id_server INTEGER NOT NULL,
    waktu DATETIME DEFAULT CURRENT_TIMESTAMP,
    cpu_usage REAL,
    ram_usage REAL,
    player_online INTEGER,
    FOREIGN KEY (id_server) REFERENCES server(id_server)
);

-- =========================
-- TABEL MAINTENANCE
-- =========================
CREATE TABLE maintenance (
    id_maintenance INTEGER PRIMARY KEY AUTOINCREMENT,
    id_server INTEGER NOT NULL,
    id_admin INTEGER NOT NULL,
    tanggal DATE,
    deskripsi TEXT,
    status TEXT CHECK(status IN ('Scheduled', 'Completed')) NOT NULL,
    FOREIGN KEY (id_server) REFERENCES server(id_server),
    FOREIGN KEY (id_admin) REFERENCES admin(id_admin)
);