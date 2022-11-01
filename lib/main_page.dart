import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_feedback/emoji_feedback.dart';
import 'excel.dart';
import 'get_feedback_data.dart';

class feedback extends StatefulWidget {

  @override
  State<feedback> createState() => _feedbackState();
}
final CollectionReference _details = FirebaseFirestore.instance.collection('feedback');
    var cus_name = TextEditingController();
    var cus_number = TextEditingController();
    var cus_address = TextEditingController();
    final Customer_Mandatory_formKey = GlobalKey<FormState>();
    var feedback_index;
    var customer_name;
    var customer_address;
    var customer_mobile_number;
  List ID=[];
class _feedbackState extends State<feedback> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Feedback Form')),
      ),
      body:SingleChildScrollView(child: Container(
        padding: EdgeInsets.only(top: 48.0,right:18.0, left: 18.0),
        child: Form(
          key: Customer_Mandatory_formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height:45),
              TextFormField(
                controller: cus_name,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  
                  labelText: 'Name',
                ),
                onChanged: (name){
                  customer_name = name;
                },
                validator: (value) {
                  if (value!.trim().isEmpty ) {
                    return "Please Type Name";
                  }
                  else {
                    return null;
                  }
                }
              ),
              SizedBox(height:15),
              TextFormField( 
                controller: cus_number,
                obscureText: false,
                maxLength: 10,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mobile Number',
                ),
                onChanged: (mobile_number){
                  customer_mobile_number = mobile_number;
                },
                validator: (value) {
                  if (value!.trim().isEmpty ) {
                    return "Please Type Mobile Number";
                  }
                  else {
                    if(value!.length < 10){
                      return "Mobile Number is Not Valid";
                    }
                    else{
                      return null;
                    }         
                  }
                }
              ),
              SizedBox(height:5),
              TextFormField(
                controller: cus_address,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                ),
                onChanged: (address){
                  customer_address = address;
                },
              ),
              SizedBox(height:25),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'How was the help you recieved?',

                ),
              ),
              SizedBox(height:25),
              EmojiFeedback(
                onChange: (index) {
                  feedback_index = index+1;
                },
              ),
              SizedBox(height:35),
              ElevatedButton(
              onPressed: () {
                if (Customer_Mandatory_formKey.currentState!.validate()){
                    print(customer_name);
                    print(customer_mobile_number);
                    print(customer_address);
                    print(feedback_index);
                    if (feedback_index == null){
                      feedback_index = 3;
                    }
                    _details.add({"Name":customer_name,"Address":customer_address,"Mobile Number":customer_mobile_number,"Feedback":feedback_index});
                    customer_address = "";
                    cus_name.clear();
                    cus_number.clear();
                    cus_address.clear();
                } 
                
              },
              child: const Text('Submit'),
            ),
            ElevatedButton(
              onPressed: () {
                ID=[];
                getDocIds();
              },
              child: const Text('View Feedback'),
            ),

                ElevatedButton(
              onPressed: () {
             Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  CreateExcelWidget()),
                      );
              },
              child: const Text('excel'),
            ),
          ],
        ),
      ),
    )));
  }
  var docIDs = [];
  Future getDocIds() async {
                  await FirebaseFirestore.instance.collection('feedback').get().then(
                    (snapshot) => snapshot.docs.forEach(
                      (document) { 
                        // print(document.reference.id);
                        docIDs.add(document.reference.id);
                        
                        print(docIDs);
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  GetCustomerDetails(documentId: document.reference.id)),
                      );
                      }));
                      
                }
}