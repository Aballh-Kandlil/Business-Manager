import 'package:business_manger/main.dart';
import 'package:business_manger/src/dataModel/Data.dart';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Order extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OrderState();
  }
}

class OrderState extends State<Order> {


  final GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  var selectedName;
  var selectedCustomerName;
  var fuck="fuck";

  //List<String> names = <String>['Esraa', 'Abdo', 'Mohamed', 'Eslam'];

  @override
  Widget build(context) {
    List<DropdownMenuItem> customers = [];
    return Container(
      child: Form(
        child: Container(
          child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection("Customers/").snapshots(),
              builder: (context, snapshot) {
               // return Text(snapshot.data.toString());
                if (!snapshot.hasData) {
                  return Text("loading..");
                } else {
                  for (int i = 0; i < snapshot.data.documents.length; i++) {
                    DocumentSnapshot snap = snapshot.data.documents[i];
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
                        items: customers!=null?customers:null,
                        onChanged: (selectedCustomer) {
                          print(selectedCustomer);
                          final snackBar = SnackBar(
                            content: Text(
                              'Selected Customer value is $selectedCustomer',
                              style: TextStyle(color: Color(0xff11b719)),
                            ),
                          );
                          Scaffold.of(context).showSnackBar(snackBar);

                          setState(() {
                            print( customers.length );
                            selectedCustomerName = selectedCustomer;
                          });
                          print(selectedCustomer + " is selected cust");
                        },

                       // if(selectedCustomerName==null)
                        //  {value: fuck,}
                      //  else{value: selectedCustomerName,}
                        value: selectedCustomerName ==null? fuck : selectedCustomerName,


                        isExpanded: false,
                        hint: Text("pick customer name"),

                      )

                    ],
                  );
                   }
              }),
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
      ),
    );
  }

}
