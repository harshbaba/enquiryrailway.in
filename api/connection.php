<?php
$conn = mysqli_connect("localhost","root","","enquiryrailway.in");
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

?>