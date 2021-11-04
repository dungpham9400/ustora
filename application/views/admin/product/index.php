<script type="text/javascript">
	$(document).ready(function(){
		$('.remove').click(function(){
			var container = $(this).parent().parent();
			var id = $(this).attr('id');
			var string = 'id='+id;
			$.ajax({
				url:'<?php echo admin_url('product/del'); ?>',
				type:'post',
				data: string,
				success: function(success){
					container.slideUp('slow',function(){
						container.remove();
					})
				}
			});
		});
});
</script>
<script type="text/javascript" >
	$(document).ready(function(){
	  $('#submit-del').click(function(){
	        
			$.ajax({
				url:'<?php echo admin_url('product/del'); ?>',
				type:'post',
				data: string,
				success: function(success){
					container.slideUp('slow',function(){
						container.remove();
					})
				}
			});
	  });
	});
	</script>
<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
		<li class="active">Product</li>
	</ol>
</div><!--/.row-->
<h3><span id="message"></span></h3>
<div class="row">
	<div class="col-lg-12">
	<form action="" method="post" >
		<div class="panel panel-info">
			<div class="panel-heading">
			<div class="col-md-8">Product management</div>
			<div class="col-md-4 text-right"><a href="<?php echo admin_url('product/add'); ?>" class='btn btn-info'><svg class="glyph stroked plus sign"><use xlink:href="#stroked-plus-sign"/></svg> Add new product </a></div>
			</div>
			<div class="panel-body">
				
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr class="info">
									<th></th>
									<th class="text-center">ID</th>
									<th>Product name</th>
									<th>Category</th>
									<th>Price</th>		
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<?php foreach ($product as $value) { ?>
									<tr>
										<td style="vertical-align: middle"><input type="checkbox" name="checkbox[]" value="<?php echo $value->id; ?>"  /></td>
										<td style="vertical-align: middle;text-align: center;"><strong><?php echo $value->id; ?></strong></td>
										<td><img src="<?php echo base_url(); ?>upload/product/<?php echo $value->image_link; ?>" alt="" style="width: 50px;float:left;margin-right: 10px;"><strong><?php echo $value->name; ?></strong>
										<p style="font-size: 12px;margin-top: 4px;">View: <?php echo $value->view; ?> <span> | Sold :<?php echo $value->buyed; ?></span></p>
										</td>
										<td style="vertical-align: middle"><strong ><?php echo $value->namecatalog; ?></strong></td>
										<td style="vertical-align: middle">
											<?php if($value->discount > 0){
													$price_new = $value->price - $value->discount;
													?>
													<strong><?php echo number_format($price_new); ?> VND</strong><br><del><?php echo number_format($value->price); ?> VNĐ</del>

												<?php }else{ ?>
													<strong><?php echo number_format($value->price); ?> VND</strong>
												<?php } ?>
										</td>
										<td class="list_td aligncenter">
								            <a href="<?php echo admin_url('product/edit/'.$value->id); ?>" title="Edit"><span class="glyphicon glyphicon-edit"></span></a>&nbsp;&nbsp;&nbsp;
								            <a id="<?php echo $value->id; ?>" title="Delete" class="remove" onclick=" return confirm('Are you sure to delete?')"> <span class="glyphicon glyphicon-remove" ></span> </a>
									    </td>    
					                </tr>
								<?php } ?>

				    		</tbody>

						</table>
						<button class="btn btn-info" id="submit-del" style="float: left" onclick="return confirm('Bạn chắc chắn muốn xóa')">Xóa</button>
						
						<?php echo $this->pagination->create_links(); ?>
						
						
					</div>
				
			</div>
		</div>
	</form>
	</div>

</div><!--/.row-->
