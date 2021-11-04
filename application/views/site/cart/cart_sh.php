<li class="dropdown">
  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <span class="glyphicon glyphicon-shopping-cart"><span class="badge"><?php echo $total_items ?></span></span> Cart<span class="caret"></span></a>
  <ul class="dropdown-menu" style="min-width: 300px;">
    <?php 
    if($total_items > 0)
    { ?>
      <div class="table-responsive" style="min-width: 400px;">
         <table class="table table-hover">
          <thead>
          <tr>
            <th>Image</th>
            <th>Name <span></span></th>
            <th>Quantity</th>
            <th>Price</th>
          </tr>
        </thead>
           <tbody>
              <?php 
              foreach ($carts as $items) {  ?>
                    <tr>
                      <td>  <img style="width: 40px;border-radius: 30%;" src="<?php echo base_url('upload/product/'.$items['image_link']); ?>" alt=""></td>
                      <td><?php echo $items['name']; ?></td>
                      <td><?php echo $items['qty']; ?></td>
                      <td><?php echo number_format($items['subtotal']); ?> VND</td>
                    </tr>
                  <?php }
                  ?>                   
            </tbody>                       
         </table> 
           <a href="<?php echo base_url('cart'); ?>" type="button" class="btn btn-success"> Cart detail </a>
           <a href="<?php echo base_url('cart/del'); ?>" type="button" class="btn btn-danger pull-right"> Delete </a>
      </div>
    <?php }else{ ?>
        <p style="color:red;font-weight: bold;float: right;padding-right: 30px">No product in cart</p>
    <?php  } ?>
  </ul>
</li>