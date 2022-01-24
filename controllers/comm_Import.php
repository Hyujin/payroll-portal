<?php
// Load the database configuration file
include_once 'db_conn.php';

function cleanString($string) {
    $string = str_replace(' ', '', $string); // Replaces all spaces with hyphens.
 
    return preg_replace('/[^A-Za-z0-9\-]/', '', $string); // Removes special chars.
 }

if(isset($_POST['importSubmit'])){

    //Prepare and bind statements
    $pay_stmt = $db->prepare("INSERT INTO pay (emp_id, basic_hrs, nds_pay, allow_pay, dispute, spl_pay, reg_pay, prem_pay, ot_pay) VALUES (?,?,?,?,?,?,?,?,?) ");
    $pay_stmt->bind_param("idddddddd", $emp_id, $basic_hrs, $nds, $allow, $dispute, $spl_hol, $reg_hol, $prem_hol, $ot);

    $deductions_stmt = $db->prepare("INSERT INTO deductions(emp_id, sss, phic, pagibig, others, ca, total_deductions) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $deductions_stmt->bind_param("idddddd", $emp_id, $sss, $phic, $pagibig, $others, $ca, $total_deductions);

    $sales_compensation_stmt = $db->prepare("INSERT INTO sales_compensation(emp_id, total_sales, training_days, reg_hol_days, total_num_days, spl_hrs, prem_hrs) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $sales_compensation_stmt->bind_param("idddddd", $emp_id, $total_sales, $training_days, $reg_hol_days, $total_num_days, $spl_hrs, $prem_hrs);
    
    $sales_manhour_stmt = $db->prepare("INSERT INTO sales_manhour(emp_id, training_rate, sales_rate, allow_rate) VALUES (?, ?, ?, ?)");
    $sales_manhour_stmt->bind_param("iddd", $emp_id, $training_rate, $sales_rate, $allow_rate);
    
    
    // Allowed mime types
    $csvMimes = array('text/x-comma-separated-values', 'text/comma-separated-values', 'application/octet-stream', 'application/vnd.ms-excel', 'application/x-csv', 'text/x-csv', 'text/csv', 'application/csv', 'application/excel', 'application/vnd.msexcel', 'text/plain');
    
    // Validate whether selected file is a CSV file
    if(!empty($_FILES['file']['name']) && in_array($_FILES['file']['type'], $csvMimes)){
        
        // If the file is uploaded
        if(is_uploaded_file($_FILES['file']['tmp_name'])){
            
            // Open uploaded CSV file with read-only mode
            $csvFile = fopen($_FILES['file']['tmp_name'], 'r');
            
            // Skip the first line
            fgetcsv($csvFile);
            
            // Parse data from CSV file line by line
            while(($line = fgetcsv($csvFile)) !== FALSE){
                // Get row data
                $fullname                   = $line[0];              
                $role                       = $line[1];
                $training_rate              = $line[2];
                $sales_rate                 = $line[3];
                $allow_rate                 = $line[4];
                $nd_rate                    = $line[5];                    
                $total_sales                = $line[6];
                $training_days              = $line[7];
                $reg_hol_days               = $line[8];
                $total_num_days             = $line[9];
                $spl_hrs                    = $line[10];
                $prem_hrs                   = $line[11]; 
                $sales_pay                  = $line[12];   //pay
                $training                   = $line[13];   //pay
                $allow                      = $line[14];   //pay
                $dispute                    = $line[15];   //pay
                $spl_hol                    = $line[16];   //pay
                $reg_hol                    = $line[17];   //pay
                $prem_hol                   = $line[18];   //pay
                $ot                         = $line[19];   //pay
                $gross                      = $line[20];  //pay
                $sss                        = $line[21];
                $phic                       = $line[22];
                $pagibig                    = $line[23];
                $others                     = $line[24];
                $ca                         = $line[25];
                $total_deductions           = $line[26];
                $net_pay                    = $line[27];


                    // $queryNameExists = $db->query("SELECT id FROM employees WHERE full_name = '" .$fullname. "' ");
                    // var_dump($queryNameExists);
                    $nameExistResult = $db->query("SELECT id FROM employees WHERE full_name = '" .$fullname. "' ");
                    if ($nameExistResult->num_rows > 0) {
                        // output data of each row
                        while($row = $nameExistResult->fetch_assoc()) {
                            $emp_id = "  $row[id] ";
                        }
                        echo "Existing Employee ID:  "; 
                        echo $emp_id; 
                    
                        $pay_stmt->execute();
                        $deductions_stmt->execute();
                        $sales_compensation_stmt->execute();
                        $sales_manhour_stmt->execute();
                    }
                       else {
                        $insertNewNameQuery = "INSERT INTO employees (full_name, role, type) VALUES ('$fullname', '$role', 'comm') ";
                        echo ($insertNewNameQuery);
                        if (mysqli_query($db, $insertNewNameQuery)) {
                            echo "New name inserted successfully";
                            $querySelectName = $db->query("SELECT id FROM employees WHERE full_name = '$fullname'  ");
                            if ($querySelectName->num_rows > 0) {
                                // output data of each row
                                while($row = $querySelectName->fetch_assoc()) {
                                    $emp_id = '"  .$row[id]. "';
                                    $pay_stmt->execute();
                                    $deductions_stmt->execute();
                                    $sales_compensation_stmt->execute();
                                    $sales_manhour_stmt->execute();
                                }
                              }
                        } else {
                            echo "Error: " . $sql . "<br>" . $conn->error;
                          }     
                    }     
        } //end while
            $db->close();
            // Close opened CSV file
            fclose($csvFile);
            
            $qstring = '?status=succ';
        }else{
            $qstring = '?status=err';
        }
    }else{
        $qstring = '?status=invalid_file';
    }
}

// Redirect to the listing page
//header("Location: ../view/import-disabled.php".$string);