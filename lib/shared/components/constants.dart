 import 'package:flutter_app2/moduls/shop_app/shop_login/shop_login.dart';
import 'package:flutter_app2/netWork/local/cache_helper.dart';
import 'package:flutter_app2/shared/components/components.dart';
 import 'dart:io';
 import '../../../layout/shopLayout/cubit/cubitShop.dart';
 String ?token = '';

 void signOut(context) {
   CacheHelper.removeData(key: 'token');
   token=null;
   var model = shoplayuotCubit.get(context).userModel;

   model?.data!.name='';
   model?.data!.email='';
   model?.data!.phone='';
   NavigatorFinish(context, shoploginscreen(),);
   shoplayuotCubit.get(context).currentIndex=0;


 }

 void printFullText(String text)
 {
   final pattern = RegExp('.{1,800}');
   pattern.allMatches(text).forEach((element)=> print(element.group(0)));
 }


 String getOS(){
   return Platform.operatingSystem;
 }