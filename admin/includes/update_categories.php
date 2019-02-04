<form action="" method="post">
    <div class="form-group">
        <label for="cat-title">Edit Category</label>
        <?php 
            if(isset($_GET['edit'])){
                $cat_id = $_GET['edit'];
                $query = "SELECT * FROM categories WHERE cat_id = '$cat_id' ";
                $select_categories_edit = mysqli_query($connection,$query);
                while($row = mysqli_fetch_assoc($select_categories_edit)){
                $cat_id = $row['cat_id'];
                $cat_title = $row['cat_title'];                  
        ?>
        <input value="<?php echo $cat_title; ?>" type="text" class="form-control" name="cat_title">
        <?php
            }}                                    
        ?>
        <?php                             
            if(isset($_POST['update_category'])){
                $cat_id_update = $_POST['cat_title'];
                $stmt = mysqli_prepare($connection, "UPDATE categories SET cat_title = ? WHERE cat_id=?");
                //$query = "UPDATE categories SET cat_title = '{$cat_id_update}' WHERE cat_id = {$cat_id}";
                mysqli_stmt_bind_param($stmt, 'si', $cat_id_update, $cat_id);
                mysqli_stmt_execute($stmt);
                confirm($stmt);
                redirect("categories.php");
                mysqli_stmt_close($stmt);
                
            }                                       
        ?>                                    
    </div>
    <div class="form-group">
        <input class="btn btn-primary" type="submit" name="update_category" value="Update Category">
    </div>
</form>