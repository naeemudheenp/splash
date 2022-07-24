
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'api.dart';
class history extends StatefulWidget {
  const history({Key? key}) : super(key: key);

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
  List<Widget> widgetList=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
                stream: FirebaseFirestore.instance.collection("request").get().asStream(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>  snapshot) {
                  if (snapshot.hasData) {
                    widgetList.clear();
                    snapshot.data?.docs.forEach((element) {
                      widgetList.add(
                        Container(

                          color: Colors.blue,
                          child: Column(
                              children: [
                              const Text("Hello"),
                                Text("Name"+element['userName'],),
                                Text("Mobile"+element['userMobile'],),
                                Text("Address"+element['userAddress'],),
                                Text("Status"+element['status'],)
                          ],
                        ),
                      )
                      );



                    });
                    return(Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child:ListView(children:widgetList)));
                  } else if (snapshot.hasError) {
                    return Icon(Icons.error_outline);
                  } else {
                    return CircularProgressIndicator();
                  }
                })
          ],
        ),
      ) ,
    );
  }
}
