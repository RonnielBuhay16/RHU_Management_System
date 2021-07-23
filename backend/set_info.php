<?php


include "config.php";

    $sql = mysqli_query($mysqli,"SELECT MAX(TB_Record_ID) FROM tb_cases");
    $result = mysqli_fetch_assoc($sql);
    $r_id = $result['MAX(TB_Record_ID)'];
    $r_id++;
    $fname= "Juan";
    $mname= "Aquino";
    $lname= "Dela Cruz";
    $bhw_id= 22;
    $gender = "Male";
    $dots = "TRUE";
    $age= 30;
    date_default_timezone_set("Asia/Singapore");
    $current_date = date("d/m/Y");
    $stmt= $mysqli->prepare("INSERT INTO tb_cases VALUES(?,?,?,?,(SELECT Barangay_ID FROM bhw_staff WHERE Account_ID = ?),?,?,?,?)");
    $stmt->bind_param("isssissis",$r_id,$fname,$mname,$lname,$bhw_id,$gender,$age,$dots,$current_date);
    $stmt->execute();


?>