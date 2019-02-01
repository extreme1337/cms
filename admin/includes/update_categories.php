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
        <input value="<?php if(!isset($cat_title)){echo $cat_title;} ?>" type="text" class="form-control" name="cat_title">
        <?php
            }}                                    
        ?>
        <?php                             
            if(isset($_POST['update_category'])){
                $cat_id_update = $_POST['cat_title'];
                $query = "UPDATE categories SET cat_title = '{$cat_id_update}' WHERE cat_id = {$cat_id}";
                $result_update = mysqli_query($connection,$query);
                if(!$result_update){
                    die("QUERY FAILED" . mysqli_error($connection));
                }
            }                                       
        ?>                                    
    </div>
    <div class="form-group">
        <input class="btn btn-primary" type="submit" name="update_category" value="Update Category">
    </div>
</form>