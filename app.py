from flask import Flask, render_template_string
import sqlite3

app = Flask(__name__)

HTML = """
<!DOCTYPE html>
<html>
<head>
    <title>Game Server Monitor</title>
</head>
<body>
    <h1>Daftar Server</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nama Server</th>
            <th>IP</th>
            <th>Status</th>
        </tr>
        {% for server in servers %}
        <tr>
            <td>{{ server[0] }}</td>
            <td>{{ server[1] }}</td>
            <td>{{ server[2] }}</td>
            <td>{{ server[3] }}</td>
        </tr>
        {% endfor %}
    </table>
</body>
</html>
"""

@app.route("/")
def home():
    conn = sqlite3.connect("Game_server.db")
    cursor = conn.cursor()
    cursor.execute("SELECT id_server, nama_server, ip_address, status FROM server")
    servers = cursor.fetchall()
    conn.close()
    return render_template_string(HTML, servers=servers)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)