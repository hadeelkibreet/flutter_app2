import 'package:flutter/material.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter_app2/moduls/shop_app/shop_login/cubitShop/statetsShop.dart';
import '../../../layout/shopLayout/cubit/cubitShop.dart';
import '../../../layout/shopLayout/cubit/statesShop.dart';
import '../../../layout/shopLayout/shop_Layuot.dart';
import '../../../netWork/local/cache_helper.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class settingScreen extends StatelessWidget {
  var namecontroller=TextEditingController();
  var emailcontroller=TextEditingController();
  var phonecontroller=TextEditingController();

  @override

  Widget build(BuildContext context) {
    return
      BlocConsumer<shoplayuotCubit,shopLayuotStates>(
          listener: (context,state){
          },
          builder: (context,state){
            var model=  shoplayuotCubit.get(context);
            namecontroller.text=model.userModel!.data!.name!;
            emailcontroller.text=model.userModel!.data!.email!;
            phonecontroller.text=model.userModel!.data!.phone!;

            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                   // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      defaultFormField(Controller: namecontroller,
                          Type: TextInputType.text,
                          label: 'Name',
                          prefix: Icons.person,
                          vali: 'please inter your name'),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultFormField(Controller: emailcontroller,
                          Type: TextInputType.emailAddress,
                          label: 'Email',
                          prefix: Icons.email_outlined,
                          vali: 'please inter email address'),
                      SizedBox(
                        height: 25.0,
                      ),
                      defaultFormField(Controller: phonecontroller,
                          Type: TextInputType.number,
                          label: 'Phone',
                          prefix: Icons.phone,
                          vali: 'please inter your number'),
                      SizedBox(
                        height: 25.0,
                      ),
                      BuildCondition(
                        condition: state is! shoploginloadingstates,
                        builder: (context)=> defaultButton(
                            onpre: ()
                            {
                             signOut(context);
                            }, text: 'LOGOUT'),
                        fallback: (context)=>const Center(child: CircularProgressIndicator()),
                      ),
                    ],//children

                  ),
                ),
              ),
            );
          },

    );
  }
}
