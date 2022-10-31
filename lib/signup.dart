// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase/login.dart';
// import 'package:flutter/material.dart';

// class SignupPage extends StatelessWidget {
//   @override
//   var phone = TextEditingController();
//   var password = TextEditingController();

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
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => LoginPage()),
//               );
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
//                           "Sign up",
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
//                               controller: phone,
//                               keyboardType: TextInputType.number,
//                               decoration: InputDecoration(
//                                   labelText: "phone",
//                                   isDense: true,
//                                   border: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(8)),
//                                   )),
//                             ),
//                           ),
//                           Container(
//                             child: TextFormField(
//                               controller: password,
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
//                             final phoneno = phone.text;
//                             final pass = password.text;
//                             createuser(name: phoneno,pass1:pass);
//                           },
//                           color: Colors.redAccent,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(40)),
//                           child: Text(
//                             "Sign Up",
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

// Future createuser({required String name,pass1}) async {
//   print('1111111111');
//   final docuser = FirebaseFirestore.instance.collection('users').doc(name);

//   final json = {
//     'Phone number': name,
//     'Password':pass1
   
//   };
//   await docuser.set(json);
// }
