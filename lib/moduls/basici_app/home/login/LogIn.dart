// ignore: file_names
// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/shared/components/components.dart';
import 'dart:html';
class Login extends StatefulWidget{
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var EmailCont= TextEditingController();
  var passwordCont= TextEditingController();
  var formKey= GlobalKey<FormState>();
  bool ispassword=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black38,
        centerTitle: true,
        title: Text('WELCOME',
          style: TextStyle(
            fontSize: 30.0,
            fontStyle: FontStyle.italic,

          ),

        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image(
                  image: NetworkImage('https://www.fit2work.com.au/assets/img/avatars/LoginIconAppl.png',),),
                SizedBox(
                  height: 40.0,
                ),

                defaultFormField(Controller: EmailCont,
                    Type: TextInputType.emailAddress,
                    label: 'Email Address',
                    vali: 'Email must not be empty',
                    prefix: Icons.email),
                 //email
                SizedBox(
                  height: 20.0,
                ),
                defaultFormField(Controller: passwordCont,
                    Type: TextInputType.visiblePassword,
                    label: 'Password',
                    prefix: Icons.lock_rounded,
                    vali: 'Password must not be empty',
                  ispass: ispassword,
                  suffixPressed: (){
                  setState(() {
                    ispassword=!ispassword;
                  });
                  },
                  suffix: ispassword?Icons.visibility: Icons.visibility_off,

                ),

                SizedBox(
                  height: 30.0,
                ),
                defaultButton(onpre: (){
                  if(formKey.currentState!.validate()){
                    print(EmailCont.text);
                    print(passwordCont.text);
                  }
                }, text: 'login',

                ),
                SizedBox(
                  height: 15.0,
                ),
                SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account ? ',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      TextButton(onPressed: (){

                      }, child: Text('Register now ',
                        style: TextStyle(fontSize: 18.0),

                      ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),


    );

  }
}