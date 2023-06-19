<?php
    if(isset($_SESSION['admin']) && $_SESSION['admin']==1)
    {
?>
<!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

        <form name="frm" method="post" action="">
        <h1>Product Management</h1>
        <p>
        	<img src="images/add.png" alt="Thêm mới" width="16" height="16" border="0" /> <a href="?page=add_product">Add new</a>
        </p>
        <table id="tableproduct" class="table table-striped table-bordered" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th><strong>No.</strong></th>
                    <th><strong>Product ID</strong></th>
                    <th><strong>Product Name</strong></th>
                    <th><strong>Price</strong></th>
                    <th><strong>Quantity</strong></th>
                    <th><strong>Category ID</strong></th>
                    <th><strong>Image</strong></th>
                    <th><strong>Edit</strong></th>
                    <th><strong>Delete</strong></th>
                </tr>
             </thead>

			<tbody>
            <?php
            include_once("Connection.php");
				$No = 1;
                $result = mysqli_query($conn, "SELECT Product_ID, Product_Name, Price, Pro_qty, Pro_image, Cat_Name FROM product a, category b WHERE a.Cat_ID = b.Cat_ID ORDER BY ProDate DESC");

                while($row=mysqli_fetch_array($result, MYSQLI_ASSOC)){
			?>
			<tr>
              <td ><?php echo $No; ?></td>
              <td ><?php echo $row["Product_ID"]; ?></td>
              <td><?php echo $row["Product_Name"]; ?></td>
              <td><?php echo $row["Price"]; ?></td>
              <td ><?php echo $row["Pro_qty"]; ?></td>
              <td><?php echo $row["Cat_Name"]; ?></td>
             <td align='center' class='cotNutChucNang'>
                 <img src='product-imgs/<?php echo $row['Pro_image'] ?>' border='0' width="50" height="50"  /></td>
             <td align='center' class='cotNutChucNang'><img src='images/edit.png' border='0'/></td>
             <td align='center' class='cotNutChucNang'><img src='images/delete.png' border='0' /></td>
            </tr>
            <?php
                $No++;
                }
			?>
			</tbody>
        
        </table>  

 </form>
 <?php
    }
    else
    {
        echo "<script>alert('You are not administrator')</script>";
        echo '<meta http-equiv="refresh" content="0;URL=index.php"/>';
    }
    ?>