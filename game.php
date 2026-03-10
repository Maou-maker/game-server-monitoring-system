<?php
include "config/database.php";

$data = mysqli_query($conn, "SELECT * FROM game");
?>

<!DOCTYPE html>
<html>
<head>
<title>Data Game</title>
<link rel="stylesheet" href="assets/style.css">
</head>

<body>

<h1>Data Game</h1>

<table border="1">

<tr>
<th>ID</th>
<th>Nama Game</th>
<th>Genre</th>
<th>Developer</th>
</tr>

<?php
while($row = mysqli_fetch_assoc($data)){
?>

<tr>
<td><?php echo $row['id_game']; ?></td>
<td><?php echo $row['nama_game']; ?></td>
<td><?php echo $row['genre']; ?></td>
<td><?php echo $row['developer']; ?></td>
</tr>

<?php } ?>

</table>

<br>
<a href="index.php">Kembali</a>

</body>
</html>