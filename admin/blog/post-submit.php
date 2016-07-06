<?php include('../header.php'); ?>
<?php

$title 		= 	$_REQUEST['title'];
$excerpt 	= 	$_REQUEST['excerpt'];
$content 	= 	$_REQUEST['content'];
$pic 		= 	$_FILES['pic'];
//die(print_r($pic));
$pic		= 	$base_url.'/uploads/'.$pic['name'];
$post_date  = 	date("Y-m-d H:i:s");
$post_status  	= 'public';
$post_modified  = date("Y-m-d H:i:s");
$guid 			= ' ';
$comment_count  = 0;

/*for file upload*/
$target_dir = $_SERVER['DOCUMENT_ROOT'].'/enquiryrailway.in/uploads/';
//$target_dir = $base_url.'/uploads/';
$target_file = $target_dir . basename($_FILES["pic"]["name"]);
$uploadOk = 1;
$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
	// Check if image file is a actual image or fake image

    $check = getimagesize($_FILES["pic"]["tmp_name"]);
    if($check !== false) {
        //echo "File is an image - " . $check["mime"] . ".";
			
			//check file formats
			// Allow certain file formats
			if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
			&& $imageFileType != "gif" ) {
				echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
				$uploadOk = 0;
			}else{
				$uploadOk = 1;	
			}
			
			
    } else {
        echo "File is not an image.";
        $uploadOk = 0;
    }
	
	// Check if $uploadOk is set to 0 by an error
	if ($uploadOk == 1) {
		// if everything is ok, try to upload file
		if (move_uploaded_file($_FILES["pic"]["tmp_name"], $target_file)) {
			//echo "The file ". basename( $_FILES["pic"]["name"]). " has been uploaded.";
			$uploadOk = 1;
		} else {
			//echo "Sorry, there was an error uploading your file.";
			$uploadOk = 0;
		}
	} 
		
	


	if(!$conn){
		die("Connection Failed: ". mysqli_connect_error());
	}
	$sql = "INSERT INTO posts (post_date,post_title,post_pic_url,post_excerpt,post_content,post_status,post_modified,guid,comment_count) VALUES ('$post_date','$title','$pic','$excerpt','$content','$post_status','$post_modified','$guid','$comment_count')";
		 
	if ($uploadOk == 1) {
		if (mysqli_query($conn, $sql)) {
			$lastInsertId =  mysqli_insert_id($conn);
			
			$guid  = $base_url."/#/blog/post/".$lastInsertId."";
			$sql = "UPDATE `posts` SET `guid` = '".$guid."' WHERE `id` = '".$lastInsertId."'";
			
			//die();
			if (mysqli_query($conn, $sql)) {
			//echo "Record updated successfully";
			} else {
			echo "Error updating record: " . $conn->error;
			}
			$msg = "New record created successfully";
		}
		else {
			$msg =  "Error: " . $sql . "<br>" . mysqli_error($conn);
		}
	}else{
		echo "Something Went Wrong";
	}
	mysqli_close($conn);
	
?>
<div class="layout-content">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-md-12 col-sm-12- col-lg-12 text-center content-main">
				<h2 class="msg"><?php echo $msg; ?></h2>
				<?php // header('Location: ' . $_SERVER['HTTP_REFERER']); ?>
				<a href="<?php echo $_SERVER['HTTP_REFERER']; ?>" class="btn btn-primary">Back</a>
			</div>
		</div>
	</div>
</div>
<?php include('../footer.php'); ?>