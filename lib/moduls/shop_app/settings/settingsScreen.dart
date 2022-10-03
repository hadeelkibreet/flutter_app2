import 'package:flutter/material.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter_app2/moduls/shop_app/shop_login/cubitShop/statetsShop.dart';
import '../../../layout/shopLayout/cubit/cubitShop.dart';
import '../../../layout/shopLayout/cubit/statesShop.dart';
import '../../../layout/shopLayout/shop_Layuot.dart';
import '../../../netWork/local/cache_helper.dart';
import '../../../shared/adaptive/adaptivw_indicator.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class settingScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
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
            var model=  shoplayuotCubit.get(context).userModel;
            namecontroller.text = model!.data!.name!;
            emailcontroller.text = model.data!.email!;
            phonecontroller.text = model.data!.phone!;

            return Conditional.single(
              context:context,
              conditionBuilder:(context)=>(model!=null),
              widgetBuilder:(context)=>SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if(state is ShopLoadingUpdataState )
                          LinearProgressIndicator(),
                        SizedBox(
                          height: 20.0,
                        ),
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
                        defaultButton(
                            onpre: ()
                            {
                              if(formKey.currentState!.validate()){
                                shoplayuotCubit.get(context).UpdataUser(
                                    name: namecontroller.text,
                                    email: emailcontroller.text,
                                    phone: phonecontroller.text);
                              }
                            }, text: 'UPDATA'),
                        SizedBox(
                          height: 20.0,
                        ),
                           defaultButton(
                              onpre: ()
                              {
                                signOut(context);
                              }, text: 'LOGOUT'),

                      ],//children

                    ),
                  ),
                ),
              ),
              fallbackBuilder: (context) => Center(
                  child: AdaptiveIndicator(
                    os: getOS(),
                  )),
            );
          },

    );
  }
}
