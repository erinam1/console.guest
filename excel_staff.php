<?php
require_once 'pointdb.php';
  require_once 'plugins/PHPExcel.php'; // Подключаем библиотеку PHPExcel
  $phpexcel = new PHPExcel(); // Создаём объект PHPExcel
  /* Каждый раз делаем активной 1-ю страницу и получаем её, потом записываем в неё данные */
  $page = $phpexcel->setActiveSheetIndex(0); // Делаем активной первую страницу и получаем её
  $query="SELECT id_staff, concat(staff.second_name,' ',staff.first_name,' ',staff.last_name) AS full_name,company.short_name,staff.begin_date,staff.end_date,staff.status 
  FROM company,staff WHERE company.id_comp=staff.id_comp ORDER BY full_name;";
  $i=0;
  $res=mysql_query($query);
  while($row = mysql_fetch_array($res))
{
  $i++;
  $page->setCellValue("A".$i, $row['full_name']); // Добавляем в ячейку A1 слово "Hello"
  $page->setCellValue("B".$i, $row['short_name']); // Добавляем в ячейку B1 слово "tradebenefit.ru"  
  $page->setCellValue("C".$i,$row['begin_date']); // А в ячейку B2 слова "MyFirstPage"
   $page->setCellValue("D".$i,$row['end_date']);
    $page->setCellValue("E".$i,$row['status']);
    }  
  $page->setTitle("Сотрудники"); // Заголовок делаем "Example"
  /* Начинаем готовиться к записи информации в xlsx-файл */
  $objWriter = PHPExcel_IOFactory::createWriter($phpexcel, 'Excel2007');
  /* Записываем в файл */
  $objWriter->save("staff.xlsx");
?>