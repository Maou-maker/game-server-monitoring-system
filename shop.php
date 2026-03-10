<?php
include "config/database.php";

$data = mysqli_query($conn, "
SELECT shop_item.*, game.nama_game
FROM shop_item
JOIN game ON shop_item.game_id = game.id_game
");
?>

<!DOCTYPE html>
<html>
<head>
<title>Shop Item</title>
<link rel="stylesheet" href="assets/style.css">
</head>

<body>

<h1>Shop Item Game</h1>

<table border="1">

<tr>
<th>ID</th>
<th>Nama Item</th>
<th>Game</th>
<th>Harga</th>
</tr>

<?php
while($row = mysqli_fetch_assoc($data)){
?>

<tr>
<td><?php echo $row['id_item']; ?></td>
<td><?php echo $row['nama_item']; ?></td>
<td><?php echo $row['nama_game']; ?></td>
<td><?php echo $row['harga']; ?></td>
</tr>

<?php } ?>

</table>

<br>
<a href="index.php">Kembali</a>

</body>
</html>