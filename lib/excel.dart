
import 'dart:io';
import 'dart:convert';
import 'package:firebase/main_page.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column;
//Local imports
// import 'helper/save_file_mobile.dart'
//     if (dart.library.html) 'helper/save_file_web.dart';


/// Represents the XlsIO widget class.
class CreateExcelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CreateExcelStatefulWidget(title: 'Create Excel document'),
    );
  }
}

/// Represents the XlsIO stateful widget class.
class CreateExcelStatefulWidget extends StatefulWidget {
  /// Initalize the instance of the [CreateExcelStatefulWidget] class.
  const CreateExcelStatefulWidget({Key? key, required this.title})
      : super(key: key);

  /// title.
  final String title;
  @override
  // ignore: library_private_types_in_public_api
  _CreateExcelState createState() => _CreateExcelState();
}

class _CreateExcelState extends State<CreateExcelStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.lightBlue,
                disabledForegroundColor: Colors.grey,
              ),
              onPressed:(){generateExcel();
              print('aaaaaaaaaaaaaaaaaaa');} ,
            
              child: const Text('Generate Excel'),
            )
          ],
        ),
      ),
    );
  }
  List aa=[];

  Future<void> generateExcel() async {
    //Create a Excel document.
print('2343');
print(ID);
    //Creating a workbook.
    final Workbook workbook = Workbook();
    //Accessing via index
    final Worksheet sheet = workbook.worksheets[0];
    sheet.showGridlines = true;

    // Enable calculation for worksheet.
    sheet.enableSheetCalculations();
     sheet.getRangeByName('A1:B1').columnWidth = 15;
    sheet.getRangeByName('C1').columnWidth = 10;
    sheet.getRangeByName('D1').columnWidth = 25;


    sheet.getRangeByName('A1').setText('Name');
    sheet.getRangeByName('A1').cellStyle.bold = true;


    sheet.getRangeByName('B1').setText('Mobile Number');
    sheet.getRangeByName('B1').cellStyle.bold = true;

    sheet.getRangeByName('C1').setText('FeedBack');
    sheet.getRangeByName('C1').cellStyle.bold = true;

    sheet
        .getRangeByName('D1')
        .setText('Address');
    sheet.getRangeByName('D1').cellStyle.bold = true;

aa=ID;
 for( var i =0 ; i < aa.length; i++ ) { 
  print(ID[i]['Name'].runtimeType);
    sheet.getRangeByName('A${i+3}').setText(aa[i]['Name']);


    sheet.getRangeByName('B${i+3}').setText(aa[i]['Mobile Number']);


    sheet.getRangeByName('C${i+3}').setText(aa[i]['Feedback']);


    sheet.getRangeByName('D${i+3}').setText(aa[i]['Address']);

   } 




 
    //Save and launch the excel.
    final  bytes = workbook.saveAsStream();
    //Dispose the document.
    workbook.dispose();

    String dir;
    String pdf_name;
    String path;
    File filepath;
    dir = (await getApplicationDocumentsDirectory()).path;
    path = '$dir/${"test"}.xlsx';
    filepath = File(path);
    await filepath.writeAsBytes(bytes);
    await OpenFile.open(path);
  }
  
}

  //  await OpenFile.open("bytes");