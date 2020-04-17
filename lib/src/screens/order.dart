import 'package:business_manger/main.dart';
import 'package:business_manger/src/dataModel/Data.dart';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Order extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OrderState();
  }
}

class OrderState extends State<Order> {
/*
  List<Data> allData=[];
  @override
  void initState() {

     DatabaseReference ref=FirebaseDatabase.instance.reference();
     ref.child('Customers').once().then((DataSnapshot snap){
          var keys=snap.value.key;
          var data=snap.value;

          for(var key in keys){
            Data d=new Data(
           data[key]['Ahmed']
            );
            allData.add(d);
          }


          setState(() {
            print(allData.length);
          });
       });

  }


 */

  final GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  var selectedName;
  var selectedCustomerName;
  //List<String> names = <String>['Esraa', 'Abdo', 'Mohamed', 'Eslam'];

  @override
  Widget build(context) {
    return Container(
      width: 40.0,
      height: 40.0,
      child: Form(

        child: new Column(
            children:customerName(),

        //  child: Column(
       // children: customerName()
        /* productName();
             productQuantity();
             productPrice();
             total();
             submitButon();
             Container(EdgeInsets.all(20));*/
      //  ,
    //  ),

    ),

    )
    );
  }

  List<Widget>  customerName()  {
    List<DropdownMenuItem> customers =[];
      /* new Row(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Customer Name : ',
              style: TextStyle(
                color: Colors.blue,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          new Padding(
            padding: EdgeInsets.all(20),
            child: new DropdownButton(
              items: allData
                  .map((value) => DropdownMenuItem(
                        child: Text(
                          value.toString(),
                          style: TextStyle(color: Colors.brown,
                          backgroundColor: Colors.amber),
                        ),
                value: value.toString(),
                      )).toList(),
                onChanged: (selectedCustomerName) {
                setState(() {
                  selectedName = selectedCustomerName;
                });
              },
              key: formkey,
              value: selectedName,
              hint: Text('choose Customer Name',
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
              isExpanded: false,
            ),
          ),
        ],
      ),

      */



      StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection("Customers").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData){
             return new Text("loading");}
            else

              for (int i = 0; i < snapshot.data.documents.length; i++) {
                DocumentSnapshot snap =  snapshot.data.documents[i];
                customers.add(
                  DropdownMenuItem(
                    child: Text(
                      snap.documentID,
                      style: TextStyle(color: Colors.deepOrange),
                    ),
                    value: "${snap.documentID}",
                  ),
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.list,
                    size: 25.0,
                    color: Colors.deepPurple,
                  ),
                  DropdownButton(
                    items: customers,
                    onChanged: (selectedCustomer) {
                      final snackBar = SnackBar(
                        content: Text(
                          'Selected Currency value is $selectedCustomer',
                          style: TextStyle(color: Color(0xff11b719)),
                        ),
                      );
                      Scaffold.of(context).showSnackBar(snackBar);

                      setState(() {
                        selectedCustomerName = selectedCustomer;
                      });
                    },
                    value: selectedCustomerName,
                    isExpanded: false,
                    hint: new Text(
                        "pick customer name"
                    ),
                  )
                ],

              );

          }
          );


  }


/*
  List<Widget> productName() {
    return <Widget>[
      new Row(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Name : ',
              style: TextStyle(
                color: Colors.blue,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          new Padding(
            padding: EdgeInsets.all(20),
            child: new DropdownButton(
              items: allData
                  .map((value) => DropdownMenuItem(
                child: Text(
                  value.toString(),
                  style: TextStyle(color: Colors.brown,
                      backgroundColor: Colors.amber),
                ),
                value: value.toString(),
              )).toList(),
              onChanged: (selectedCustomerName) {
                setState(() {
                   selectedCustomer = selectedCustomerName;
                });
              },

              key: formkey,
              value: selectedName,
              hint: Text('choose Customer Name',
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
              isExpanded: false,
            ),
          ),
        ],
      ),
    ];
  }


 */

}
