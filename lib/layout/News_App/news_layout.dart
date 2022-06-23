import 'package:flutter/material.dart';
import 'package:flutter_app2/layout/News_App/cubit/cubitNews.dart';
import 'package:flutter_app2/moduls/news_app/sciences/SearchScreen/Search_Screen.dart';
import 'package:flutter_app2/shared/components/components.dart';
import 'package:flutter_app2/shared/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app2/layout/News_App/cubit/statesNews.dart';

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit,NewAppState>(
        builder: (context,state){
      var cubit = newsCubit.get(context);
       return Scaffold
          (
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('News App'),
            ),
            actions: [
              IconButton(onPressed: ()
              {
                NavigatorTo(context, SearchScreen());
              },
                  icon: Icon(Icons.search)),
              IconButton(onPressed: ()
              {
                AppCubit.get(context).changeAppMode();
              },
                  icon: Icon(Icons.brightness_4_outlined)),
            ],
          ),
          body: cubit.Screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeCurrIndex(index);
            },
            items: cubit.BottomNavBar,
          ),
        );
       },

        listener: (context,state){}

        );
  }
}