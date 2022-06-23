// ignore: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        leading: Icon(
          Icons.menu,
        ),
        title: Text('First App'),
        actions: [
          IconButton(onPressed: one, icon:  Icon(Icons.notification_important)),
          IconButton(onPressed: one, icon: Icon(Icons.search,)),
        ],),
      //body: SafeArea(child: Text('Hi')),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child:
                  Container(
                    width: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(60.0,)),

                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image(
                            image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Giraffe_standing.jpg/300px-Giraffe_standing.jpg',) ,
                            fit: BoxFit.cover,
                            height: 200.0,
                            width: 200.0,
                          ),
                          Container(
                            color: Colors.black.withOpacity(.5),
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 5.0,
                            ),
                            child: Text(
                              'Giraffa',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 35.0,color: Colors.deepOrange,),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
              ),

            ],
          ),
        ),
      ),


    );


  }
}
void one (){
  print("hello");
}