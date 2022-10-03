import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/layout/shopLayout/shop_Layuot.dart';
import 'package:flutter_app2/models/shopapp/loginmodel.dart';
import 'package:flutter_app2/moduls/shop_app/shop_login/cubitShop/cubitShop.dart';
import 'package:flutter_app2/moduls/shop_app/shop_login/cubitShop/statetsShop.dart';
import 'package:flutter_app2/moduls/shop_app/shop_register/Shop_register_screen.dart';
import 'package:flutter_app2/netWork/local/cache_helper.dart';
import 'package:flutter_app2/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/adaptive/adaptivw_indicator.dart';
import '../../../shared/components/constants.dart';


class shoploginscreen extends StatelessWidget {
  var fromkey= GlobalKey<FormState>();
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  late shoploginmodel loginmodel1;

  @override
  Widget build(BuildContext context) {
    return

   BlocProvider(
      create: (BuildContext context)=> shoplogincubit(),

     child:BlocConsumer<shoplogincubit,shoploginstates>(
       listener: (context,state){
         if(state is shoploginsuccessstates)
         {
           if(state.loginmodel.status == true){
             print(state.loginmodel.message);
             print(state.loginmodel.data!.token!.toString()+'shop login');
             snackbarBuilder(mas:state.loginmodel.message,
             context: context,
              states: snackbarStates.SUCCESS

             );
             CacheHelper.saveData(
               key: 'token',
               value: state.loginmodel.data!.token!,
             ).then((value)
             {
               token= state.loginmodel.data!.token!;
               NavigatorFinish(context, shopLayuot());

             });
           }


         }else if(state is shoploginerorrestates)
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
                         'LOGIN',
                         style: Theme.of(context).textTheme.headline4!.copyWith(
                             color: Colors.lightBlue
                         ),
                       ),
                       const SizedBox(
                         height: 15.0,
                       ),
                       Text('Login new to browes our hot offers',
                         style: Theme.of(context).textTheme.bodyText1!.copyWith(
                             color: Colors.grey
                         ),

                       ),
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
                          suffix:shoplogincubit.get(context).Iconpass ,
                          ispass: shoplogincubit.get(context).ispass,
                          suffixPressed: ()
                          {
                            shoplogincubit.get(context).changepass();
                          },
                          onSubmit: (value){

                            if(fromkey.currentState!.validate())
                            {
                              shoplogincubit.get(context).userlogin(email: emailcontroller.text
                                  , password: passwordcontroller.text);
                            }

                          }
                       ),
                       SizedBox(
                         height: 25.0,
                       ),

                       (state is! shoploginloadingstates)?
                          defaultButton(
                             onpre: ()
                         {
                           if(fromkey.currentState!.validate())
                           {
                             shoplogincubit.get(context).userlogin(email: emailcontroller.text
                                 , password: passwordcontroller.text);
                           };
                           if(state is shoploginsuccessstates)
                           {
                             SnackBar(content: Text('you click on buttom'),
                               elevation: 5.0,
                               backgroundColor: Colors.green,
                               behavior: SnackBarBehavior.floating,


                             );

                           }



                         }, text: 'LOGIN'):
                       Center(
                           child: AdaptiveIndicator(
                             os: getOS(),
                           )),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text('Don\'n have an acount ? ',
                             style: Theme.of(context).textTheme.bodyText1,
                           ),

                           TextButton(onPressed: (){
                             NavigatorTo(context, ShopregisterScreen());

                           }, child: Text('register'))
                         ],
                       )


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
/*
*  Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LOGIN',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.lightBlue
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text('Login new to browes our hot offers',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.grey
                      ),

                    ),
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

                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    defaultButton(onpre: (){}, text: 'LOGIN'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'n have an acount ? ',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        defaultTextButton(
                          onpre: (){

                          },
                          label: 'register' ,
                        )
                      ],
                    )


                  ],//children

                ),
              ),
            ),
          ),
        ),
* */
