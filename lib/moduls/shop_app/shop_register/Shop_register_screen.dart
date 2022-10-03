import 'package:flutter/material.dart';
import 'package:flutter_app2/moduls/shop_app/shop_register/cubitShop_register/cubitShop_register.dart';
import 'package:flutter_app2/moduls/shop_app/shop_register/cubitShop_register/statetsShop_register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layout/shopLayout/shop_Layuot.dart';
import '../../../models/shopapp/loginmodel.dart';
import '../../../netWork/local/cache_helper.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import 'package:buildcondition/buildcondition.dart';
import '../../../shared/adaptive/adaptivw_indicator.dart';

class ShopregisterScreen extends StatelessWidget {
  var namecontroller=TextEditingController();
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  var phonecontroller=TextEditingController();
  late shoploginmodel regstermodel;
  var fromkey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return

      BlocProvider(
          create: (BuildContext context)=> shopregistercubit(),

          child:BlocConsumer<shopregistercubit,shopregisterstates>(
            listener: (context,state){
              if(state is shopregistersuccessstates)
              {
                if(state.regstermodel.status!){
                  print(state.regstermodel.message);
                  print(state.regstermodel.status);
                  print(state.regstermodel.data!.token);
                  snackbarBuilder(mas:state.regstermodel.message,
                      context: context,
                      states: snackbarStates.SUCCESS

                  );
                  CacheHelper.saveData(
                    key: 'token',
                    value: state.regstermodel.data!.token,
                  ).then((value) {
                    token = state.regstermodel.data!.token;
                    print(value.toString()+'heer');
                    NavigatorFinish(context, shopLayuot());
                  });
                }


              }else if(state is shopregistererorrestates)
              {
                print('errorhereef');
                snackbarBuilder(mas:'لم يتم تسجيل الدخول بنجاح',
                    context: context,
                    states: snackbarStates.ERROR

                );


              }
            },
            builder: (context,state){
              return Scaffold(
                appBar: AppBar(),
                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Form(
                        key: fromkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'REGISTER',
                              style: Theme.of(context).textTheme.headline4!.copyWith(
                                  color: Colors.lightBlue
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Text('Register new to browes our hot offers',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: Colors.grey
                              ),

                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            defaultFormField(Controller: namecontroller,
                                Type: TextInputType.text,
                                label: 'Name',
                                prefix: Icons.person,
                                vali: 'please inter your name'),
                            SizedBox(
                              height: 25.0,
                            ),
                            defaultFormField(Controller: emailcontroller,
                                Type: TextInputType.emailAddress,
                                label: 'Email',
                                prefix: Icons.email_outlined,
                                vali: 'please inter email address'),
                            SizedBox(
                              height: 15.0,
                            ),
                            defaultFormField(Controller: passwordcontroller,
                                Type: TextInputType.visiblePassword,
                                label: 'password',
                                prefix: Icons.lock,
                                vali: 'The password is must be empty',
                                suffix:shopregistercubit.get(context).Iconpass ,
                                ispass: shopregistercubit.get(context).ispass,
                                suffixPressed: ()
                                {
                                  shopregistercubit.get(context).changepass();
                                },

                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            defaultFormField(Controller: phonecontroller,
                                Type: TextInputType.phone,
                                label: 'Phone',
                                prefix: Icons.phone,
                                vali: 'please inter your number'),
                            SizedBox(
                              height: 15.0,
                            ),
                            //shopregisterloadingstates

                            //shopregistersuccessstates

                            (state is! shopregisterloadingstates)?
                                defaultButton(onpre: (){
                                if(fromkey.currentState!.validate())
                                {
                                  shopregistercubit.get(context).userregister(
                                      email: emailcontroller.text,
                                      password: passwordcontroller.text,
                                      name:namecontroller.text,
                                      phone: phonecontroller.text);
                                };


                              }, text: 'REGISTER'):
                              Center(
                                  child: AdaptiveIndicator(
                                    os: getOS(),
                                  )),



                          ],//children

                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
      );

  }
}
