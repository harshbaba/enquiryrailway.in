<?php include('connection.php'); ?>
<?php
	$data = array();
	// Getting posted data and decodeing json
	$_POST = json_decode(file_get_contents('php://input'), true);
	
	//die(print_r($data));
	$post_id 		=	$_POST['id'];
	$author_name 	= 	$_POST['author_name'];
	$author_email	= 	$_POST['author_email'];
	$author_msg 	= 	$_POST['author_msg'];
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