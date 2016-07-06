<?php include('../connection.php')?>
<?php
	$page = 1;
	$postPerPage = 3;
	$offset = 0;
	$paginationEnabled = 0;
	
	if(isset($_REQUEST['page'])){
		$page = $_REQUEST['page'];
	}
	//echo $page;
	
	//set offset
	if($page > 1){
		$page = $page-1;
		$offset = $page*$postPerPage;
	}
	
	$paginationQuery ="SELECT * FROM posts WHERE post_status='public'";
	$paginationResult = mysqli_query($conn, $paginationQuery);
	$pagination = mysqli_num_rows($paginationResult);
	$paginationList['pagination_enabled'] = 0;
	//echo $pagination;
	if($pagination > $postPerPage){
		$paginationEnabled = 1;
		$paginationList['pagination_enabled'] = 1;
		$j = 1;
		for($i=0; $j<=$pagination;$i++){
			$paginationList['pagination_count'][$i] = $i+1;
			$j = $j+$postPerPage;
		}
	}
	
	$sql ="SELECT * FROM posts WHERE post_status='public' ORDER BY post_date DESC LIMIT $postPerPage OFFSET $offset";
	$posts = mysqli_query($conn, $sql);
?>

<?php
	
	$i = 0;
	while($post = mysqli_fetch_assoc($posts)){
		$postarray[$i] = $post;
		$i++;	
	}	
?>
<?php //echo json_encode($postarray);
	//print_r($paginationList);
	//die();
	$postDetails['posts'] = $postarray;
	$postDetails['pagination'] = $paginationList;
	echo json_encode($postDetails);
?>

