import 'package:flutter/material.dart';

class Messenger extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://scontent.fruh4-6.fna.fbcdn.net/v/t1.6435-9/162135367_1522614347936837_3435580622410019575_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=qYKbJt1x75cAX-7Yv14&_nc_ht=scontent.fruh4-6.fna&oh=6913f7fd675ae1299d2ba97f987e65a5&oe=6184F081'),
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              'Chats',
            style: TextStyle(color: Colors.black,),
            ),
          ],

        ),
        elevation: 0.0,
        actions: [
          IconButton(onPressed: (){},
              icon: CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.blue,
                  child: Icon(Icons.camera_alt,
                  size: 18.0,
                    color: Colors.white,
                  )

              ),

          ),
          IconButton(onPressed: (){},
            icon: CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.blue,
                child: Icon(Icons.edit,
                  size: 18.0,
                  color: Colors.white,
                )

            ),

          ),


        ],
      ),
      body:

      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.grey[300],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon( Icons.search,),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text('search'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),


          ],
        ),
      ),
    )
      ;
  }

}