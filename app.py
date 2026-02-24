from flask import Flask, render_template
from db import get_connection

app = Flask(__name__)

@app.route("/")
def index():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT id_server, nama_server, ip_address, status FROM server")
    servers = cursor.fetchall()
    conn.close()
    return render_template("index.html", servers=servers)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)