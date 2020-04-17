import 'package:flutter/material.dart';
import '../src/screens/order.dart';

class App extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      title: 'HomePage',
      home: Scaffold(
        appBar: AppBar(title: Text('Business manager'),),

        body:Center(child: Order(),) ,
      ),
    );
  }
}
