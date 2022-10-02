
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/models/shopapp/loginmodel.dart';
import 'package:flutter_app2/moduls/shop_app/shop_login/cubitShop/statetsShop.dart';
import 'package:flutter_app2/netWork/end_points.dart';
import 'package:flutter_app2/netWork/remote/dio_helper.dart';
import 'package:flutter_app2/shared/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class shoplogincubit extends Cubit<shoploginstates>{


  shoplogincubit() : super(shoplogininitialstates());

  static shoplogincubit get(context)=> BlocProvider.of(context);
  late shoploginmodel loginmodel;
  late bool errorlogin;

  void userlogin({
  required String email,
    required String password
})
  {

    emit(shoploginloadingstates());
    DioHelper.postData(
      token: 'token',
        url: LOGIN,
        data:{
          'email':email,
          'password':password,
        }, ).then((value) {
         print(value.data);

            loginmodel = shoploginmodel.fromJson(value.data);

            emit(shoploginsuccessstates(loginmodel));
          }).catchError((error){

          print(error.toString());
          emit(shoploginerorrestates(error.toString()));
    });
  }
  bool ispass=true;
  IconData Iconpass = Icons.visibility_off;
  void changepass ()
{
  ispass =! ispass;
  Iconpass = ispass? Icons.visibility_off: Icons.visibility;
  emit(shoploginispasswordstates());
}
}