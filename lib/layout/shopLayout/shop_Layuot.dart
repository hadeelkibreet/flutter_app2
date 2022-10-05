import 'package:flutter/material.dart';
import 'package:flutter_app2/layout/shopLayout/cubit/cubitShop.dart';
import 'package:flutter_app2/layout/shopLayout/cubit/statesShop.dart';
import 'package:flutter_app2/moduls/news_app/sciences/SearchScreen/Search_Screen.dart';
import 'package:flutter_app2/moduls/shop_app/products/productsScreen.dart';
import 'package:flutter_app2/moduls/shop_app/search/searchScreen.dart';
import 'package:flutter_app2/moduls/shop_app/shop_login/shop_login.dart';
import 'package:flutter_app2/netWork/local/cache_helper.dart';
import 'package:flutter_app2/shared/components/components.dart';
import 'package:flutter_app2/shared/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class  shopLayuot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shoplayuotCubit, shopLayuotStates>(

        listener: (context, state) {},
        builder: (context, state) {
          var cubit = shoplayuotCubit.get(context);
          return Scaffold(
              appBar: AppBar(
              title: Text('Salla'),
              actions: [
                IconButton(onPressed: ()
              {
                NavigatorTo(context, searchScreen());
              }, icon: Icon(Icons.search)),
                // IconButton(onPressed: ()
                // {
                //   print(token);
                //
                // }, icon: Icon(Icons.safety_check_rounded)),
                ],
              ),
              body:  cubit.bottomscreen[cubit.currentIndex],
                bottomNavigationBar: BottomNavigationBar(
                  onTap: (index)
                  {
                    cubit.changeBottom(index);
                  },
                    currentIndex: cubit.currentIndex,
                    items:[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.apps),
                        label: 'Categories',),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.favorite),
                        label: 'Favorits',),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.settings),
                        label: 'Setting',),




                    ]


                ),
          );
        },
        );
  }
}
