<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
		<li class="active">Order</li>
	</ol>
</div><!--/.row-->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-info">
			<div class="panel-heading">
			<div class="col-md-8">Order management</div>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr class="info">										
								<th class="text-center">STT</th>
								<th>User fullname</th>
								<th>Order date</th>
								<th>Phone number</th>
								<th>Price</th>
								<th>Status</th>		
								<th>Action</th>
							</tr>
						</thead>
						<tbody>

							<?php 
								$stt = 0;
							foreach ($transaction as $value) { 
								$stt = $stt + 1;
								?>
								<tr>
									<td style="vertical-align: middle;text-align: center;"><strong><?php echo $stt; ?></strong></td>
									<td><strong><?php echo $value->user_name; ?></strong></td>
									<td><strong><?php echo mdate('%H:%i:%s %d/%m/%Y',$value->created); ?></strong></td>
									<td><strong><?php echo $value->user_phone; ?></strong></td>
									<td><strong><?php echo number_format($value->amount); ?></strong> VND</td>
									<td>
										<?php switch ($value->status) {
											case '0':
												echo "<p style='color:red'>Đang chờ </p>";
												break;
											case '1':
												echo "<p style='color:green'>Đã xác nhận</p>";
												break;
											default:
												echo 'Đang chờ';
												break;
										} ?>
									</td>
									<td class="list_td aligncenter">
							            <a href="<?php echo admin_url('transaction/detail/'.$value->id); ?>" title="Detail"><span class="glyphicon glyphicon-list-alt"></span></a>&nbsp;&nbsp;&nbsp;
							            <a href="<?php echo admin_url('transaction/del/'.$value->id); ?>" title="Delete"> <span class="glyphicon glyphicon-remove" onclick=" return confirm('Are you sure to delete?')"></span> </a>
								    </td>    
				                </tr>
							<?php } ?>

			    		</tbody>

					</table>

					   <?php echo $this->pagination->create_links(); ?>
					
					
				</div>
			</div>
		</div>
	</div>
</div><!--/.row-->
