<?php include('../header.php'); ?>
<?php
$post_id = $_REQUEST['post_id'];
$sql = "SELECT * FROM posts WHERE id = $post_id";
$result = mysqli_query($conn,$sql);
$post_details = mysqli_fetch_assoc($result);
//echo "<pre/>";print_r($post_details);

$sql = "UPDATE posts SET view_counter = view_counter+1 WHERE id = $post_id";
mysqli_query($conn,$sql);

/*popular posts*/
$popularPostLimit = 3;
$sql ="SELECT * FROM posts ORDER BY view_counter DESC LIMIT $popularPostLimit";
$popularPosts = mysqli_query($conn,$sql);
?>
<div class="layout-content">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
				<div class="post-details-outer">
					<div class="view-post-title">
						<h1><?php echo $post_details['post_title']; ?></h1>
						<dl class="post-info-list">
							<dd><?php echo $post_details['post_date']; ?></dd>
							<dd><?php echo $post_details['comment_count']; ?> Comment</dd>
						</dl>
					</div>
					<div class="post-view custom-post-view">
						<div class="post-entry post-entry-with-image">
							<div class="featured-image">
								<img alt="<?php echo $post_details['post_title']; ?>" src="<?php echo $post_details['post_pic_url']?>" />
							</div>
							<div class="post-desc-text">
								<p><?php echo $post_details['post_content']; ?></p>
							</div>
						</div>
					</div>
					
					<div class="join-discussion-form">
						<h2>Join Discussion</h2>
						<p>Your email address will not be published. All fields are Required.</p>
						<form class="form-horizontal" role="form" action="" method="post" id="discussion-form">
							<input type="hidden" value="<?php echo $post_details['id']; ?>" name="post_id"/>
							<div class="form-group">
								<div class="col-sm-12 col-md-8">
									<input type="text" class="form-control" name="author_name" placeholder="Enter Your Name" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12 col-md-8">
									<input type="text" class="form-control" name="author_email" placeholder="Enter your email" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12">
									<textarea placeholder="Enter Message" name="author_msg" rows="5" class="form-control"></textarea>
								</div>
							</div>
							<div class="form-group">        
							  <div class="col-sm-12">
								<button type="submit" class="btn btn-block btn-lg">Submit</button>
							  </div>
							</div>
						</form>
					</div>
				</div>
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
<?php include('../footer.php'); ?>

<script>
jQuery(document).ready(function(){
	jQuery('#discussion-form').submit(function(event){
		 var discussionData = jQuery(this).serializeArray();
		//alert('Hello');
		jQuery.ajax({
			url		:	'comment-submit.php',
			method	: 	'POST',
			data	: 	discussionData,
			dataType: 	'json',
			success:function(data) {
				jQuery('<h4>'+data.msg+'</h4>').insertAfter('.join-discussion-form p');
			}
		});
		event.preventDefault();
	});
});
</script>
