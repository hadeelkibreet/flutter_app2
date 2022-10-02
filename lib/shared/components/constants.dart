 import 'package:flutter_app2/moduls/shop_app/shop_login/shop_login.dart';
import 'package:flutter_app2/netWork/local/cache_helper.dart';
import 'package:flutter_app2/shared/components/components.dart';
 import 'dart:io';

void signOut(context)
 {
   CacheHelper.removeData(key: 'token').then((value) {
     if (value == true)
     {
       NavigatorFinish(context, shoploginscreen());
     }
   });
 }

 void printFullText(String text)
 {
   final pattern = RegExp('.{1,800}');
   pattern.allMatches(text).forEach((element)=> print(element.group(0)));
 }
 String ?token = CacheHelper.getData(Key1: 'token');

 // String ?token = '';

 String getOS(){
   return Platform.operatingSystem;
 }