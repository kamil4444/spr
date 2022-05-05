<!DOCTYPE html>
<html>
<body>

<?php
$date = new DateTime('now'); 
echo "Autor : Kamil Rytel, Port : 80, Data uruchomienia : ";
echo $date->format('Y-m-d H:i:s');
echo "<br />Your IP address is ".$_SERVER['REMOTE_ADDR']."<br />";
$zone = date_default_timezone_get();
echo $zone;
$date1 = date_create($date->format('Y-m-d H:i:s'), timezone_open($zone));
echo "<br />" . date_format($date1, 'Y-m-d H:i:s') . "\n";
?>

</body>
</html>
