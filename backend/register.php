<?php

header("Access-Control-Allow-Origin: http://localhost:8100");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: POST, GET, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Origin, Authorization, X-Requested-With, x-xsrf-token");
header("Content-Type: application/json; charset=utf-8");

include "config.php";

$input = json_decode(file_get_contents('php://input'),true);

if($input['aski'] == 'process_regis'){
    $password = md5($input['pass']);
    $username =$input['user'];
    $gender = $input['u_gender'];
    $num= $input['num'];
    $fname= $input['firstname'];
    $mname= $input['middlename'];
    $lname= $input['lastname'];
    $brgy= $input['barangay'];
    $account = "User";

//Insert Data on Account Table

$stmt =$mysqli->prepare("INSERT INTO `account`(`Username`, `Password`, `Account_Type`) VALUES (?,?,?)");
$stmt2 =$mysqli->prepare("INSERT INTO `user_info` VALUES ( (SELECT MAX(Account_ID) FROM account),?,?,?,?,?,(SELECT Barangay_ID FROM barangay WHERE Barangay_Name = ?))");

$stmt->bind_param("sss",$username,$password,$account);
$stmt2->bind_param("ssssss",$fname,$mname,$lname,$gender,$num,$brgy);


$stmt->execute();
$stmt2->execute();



if($stmt){
   $result = json_encode(array('success' =>true,'msg' => 'Successfully Registered'));
}else{
    $result = json_encode(array('success' =>false,'msg' => 'Registration Failed'));
}

echo $result;
}elseif($input['aski'] == 'login'){
    $password = md5($input['pass']);
    $username =$input['user'];
    $sql = mysqli_query($mysqli,"SELECT Account_ID,Account_Type FROM account WHERE username = '$username' AND password = '$password'");
    $result = mysqli_fetch_assoc($sql);
    $a_id = $result['Account_ID'];
    $a_type = $result['Account_Type'];
    if($result['Account_Type'] != ""){
        $message = json_encode(array('success' =>true,'msg' => 'Successfully Login' ));
     }else{
         $message = json_encode(array('success' =>false,'msg' => 'Username or Password is Wrong'));
     }
     echo $message;
}

?>