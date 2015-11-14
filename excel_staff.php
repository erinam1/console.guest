<?php
require_once 'pointdb.php';
  require_once 'plugins/PHPExcel.php'; // Подключаем библиотеку PHPExcel
  $PHPExcel = new PHPExcel(); // Создаём объект PHPExcel
  
  $PHPExcel->getProperties()->setCreator("ЭнергоМЕТ-СУС");
  $PHPExcel->getProperties()->setLastModifiedBy("ЭнергоМет-СУС");
  $PHPExcel->getProperties()->setTitle("Список сотрудников");
  $PHPExcel->getProperties()->setSubject("Список сотрудников из базы данных");
  $PHPExcel->getProperties()->setDescription("Список сотрудников, допущенных к оборудованию");  
  
  // Каждый раз делаем активной 1-ю страницу и получаем её, потом записываем в неё данные
  $page = $PHPExcel->setActiveSheetIndex(0);
  // Изеняем название активного листа в excel файле.
  $PHPExcel->getActiveSheet()->setTitle('Сотрудники');
  
  $query="SELECT id_staff, concat(staff.second_name,' ',staff.first_name,' ',staff.last_name) AS full_name,company.short_name,staff.begin_date,staff.end_date,staff.status 
  FROM company,staff WHERE company.id_comp=staff.id_comp ORDER BY full_name, company.short_name;";

  $i=0;
  $res=mysql_query($query);
  while($row = mysql_fetch_array($res))
  {
    $i++;
    $y=$i+5;
    $page->setCellValue("A".$y, $i);
    $page->setCellValue("B".$y, $row['full_name']); 
    $page->setCellValue("C".$y, $row['short_name']); 
    $page->setCellValue("D".$y,$row['begin_date']); 
    $page->setCellValue("E".$y,$row['end_date']);
    $page->setCellValue("F".$y,$row['status']);
  }
  $rowCount = $i;
  $colCount = $page->getHighestColumn();
  
  // Устанавливаем авто ширину каждой колонки.
  for($i = 'A'; $i !== $colCount; $i++) 
  {
    $page->getColumnDimension($i)->setAutoSize(TRUE);
  }
  $page->getColumnDimension('A')->setWidth(1);

  // Оформляем заголовок страницы
  $page->setCellValue("A1", "Список сотрудников, имеющих допуск к работе с оборудованием");
  $merge_ar[]="A1:F1"; $page->setMergeCells($merge_ar);
  $today = date("m.d.Y");
  $page->setCellValue("A2", "по состоянию на ".$today." г.");
  $merge_ar[]="A2:F2"; $page->setMergeCells($merge_ar);
  $page->getStyle('A1')->getFont()->setSize(16);
  $page->getStyle('A2')->getFont()->setSize(14);
  $page->getStyle('A1:A2')->getFont()->getColor()->setARGB(PHPExcel_Style_Color::COLOR_DARKBLUE);
  $page->getStyle('A1:A2')->getFont()->setBold(true);
  $page->getStyle('A1:A2')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_TOP)->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
  
  // Оформляем шапку таблицы
  $merge_ar[]="D4:E4"; $page->setMergeCells($merge_ar);
  $page->setCellValue("D4", "Срок полномочий");
  $merge_ar[]="F4:F5"; $page->setMergeCells($merge_ar);
  $page->setCellValue("F4", "Текущий статус");
  $merge_ar[]="A4:A5"; $page->setMergeCells($merge_ar);
  $page->setCellValue("A4", "№ п/п");
  $merge_ar[]="B4:B5"; $page->setMergeCells($merge_ar);
  $page->setCellValue("B4", "Фамилия Имя Отчество");
  $merge_ar[]="C4:C5"; $page->setMergeCells($merge_ar);
  $page->setCellValue("C4", "Предприятие");
  $page->setCellValue("D5", "начало");
  $page->setCellValue("E5", "окончание");
  $page->getStyle('A4:F5')->getFont()->setBold(true);
  $page->getStyle('A4:F5')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER)->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER)->setWrapText(TRUE);

  // рамка и раскрасска
  for($row =1; $row<$rowCount+3; $row++)
  {
    //Set the colors, mid blue/grey for the top and bottom rows, with alternating white and light blue/grey
    if ($row == 1 || $row == 2 || $row == $rowCount+3) $color = 'FFCFDAE7'; 
    else if ($row%2==1) $color = 'FFFFFFFF';
    else $color = 'FFE7EDF5';

    // set the fill type and apply the color
    $page->getStyle('A'.($row+3))->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
    $page->getStyle('A'.($row+3))->getFill()->getStartColor()->setARGB($color);

    $page->getStyle('A'.($row+3))->getBorders()->getTop()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
    $page->getStyle('A'.($row+3))->getBorders()->getBottom()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
    $page->getStyle('A'.($row+3))->getBorders()->getLeft()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);

    //duplicate the first cells style (fill plus the top and bottom borders) across the whole row
    $page->duplicateStyle($page->getStyle('A'.($row+3)), 'B'.($row+3).':F'.($row+3)); //copy style set in first column to the rest of the row

    //Put some borders on the far left and right cells of the row
//    $page->getStyle('A'.($row+3))->getBorders()->getLeft()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
    $page->getStyle('F'.($row+3))->getBorders()->getRight()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
  }

  // Устанавливаем форматирование для таблицы из ранее созданного массива, в данном случае границы таблицы.
  //$page->getStyle('A1:F'.$rowCount)->applyFromArray($styleArray);
 
  // добавление автофильтра
  $page->setAutoFilter('A4:F5');  
  //$page->setAutoFilter('A1:'.$page->getHighestColumn().page->getHighestRow());  


  /* Начинаем готовиться к записи информации в xlsx-файл */
  $objWriter = PHPExcel_IOFactory::createWriter($PHPExcel, 'Excel5');
  /*$objWriter = PHPExcel_IOFactory::createWriter($PHPExcel, 'Excel2007');*/
  /* Записываем в файл */
  $file_name="сотрудники_".$today.".xls";
  $objWriter->save($file_name);
  header("Content-Length: ".filesize($file_name));
  header("Content-Disposition: attachment; filename=".$file_name);
  header("Content-Type: application/x-force-download; name=\"".$file_name."\"");
  ob_clean();
  flush();
  readfile($file_name);
  exit;
?>