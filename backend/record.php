<?php

header("Access-Control-Allow-Origin: http://localhost:8100");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: POST, GET, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Origin, Authorization, X-Requested-With, x-xsrf-token");
header("Content-Type: application/json; charset=utf-8");

include "config.php";

$input = json_decode(file_get_contents('php://input'),true);

if($input['aski'] == 'TB'){
   #Get Record_ID
    $sql = mysqli_query($mysqli,"SELECT MAX(TB_Record_ID) FROM tb_cases");
    $result = mysqli_fetch_assoc($sql);
    $r_id = $result['MAX(TB_Record_ID)'];
    $r_id++;
   #Set Info

   date_default_timezone_set("Asia/Singapore");
    $fname= $input['firstname'];
    $mname= $input['middlename'];
    $lname= $input['lastname'];
    $bhw_id= $input['bhw_id'];
    $gender = $input['gender'];
    $dots =$input['dots'];
    $age= $input['age'];
    $current_date = date("d/m/Y");

    $stmt= $mysqli->prepare("INSERT INTO tb_cases VALUES(?,?,?,?,(SELECT Barangay_ID FROM bhw_staff WHERE Account_ID = ?),?,?,?,?)");
    $stmt->bind_param("isssissis",$r_id,$fname,$mname,$lname,$bhw_id,$gender,$age,$dots,$current_date);
    $stmt->execute();

    if($stmt){
        $result = json_encode(array('success' =>true,'msg' => 'Record Added'));
     }else{
         $result = json_encode(array('success' =>false,'msg' => 'Failed'));
     }
     echo $result;
}//TB_CASES

elseif($input['aski'] == 'DENGUE'){
    #Get Record_ID
     $sql = mysqli_query($mysqli,"SELECT MAX(D_RECORD_ID) FROM dengue_cases");
     $result = mysqli_fetch_assoc($sql);
     $r_id = $result['MAX(D_RECORD_ID)'];
     $r_id++;
    #Set Info
 
    date_default_timezone_set("Asia/Singapore");
     $fname= $input['firstname'];
     $mname= $input['middlename'];
     $lname= $input['lastname'];
     $bhw_id= $input['bhw_id'];
     $gender = $input['gender'];
     $host =$input['host'];
     $age= $input['age'];
     $current_date = date("d/m/Y");
 
     $stmt= $mysqli->prepare("INSERT INTO dengue_cases VALUES(?,?,?,?,(SELECT Barangay_ID FROM bhw_staff WHERE Account_ID = ?),?,?,?,?)");
     $stmt->bind_param("isssisiss",$r_id,$fname,$mname,$lname,$bhw_id,$gender,$age,$host,$current_date);
     $stmt->execute();
 
     if($stmt){
         $result = json_encode(array('success' =>true,'msg' => 'Record Added'));
      }else{
          $result = json_encode(array('success' =>false,'msg' => 'Failed'));
      }
      echo $result;
 }//Dengue Cases
?>