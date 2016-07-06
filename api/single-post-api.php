<?php include('connection.php')?>
<?php
$post_id = $_REQUEST['post_id'];
$sql = "SELECT * FROM posts WHERE id = $post_id";
$result = mysqli_query($conn,$sql);
$post_details = mysqli_fetch_assoc($result);
//echo "<pre/>";print_r($post_details);

$sql = "UPDATE posts SET view_counter = view_counter+1 WHERE id = $post_id";
mysqli_query($conn,$sql);

echo json_encode($post_details);
?>

