from flask import Flask, render_template
from Database.db import get_connection

app = Flask(__name__)   # WAJIB ADA SEBELUM @app.route

@app.route("/")
def index():
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute("""
        SELECT s.id_server, s.nama_server, g.nama_game, 
               s.ip_address, s.status
        FROM server s
        JOIN game g ON s.id_game = g.id_game
    """)

    servers = cursor.fetchall()
    conn.close()

    return render_template("index.html", servers=servers)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)