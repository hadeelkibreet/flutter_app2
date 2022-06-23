import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app2/moduls/bmi_app/bmi/bmi_result/bmi_result_screen.dart';


class BmiScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<BmiScreen> {
  bool isMale = true;
  double height=120;
  int weight =40;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child:
        Text('MBI Calculator',style: TextStyle(fontSize: 25.0 ),)),
        backgroundColor: Colors.blue,

      ),

      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        isMale=true;
                      });
                    },
                    child: Container(

                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Image(
                                image: AssetImage('assets/images/MALE.png'),
                            height: 80.0,
                                width: 80.0,
                            ),
                              SizedBox(
                                height: 10.0,),
                              Text('MALE',
                              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,),
                              ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0,),
                        color: isMale? Colors.blue: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                  SizedBox(width: 20.0,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale=false;
                        });
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Image(image:
                              AssetImage('assets/images/Female.png'),
                              height: 80.0,
                                width: 80.0,
                              ),
                              SizedBox(
                                height: 10.0,),
                              Text('FEMALE',
                                style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0,),
                          color: isMale? Colors.grey[400]:Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      Text('HEIGHT',
                        style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.w900,),
                      ),
                      SizedBox(
                      height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children:
                        [
                          Text('${height.round()}',
                            style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,),
                          ),
                          Text('cm',
                            style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,),
                          ),

                        ],
                      ),
                      Slider(
                          value: height ,
                          max: 220.0,
                          min: 120.0,
                          onChanged: (value){
                            setState(() {
                              height=value;
                            });
                          }),
                    ],

                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0,),
                  color: Colors.grey[400],
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(

                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text('WEIGHT',
                              style: TextStyle(fontSize: 29.0,fontWeight: FontWeight.w900,),
                            ),
                           Text('${weight}',
               style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.w900,),
              ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                  heroTag: 'weight-',
                                  mini: true,
                                  child: Icon(
                                    Icons.remove,
                                  ),
                                ),
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    weight++;

                                  });
                                },
                                  heroTag: 'weight+',
                                  mini: true,
                                  child: Icon(
                                    Icons.add,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0,),
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text('AGE',
                              style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w900,),
                            ),
                            Text('${age}',
                              style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.w900,),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                  heroTag: 'age-',
                                  mini: true,
                                  child: Icon(
                                    Icons.remove,
                                  ),
                                ),
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                  heroTag: 'age+',
                                  mini: true,
                                  child: Icon(
                                    Icons.add,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0,),
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.blue,
              height: 56.0,
              child: MaterialButton(onPressed: (){
                double result = weight / pow(height/100, 2);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=> BMIResultScreen(result: result.round(), ismale: isMale, age: age),

                    ),
                );

              },
              child:
                Text('Calculate',
                style: TextStyle(fontSize: 30.0,
                  color: Colors.white,),
                ),
              ),
            ),
          ],
        ),
      ),
     
    );

  }
}
