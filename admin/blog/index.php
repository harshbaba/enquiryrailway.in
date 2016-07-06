<?php include('../header.php'); ?>
	<div class="layout-content">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-md-12 col-sm-12- col-lg-12 text-center content-main">
					<h2>Insert Post</h2>
					<form class="form-horizontal" role="form" action="post-submit.php" method="post" enctype="multipart/form-data">
						<div class="form-group">
						  <label class="control-label col-sm-2">Title</label>
						  <div class="col-sm-10">
							<input type="text" class="form-control" name="title" placeholder="Enter Post Title"/>
						  </div>
						</div>
						<div class="form-group">
						  <label class="control-label col-sm-2">Excerpt</label>
						  <div class="col-sm-10">
							<input type="text" class="form-control" name="excerpt" placeholder="Enter Post Excert"/>
						  </div>
						</div>
						<div class="form-group">
						  <label class="control-label col-sm-2">Content</label>
						  <div class="col-sm-10">          
							<textarea class="form-control" rows="5" name="content" placeholder="Enter content"></textarea>
						  </div>
						</div>
						<div class="form-group">
						  <label class="control-label col-sm-2">Image</label>
						  <div class="col-sm-10">          
							<input type="file" class="" name="pic" id="pic" placeholder="Upload File" />
						  </div>
						</div>
						<div class="form-group">        
						  <div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-block btn-lg">Submit</button>
						  </div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<?php include('../footer.php'); ?>

