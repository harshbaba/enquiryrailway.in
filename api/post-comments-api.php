<?php include('connection.php')?>
<?php
$post_id = $_REQUEST['post_id'];
$sql = "SELECT * FROM comments WHERE comment_post_id = $post_id";
$results = mysqli_query($conn,$sql);

?>
<?php 
	$comments = '';
	$i = 0;
	while($comment = mysqli_fetch_assoc($results)){
		$comments[$i] = $comment;
		$i++;
	}
?>

<?php
if($i == 0){
	$commentsList['commentList'] = 0;
}
else{
	$commentsList['commentList'] = 1;
	$commentsList['comments'] = $comments;	
}

echo json_encode($commentsList);
?>

