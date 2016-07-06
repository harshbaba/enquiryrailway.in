<?php include('../header.php'); ?>
<?php
	$page = 1;
	$postPerPage = 3;
	$offset = 0;
	$paginationEnabled = 0;
	$popularPostLimit = 3;
	
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
	//echo $pagination;
	if($pagination > $postPerPage){
		$paginationEnabled = 1;
		$j = 1;
		for($i=0; $j<=$pagination;$i++){
			$paginationList[$i] = $i+1;
			$j = $j+$postPerPage;
		}
	}
	
	$sql ="SELECT * FROM posts WHERE post_status='public' ORDER BY post_date DESC LIMIT $postPerPage OFFSET $offset";
	$posts = mysqli_query($conn, $sql);
	
	/*popular posts*/
	$sql ="SELECT * FROM posts ORDER BY view_counter DESC LIMIT $popularPostLimit";
	$popularPosts = mysqli_query($conn,$sql);
	
?>
<div class="layout-content">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
				<div class="post-list-outer">
					<ul class="post-list">
						<?php $i=0; while($post = mysqli_fetch_assoc($posts)):  ?>
							<?php //echo "<pre/>"; print_r($post); ?>
							<li class="item">
								<div class="post-list-item">
									<h2>
										<a title="<?php echo $post['post_title']; ?>" href="<?php echo $post['guid']; ?>" ><?php echo $post['post_title']; ?></a>
									</h2>

									<dl class="post-info-list">
										<dd><?php echo $post['post_date']; ?></dd>
										<dd><?php echo $post['comment_count']; ?> Comment</dd>
									</dl>
									<div class="post-entry entry post-entry-with-image">
                                        <div class="featured-image">
											<a title="<?php echo $post['post_title']; ?>" href="<?php echo $post['guid']; ?>"><img alt="<?php echo $post['post_pic_url']; ?>" src="<?php echo $post['post_pic_url']; ?>" /></a>
										</div>
                           
										<div class="post-desc-text">
											<p><?php echo $post['post_excerpt']; ?></p>
										</div>
										<div class="excerpt-read-more">
											<a title="<?php echo "Read More"; ?>" href="<?php echo $post['guid']; ?>" class="blue-btn-small"><?php echo "Read More"; ?></a>
										</div>
									</div>
								</div>
							</li>
						<?php $i++; endwhile;?>
					</ul>
				</div>
				
				<?php if($paginationEnabled): ?>
					<ul class="pagination">
						<?php foreach($paginationList as $paginationNav): ?>
						  <li><a href="<?php echo 'http://localhost/phpapache/blog/?page='.$paginationNav; ?>"><?php echo $paginationNav; ?></a></li>
						<?php endforeach; ?>
					</ul>
				<?php endif; ?>
			</div>
			
			<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				<div class="wp-sidebar">
					<div class="block block-blog block-blog-search">
						<div class="block-content">
							<form id="blog-search-form" action="" method="get">
								<div class="blog-search">
									<input type="text" placeholder="Search Post" value="" title="Beiträge duchsuchen" class="input-text" name="s">
									<button type="submit" title="Suchen" class="button"><span class="fa fa-search"></span></button>
								</div>
							</form>
						</div>
					</div>
					
					<div class="block block-blog block-recent-posts">
						<div class="block-title">
							<strong><span>Popular Posts</span></strong>
						</div>
						<div class="block-content">
							<ul class="sidebar-post-list">
								<?php while($popularPost = mysqli_fetch_assoc($popularPosts)): ?>
									<li class="item">
										<h3>
											<a href="<?php echo $popularPost['guid']; ?>" title="<?php echo $popularPost['post_title']; ?>">
												<?php echo $popularPost['post_title']; ?>
											</a>
										</h3>
										<dl class="sidebar-post-infolist">                                            
											<dt><?php echo $popularPost['post_date'];  ?></dt>
										</dl>
										<div class="sidebar-featured-image">
											<a title="<?php echo $popularPost['post_title']; ?>" href="<?php echo $popularPost['guid']; ?>">
												<img alt="<?php echo $popularPost['post_title']; ?>" src="<?php echo $popularPost['post_pic_url']; ?>" />
											</a>
										</div>
										<!--<div class="sidebar-post-desc">
											<p><?php //echo substr($popularPost['post_excerpt'],0,175); ?></p>
										</div>-->
									</li>
								<?php endwhile; ?>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php //echo json_encode($faqarray); ?>
<?php include('../footer.php'); ?>
