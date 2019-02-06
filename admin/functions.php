<?php
function users_online() {
    if(isset($_GET['onlineusers'])) {
        global $connection;
        if(!$connection) {
            session_start();
            include("../includes/db.php");

            $session = session_id();
            $time = time();
            $time_out_in_seconds = 05;
            $time_out = $time - $time_out_in_seconds;

            $query = "SELECT * FROM users_online WHERE session = '$session'";
            $send_query = mysqli_query($connection, $query);
            $count = mysqli_num_rows($send_query);

            if($count == NULL) {
                mysqli_query($connection, "INSERT INTO users_online(session, time) VALUES('$session','$time')");
            } else {
                mysqli_query($connection, "UPDATE users_online SET time = '$time' WHERE session = '$session'");
            }
            $users_online_query =  mysqli_query($connection, "SELECT * FROM users_online WHERE time > '$time_out'");
            echo $count_user = mysqli_num_rows($users_online_query);
        }
    } // get request isset()
}




//function users_online1() {
//    global $connection;
//    $session = session_id();
//    $time = time();
//    $time_out_in_seconds = 05;
//    $time_out = $time - $time_out_in_seconds;
//    $query = "SELECT * FROM users_online WHERE session = '$session'";
//    $send_query = mysqli_query($connection, $query);
//    $count = mysqli_num_rows($send_query);
//
//    if($count == NULL) {
//        mysqli_query($connection, "INSERT INTO users_online(session, time) VALUES('$session','$time')");
//    } else {
//        mysqli_query($connection, "UPDATE users_online SET time = '$time' WHERE session = '$session'");
//    }
//    $users_online_query =  mysqli_query($connection, "SELECT * FROM users_online WHERE time > '$time_out'");
//    echo $count_user = mysqli_num_rows($users_online_query);
//    }



users_online();
function confirm($result){
    global $connection;
    if(!$result){
        die("QUERY FAILED ".mysqli_error($connection));
    }
}

function insert_categories(){
    global $connection;
    if(isset($_POST['submit'])){
        $cat_title = $_POST['cat_title'];
        if($cat_title == "" || empty($cat_title)){
            echo "This field should not be empty";
        }else{
            $stmt = mysqli_prepare($connection,"INSERT INTO categories(cat_title) VALUES(?)");
            mysqli_stmt_bind_param($stmt,'s',$cat_title);
            mysqli_stmt_execute($stmt);
            confirm($stmt);
        }
    }
    mysqli_stmt_close($stmt);
}

function findAllCategories(){
    global $connection;
    $query ="SELECT * FROM categories";
    $select_categories_sidebar = mysqli_query($connection,$query);
    while($row = mysqli_fetch_assoc($select_categories_sidebar)){
        $cat_id = $row['cat_id'];
        $cat_title = $row['cat_title'];
        echo "<tr>";
        echo "<td>{$cat_id}</td>";
        echo "<td>{$cat_title}</td>";
        echo "<td><a href='categories.php?delete={$cat_id}'>Delete</a></td>";
        echo "<td><a href='categories.php?edit={$cat_id}'>Edit</a></td>";
        echo "</tr>";
    }
}

function deleteCategory(){
    global $connection;
    if(isset($_GET['delete'])){
        $the_cat_id = $_GET['delete'];
        $query = "DELETE FROM categories WHERE cat_id = {$the_cat_id}";
        $delete = mysqli_query($connection, $query);
        header("Location: categories.php");
    }
}

function recordPosts($table){
    global $connection;
    $query = "SELECT * FROM ".$table."";
    $result = mysqli_query($connection,$query);
    $result1 = mysqli_num_rows($result);
    confirm($result1);
    return $result1;
    
}
//Selecting from table where column have specific status or user role

function checkStatus($table,$column,$status){
    global $connection;
    $query = "SELECT * FROM $table WHERE $column = '$status'";
    $result = mysqli_query($connection,$query);
    return mysqli_num_rows($result);
}

function is_admin($username){
    global $connection;
    $query = "SELECT user_role FROM users WHERE username = '$username'";
    $result = mysqli_query($connection,$query);
    confirm($result);
    $row = mysqli_fetch_array($result);
    if($row['user_role'] == 'admin'){
        return true;
    }else{
        return false;
    }
}

function username_exists($username){
    global $connection;
    $query = "SELECT username FROM users WHERE username = '$username'";
    $result = mysqli_query($connection,$query);
    confirm($result);
    if(mysqli_num_rows($result) > 0){
        return true;
    }else{
        return false;
    }
}

function email_exists($email){
    global $connection;
    $query = "SELECT user_email FROM users WHERE user_email = '$email'";
    $result = mysqli_query($connection,$query);
    confirm($result);
    if(mysqli_num_rows($result) > 0){
        return true;
    }else{
        return false;
    }
}

function redirect($location){
    header("Location: ".$location);
    exit;
}

function register_user($username,$email,$password){
    global $connection;
    
    
    if(username_exists($username)){
        //ZAVRSITI IMPLEMENTACIJU ZA USERNAME I EMAIL   
    }
    
        
    $username = mysqli_real_escape_string($connection,$username);
    $email    = mysqli_real_escape_string($connection,$email);
    $password = mysqli_real_escape_string($connection,$password);
    
    $password = password_hash($password,PASSWORD_BCRYPT,array('cost' => 12));
        
    $query1 = "INSERT INTO users (username,user_email,user_password,user_role) ";
    $query1 .= "VALUES('{$username}','{$email}','{$password}','subscriber')";
    $register_user_query = mysqli_query($connection,$query1);
    confirm($register_user_query);
    
}
function login_user($username,$password){
    global $connection;
    $username = trim($username);
    $password = trim($password);
    $username = mysqli_real_escape_string($connection,$username);
    $password = mysqli_real_escape_string($connection,$password);
    
    $query = "SELECT * FROM users WHERE username = '{$username}' ";
    $result = mysqli_query($connection,$query);
    confirm($result);
    
    while($row = mysqli_fetch_array($result)){
        $db_user_id = $row['user_id'];
        $db_username = $row['username'];
        $db_user_password = $row['user_password'];
        $db_user_firstname = $row['user_firstname'];
        $db_user_lastname = $row['user_lastname'];
        $db_user_role = $row['user_role'];
        
        if(password_verify($password,$db_user_password)){
            $_SESSION['username'] = $db_username;
            $_SESSION['firstname'] = $db_user_firstname;
            $_SESSION['lastname'] = $db_user_lastname;
            $_SESSION['user_role'] = $db_user_role;    
            redirect("/cms/admin");
        }else{
            return false;   
        }
        return true;
  
    }
}

function ifItIsMethod($method=null){
    if($_SERVER['REQUEST_METHOD'] == strtoupper($method)){
        return true;
    }
    return false;
}

function isLoggedIn(){
    if(isset($_SESSION['user_role'])){
        return true;
    }
    return false;
}

function checkIfUserIsLoggedInAndRedirect($redirectLocation){
    if(isLoggedIn()){
        redirect($redirectLocation);
    }
}

function currentUser(){
    if(isset($_SESSION['username'])){
        return $_SESSION['username'];
    }
    return false;
}

function imagePlaceholder($image = null){
    if(!$image){
        return 'image_4.jpg';
    }else{
        return $image;
    }
}





?>