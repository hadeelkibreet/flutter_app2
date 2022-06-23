import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/layout/News_App/cubit/cubitNews.dart';
import 'package:flutter_app2/layout/News_App/cubit/statesNews.dart';
import 'package:flutter_app2/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit,NewAppState>
      (builder: (context,state)
    {
      var list = newsCubit.get(context).business;
      return articalBuilder(list);
    }
    , listener: (context,state){});


  }
}

/*
 Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row
        (
        children:
        [
          Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage('https://www.fekera.com/wp-content/uploads/2021/10/IMG_%D9%A2%D9%A0%D9%A2%D9%A0%D9%A1%D9%A0%D9%A2%D9%A4_%D9%A1%D9%A4%D9%A2%D9%A5%D9%A2%D9%A9-538x700.jpg'),
                fit: BoxFit.cover
              ),
            ),
          ),
        SizedBox(
          width: 20.0,
        ),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text('Title111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('2021-04-02T11:43:00Z',
                    style: TextStyle(fontSize: 20.0,color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
*/