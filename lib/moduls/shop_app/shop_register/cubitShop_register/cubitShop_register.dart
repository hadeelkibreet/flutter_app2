
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/models/shopapp/loginmodel.dart';
import 'package:flutter_app2/moduls/shop_app/shop_register/cubitShop_register/statetsShop_register.dart';
import 'package:flutter_app2/netWork/end_points.dart';
import 'package:flutter_app2/netWork/remote/dio_helper.dart';
import 'package:flutter_app2/shared/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class shopregistercubit extends Cubit<shopregisterstates>{


  shopregistercubit() : super(shopregisterinitialstates());

  static shopregistercubit get(context)=> BlocProvider.of(context);
  late shoploginmodel loginmodel;
  late bool errorregister;

  void userregister({
    required String name,
    required String email,
    required String password,
    required String phone,

  })
  {

    emit(shopregisterloadingstates());
    DioHelper.postData(
        url: REGISTER,
        data:{
          'email':email,
          'name':name,
          'password':password,
          'phone':phone,

        }, ).then((value) {
         print(value.data);

            loginmodel = shoploginmodel.fromJson(value.data);

            emit(shopregistersuccessstates(loginmodel));
          }).catchError((error){

          print(error.toString());
          emit(shopregistererorrestates(error.toString()));
    });
  }
  bool ispass=true;
  IconData Iconpass = Icons.visibility_off;
  void changepass ()
{
  ispass =! ispass;
  Iconpass = ispass? Icons.visibility_off: Icons.visibility;
  emit(shopregisterispasswordstates());
}
}