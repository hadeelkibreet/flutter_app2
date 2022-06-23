
import 'package:flutter/material.dart';
import 'package:flutter_app2/models/user/user_model.dart';


class UserScreen extends StatelessWidget{
List<UsersModel> users=[
UsersModel(id: 1, name: 'hadeel', phone: '050567829'),
  UsersModel(id: 2, name: 'hadeel2', phone: '0505'),
  UsersModel(id: 3, name: 'hadeel3', phone: '05067829'),
  UsersModel(id: 4, name: 'hadeel4', phone: '050567455829'),
  UsersModel(id: 5, name: 'hadeel5', phone: '05052367829'),
  UsersModel(id: 1, name: 'hadeel', phone: '050567829'),
  UsersModel(id: 2, name: 'hadeel2', phone: '0505'),
  UsersModel(id: 3, name: 'hadeel3', phone: '05067829'),
  UsersModel(id: 4, name: 'hadeel4', phone: '050567455829'),
  UsersModel(id: 5, name: 'hadeel5', phone: '05052367829'),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),

     body:
        ListView.separated(itemBuilder: (context,index)=> buildUsersItem(users[index]),
            separatorBuilder:(context,index)=> Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ), itemCount:users.length )

    )
      ;
  }
  Widget buildUsersItem(UsersModel user)=>  Padding(
    padding: const EdgeInsets.all(20.0),
    child :Row(
      children: [
        CircleAvatar(
          radius: 30.0,
          child: Text(
            '${user.id}',
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${user.name} ',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('${user.phone}',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}