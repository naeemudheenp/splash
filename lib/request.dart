import 'package:flutter/material.dart';

import 'api.dart';
class request extends StatefulWidget {


  @override
  State<request> createState() => _requestState();
}

class _requestState extends State<request> {
  TextEditingController editorName=TextEditingController();
  TextEditingController editorMobile=TextEditingController();
  TextEditingController editorAddress=TextEditingController();
  api common = api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash"),
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: editorName,
              decoration: InputDecoration(hintText: "Name"),
            ),
            TextFormField(
              controller: editorMobile,
              decoration: InputDecoration(hintText: "Mobile"),
            ),
            TextFormField(
              controller: editorAddress,
              decoration: InputDecoration(hintText: "Address"),
            ),
            ElevatedButton(onPressed: (){
              deliveryRequest();
            }, child:const Text("Send Delivery request") )
          ],
        ),
      ),
    );
  }
  void deliveryRequest()async{

    //Please check data and proceed. please check whether the entered data is fine or not.

    final data = {"userName": editorName.text.toString(), "userMobile":editorMobile.text.toString(),"userAddress":editorAddress.text.toString(),"status":"Waiting for approval" };
    bool firebaseRequest=await common.sentFirebase(data,"request");

    if(firebaseRequest){
      print("Data sent."); // please add prompt dialogue here. please remove these print after adding prompt as this will proceed to production
    }else{
      print("Data Unable To Sent."); // please add prompt dialogue here
    }
  }
}
