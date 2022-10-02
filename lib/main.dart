import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app2/layout/News_App/cubit/cubitNews.dart';
import 'package:flutter_app2/layout/News_App/cubit/statesNews.dart';
import 'package:flutter_app2/layout/shopLayout/shop_Layuot.dart';
import 'package:flutter_app2/moduls/shop_app/on_boarding.dart';
import 'package:flutter_app2/moduls/shop_app/shop_login/shop_login.dart';
import 'package:flutter_app2/netWork/local/cache_helper.dart';
import 'package:flutter_app2/shared/bloc_observer.dart';
import 'package:flutter_app2/shared/cubit/cubit.dart';
import 'package:flutter_app2/shared/cubit/states.dart';
import 'package:flutter_app2/shared/styles/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'layout/News_App/news_layout.dart';
import 'layout/shopLayout/cubit/cubitShop.dart';
import 'layout/todoapp/home_layout.dart';
import 'netWork/remote/dio_helper.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
 await CacheHelper.init();

 bool? isdark = CacheHelper.getData(Key1: 'isdark');
 Widget widget;
  bool? onBoarding = CacheHelper.getData(Key1: 'onBoarding');
  String ?token = CacheHelper.getData(Key1: 'token');
  print(token);
  if(onBoarding!=null)
  {
    if(token!= null) widget= shopLayuot();
    else widget= shoploginscreen();
  }else{ widget=onboardingscreen();}

 runApp(MyApp(
   isdark: isdark,
   startWidget: widget,
 ));

}

class MyApp extends StatelessWidget {
  final bool? isdark;
  final Widget ?startWidget;

  MyApp({this.isdark,this.startWidget});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return  MultiBlocProvider(
      providers: [
        BlocProvider( create: (BuildContext context) => AppCubit()..changeAppMode(
          fromShared: isdark,
        ) ),
        BlocProvider(create: (context)=>newsCubit()..getBusiness()),
        BlocProvider(create: (context)=>shoplayuotCubit()..getHomeData()..getCategories()..getFavorites()..getUserData()),

      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){} ,

        builder: (context,state){

          return  MaterialApp(
            debugShowCheckedModeBanner: false,

            theme: lighttheme,
            darkTheme: darktheme,
            themeMode: AppCubit.get(context).isdark ? ThemeMode.light : ThemeMode.dark ,
            home: Directionality(
                textDirection: TextDirection.ltr,
                child: (startWidget!= null?startWidget:null)!,

            ),

          );
        },

        /*
         MaterialApp(
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,

            appBarTheme: AppBarTheme(
             // backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.dark,
                statusBarColor: Colors.white,

              ),
              backgroundColor: Colors.white,
              elevation: 0.0,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              iconTheme: IconThemeData(
                color: Colors.black,

              ),
            ),

            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepOrange,
              elevation: 20.0,
            ),
            textTheme: TextTheme(
              bodyText1: TextStyle(
                color: Colors.black45,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,

              ),
            ),

          ),
          darkTheme: ThemeData(
            scaffoldBackgroundColor: HexColor('333739'),

            appBarTheme: AppBarTheme(
              // backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarColor: HexColor('333739'),

              ),
              backgroundColor: HexColor('333739'),
              elevation: 0.0,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              iconTheme: IconThemeData(
                color: Colors.white,

              ),
            ),

            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepOrange,
              elevation: 20.0,
              backgroundColor: HexColor('333739'),
              unselectedItemColor: Colors.white,
            ),
            textTheme: TextTheme(
              bodyText1: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,

              ),
            ),

          ),
          themeMode: ThemeMode.dark,

          home: Directionality(
              textDirection: TextDirection.ltr,
              child: NewsApp()),

        ),*/
      ),
    );
  }
}

