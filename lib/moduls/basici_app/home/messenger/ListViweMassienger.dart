import 'package:flutter/material.dart';

class listmessienger extends StatelessWidget{

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
        child: SingleChildScrollView(
       child:   Column(
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
            Container(
              height: 120.0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index)=> buildStoryItem(),
                separatorBuilder: (context,index)=>SizedBox( width: 20.0,),
                itemCount: 10,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),

            ListView.separated(itemBuilder: (context,index)=>buildCahtItem(),
              separatorBuilder: (context,index)=>SizedBox(height: 10.0,),
              itemCount: 15,
              shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),)
          ],
        ),),

      ),
    );

  }
  Widget buildCahtItem()=>   Row(
    children: [
      Container(
        width: 60.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage('https://scontent.fruh4-1.fna.fbcdn.net/v/t1.18169-9/1794624_10152278161981152_3673426180552245816_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=x3O9VcFGelwAX_bvfsp&tn=YWsiCZzetkWK8KDj&_nc_ht=scontent.fruh4-1.fna&oh=52a3c249359a6f121601ba5ff25324a9&oe=61834147'),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 2.0,end: 2.0,),
                  child: CircleAvatar(
                    radius: 8.0,
                    backgroundColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 2.0,end: 2.0,),
                  child: CircleAvatar(
                    radius: 7.0,
                    backgroundColor: Colors.green,

                  ),
                ),

              ],
            ),

          ],
        ),
      ),
      SizedBox(
        width: 10.0,
      ),
      Container(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Radwan Kibreet', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              ),
              Row(
                children: [
                  Expanded(child: Text('السلام عليكم ورحمه الله وبركاتة كيف  الحال؟',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  ),
                  Text('03:28 PM',),

                ],
              ),

            ],
          ),
        ),
      )
    ],
  );

  Widget buildStoryItem()=>   Container(
    width: 60.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage('https://scontent.fruh4-4.fna.fbcdn.net/v/t39.30808-1/s200x200/244316508_4704138949625946_7756071940701293909_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=7206a8&_nc_ohc=s_d92eWPXD8AX8pvmHl&_nc_ht=scontent.fruh4-4.fna&oh=73fad07b6c102e563caf81ca116d20f9&oe=6168FE28'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 2.0,end: 2.0,),
              child: CircleAvatar(
                radius: 8.0,
                backgroundColor: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 2.0,end: 2.0,),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.green,

              ),
            ),

          ],
        ),
        SizedBox(
          height: 15.0,
        ),
        Text('Farah Kibreet',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );


}