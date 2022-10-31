// import 'package:firebase/signup.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class LoginPage extends StatelessWidget {
//   @override
//   var phone_no = TextEditingController();
//   var password_1 = TextEditingController();

//   Future login() async {
//     await FirebaseAuth.instance.signInWithEmailAndPassword(email: phone_no.text, password: password_1.text);
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         brightness: Brightness.light,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//             onPressed: () {
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(builder: (context) => SignupPage()),
//               // );
//             },
//             icon: Icon(
//               Icons.arrow_back_ios,
//               size: 20,
//               color: Colors.black,
//             )),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             height: MediaQuery.of(context).size.height,
//             width: double.infinity,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Text(
//                           "Login",
//                           style: TextStyle(
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         SizedBox(
//                           height: 30,
//                         )
//                       ],
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 40),
//                       child: Column(
//                         children: [
//                           Container(
//                             child: TextFormField(
//                               controller: phone_no,
//                               decoration: InputDecoration(
//                                   labelText: "email",
//                                   isDense: true,
//                                   border: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(8)),
//                                   )),
//                             ),
//                           ),
//                           Container(
//                             child: TextFormField(
//                               controller: password_1,
//                               decoration: InputDecoration(
//                                   labelText: "password",
//                                   isDense: true,
//                                   border: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(8)),
//                                   )),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 40),
//                       child: Container(
//                         padding: EdgeInsets.only(top: 3, left: 3),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(40),
//                             border: Border(
//                                 bottom: BorderSide(color: Colors.black),
//                                 top: BorderSide(color: Colors.black),
//                                 right: BorderSide(color: Colors.black),
//                                 left: BorderSide(color: Colors.black))),
//                         child: MaterialButton(
//                           minWidth: double.infinity,
//                           height: 60,
//                           onPressed: () {
//                            print(password_1.text);
//                            print(phone_no.text);
//                             login();
//                             // createuser(name: phoneno, pass1: pass);
//                           },
//                           color: Colors.redAccent,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(40)),
//                           child: Text(
//                             "login",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text("Already have an account? "),
//                         TextButton(
//                           onPressed: () {
//                             LoginPage();
//                           },
//                           child: Text(
//                             "Login",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w600, fontSize: 18),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


















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
    sheet.showGridlines = false;

    // Enable calculation for worksheet.
    sheet.enableSheetCalculations();


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