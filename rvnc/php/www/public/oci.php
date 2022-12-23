<?php
$data =[];
        $sql="select * from gb_1 where Regcard_id='56cbdebb94f9415895413183cca2e674'and rownum<10";
        $conn = oci_connect('ambase','ambase','10.87.230.223/orcl','UTF8');
        $stid=oci_parse($conn,$sql);
        if($stid){
            $result=oci_execute($stid);
        }
        while (($row = oci_fetch_assoc($stid)) != false) {
            $data[] = $row;
        }
        var_dump($data);
        oci_free_statement($stid);
        oci_close($conn);      
