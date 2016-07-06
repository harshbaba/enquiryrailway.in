<?php include('connection.php')?>
<?php
$popularPostLimit = 3;
/*popular posts*/
	$sql ="SELECT * FROM posts ORDER BY view_counter DESC LIMIT $popularPostLimit";
	$popularPosts = mysqli_query($conn,$sql);
	
?>

<?php 
	$i = 0;
	while($popularPost = mysqli_fetch_assoc($popularPosts)){
		$popular_Posts[$i] = $popularPost;
		$i++;
	}
?>

<?php 
	$popularPostList['popular_posts'] = $popular_Posts;
	echo json_encode($popularPostList);
?>