<?php
include "config/database.php";

$data = mysqli_query($conn, "SELECT * FROM server");
?>

<!DOCTYPE html>
<html>
<head>
<title>Data Server</title>
<link rel="stylesheet" href="assets/style.css">
</head>

<body>

<h1>Data Server</h1>

<table border="1">
<tr>
<th>ID</th>
<th>Nama Server</th>
<th>Lokasi</th>
<th>Status</th>
</tr>

<?php
while($row = mysqli_fetch_assoc($data)){
?>
<tr>
<td><?php echo $row['id_server']; ?></td>
<td><?php echo $row['nama_server']; ?></td>
<td><?php echo $row['lokasi']; ?></td>
<td><?php echo $row['status']; ?></td>
</tr>
<?php } ?>

</table>

<br>
<a href="index.php">Kembali</a>

</body>
</html>