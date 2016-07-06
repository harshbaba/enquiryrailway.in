<?php include('../connection.php'); ?>
<?php
	//get form data
	$data = $_REQUEST;
	//die(print_r($data));
	$post_id 		= 	$data['post_id'];
	$author_name 	= 	$data['author_name'];
	$author_email	= 	$data['author_email'];
	$author_msg 	= 	$data['author_msg'];
	$comment_date  	= 	date("Y-m-d H:i:s");
?>
<?php
	if(!$conn){
		die("Connection Failed: ". mysqli_connect_error());
	}
	$sql = "INSERT INTO comments (comment_post_id,comment_author,comment_author_email,comment_msg,comment_date) VALUES ('$post_id','$author_name','$author_email','$author_msg','$comment_date')";
	
	if (mysqli_query($conn, $sql)) {
		$response['status'] = 	'pass';
		$response['msg']	=	'Your Comment has submitted sucessfully';
	} else {
		//echo "Error updating record: " . $conn->error;
		$response['status'] = 	'fail';
		$response['msg']	=	'OOPS, Something went worong';
	}
	
	echo json_encode($response);
?>