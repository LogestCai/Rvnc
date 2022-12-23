<?php

$config   = ['path' => './'];
$excel    = new \Vtiful\Kernel\Excel($config);

// 导出测试文件
//$filePath = $excel->fileName('test.xlsx')
  //  ->header(['Item', 'Cost'])
    //->output();

// 读取测试文件
//$data = $excel->openFile('test.xlsx')
//    ->openSheet()
//    ->getSheetData();
//
//var_dump($data); // [['Item', 'Cost']]

// 读取测试文件
$excel->openFile('test.xlsx')
    ->openSheet()
    ->setSkipRows(1);

// 此处判断请使用【!==】运算符进行判断；
// 如果使用【!=】进行判断，出现空行时，返回空数组，将导致读取中断；
while (($row = $excel->nextRow()) !== NULL) {
    var_dump($row);
}
