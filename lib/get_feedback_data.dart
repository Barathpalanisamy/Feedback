import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'excel.dart';
import 'main_page.dart';

class GetCustomerDetails extends StatefulWidget {
  final String documentId;
  
  GetCustomerDetails({required this.documentId});

  @override
  State<GetCustomerDetails> createState() => _GetCustomerDetailsState();
}

class _GetCustomerDetailsState extends State<GetCustomerDetails> {
  @override
  Widget build(BuildContext context){
    CollectionReference details = FirebaseFirestore.instance.collection('feedback');
    return FutureBuilder<DocumentSnapshot>(

      future: details.doc(widget.documentId).get(),
      builder: ((context, snapshot){

        if (snapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          ID.add({"Name":'${data['Name']}',"Feedback":'${data['Feedback']}',"Mobile Number":'${data['Mobile Number']}',"Address":'${data['Address']}'
          });
        }
      return CreateExcelWidget();

      }),
    
      );
    
  }


  
}