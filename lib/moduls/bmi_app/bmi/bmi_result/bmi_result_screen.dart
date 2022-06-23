import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  final int result;
  final bool ismale;
  final int age;
  BMIResultScreen({
    required this.result,
    required this.ismale,
    required this.age,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left) ,
        ),
        title: Text('Result'),
      ),
      body:
     Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text('Gender : ${ismale? 'Male':'Female'}',
             style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w500),
           ),
           Text('Result : ${result}',
             style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w500),
           ),
           Text('Age : ${age}',
             style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w500),
           ),
         ],
       ),
     ),


    );
  }
}
