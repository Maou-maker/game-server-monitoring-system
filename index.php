<?php
include "config/database.php";

$server_online = mysqli_query($conn, "SELECT COUNT(*) as total FROM server WHERE status='ONLINE'");
$game_total = mysqli_query($conn, "SELECT COUNT(*) as total FROM game");
$item_total = mysqli_query($conn, "SELECT COUNT(*) as total FROM shop_item");

$s1 = mysqli_fetch_assoc($server_online);
$s2 = mysqli_fetch_assoc($game_total);
$s3 = mysqli_fetch_assoc($item_total);
?>

<!DOCTYPE html>
<html>
<head>
<title>Game Server Monitoring</title>
<link rel="stylesheet" href="assets/style.css">
</head>

<body>

<h1>Sistem Monitoring Server Game Online</h1>

<div class="dashboard">

<div class="card">
<img src="assets/server.png" width="80">
<h2>Server Online</h2>
<p><?php echo $s1['total']; ?></p>
</div>

<div class="card">
<img src="assets/game.png" width="80">
<h2>Total Game</h2>
<p><?php echo $s2['total']; ?></p>
</div>

<div class="card">
<img src="assets/shop.png" width="80">
<h2>Item Shop</h2>
<p><?php echo $s3['total']; ?></p>
</div>

</div>

<br>

<a href="server.php">Kelola Server</a> |
<a href="game.php">Data Game</a> |
<a href="shop.php">Shop Item</a>

</body>
</html>