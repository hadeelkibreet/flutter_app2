import 'package:flutter/material.dart';

import 'package:flutter_app2/shared/components/components.dart';
import 'package:flutter_app2/shared/components/constants.dart';
import 'package:flutter_app2/shared/cubit/cubit.dart';
import 'package:flutter_app2/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class homeLayout extends StatelessWidget
{
  var scaffolKey=GlobalKey<ScaffoldState>();
  var titleController=TextEditingController();
  var timeController=TextEditingController();
  var dateConttroller=TextEditingController();
  var formKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return   BlocProvider(
        create: (BuildContext context)=> AppCubit()..createDataBase(),
        child: BlocConsumer<AppCubit,AppStates>(
            builder: (context,state){
              AppCubit cubitt = AppCubit.get(context);
              return
                Scaffold(
                  key: scaffolKey,
                  appBar: AppBar(
                    title: Center(
                      child: Text(
                        cubitt.title1[cubitt.currentIndex],
                      ),
                    ),
                  ),
                  body:  cubitt.screen[cubitt.currentIndex] ,
                  floatingActionButton: FloatingActionButton(onPressed: () {
                    if(cubitt.isBottonSheetShow)
                    {
                      if(formKey.currentState!.validate()){
                        cubitt.insertToDataBase(
                            title: titleController.text,
                            date: dateConttroller.text,
                            time: timeController.text);

                      }

                    }else{
                      scaffolKey.currentState!.showBottomSheet((context) =>
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(20.0)  ,
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  //title
                                  defaultFormField(
                                      Controller: titleController,
                                      Type: TextInputType.text,
                                      label: 'Tasks Title',
                                      prefix: Icons.title,
                                      vali: 'Title must not be empty',
                                    onTap: (){

                                    }

                                  ),
                                  //end title
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  //time
                                  defaultFormField(
                                    Controller: timeController,
                                    Type: TextInputType.datetime,
                                    label: 'Tasks Time',
                                    prefix: Icons.watch_later_outlined,
                                    vali: 'Tasks Time must not be empty',
                                    onTap: ()
                                    {
                                      showTimePicker(context: context,
                                        initialTime: TimeOfDay.now(),).then(
                                              (value)
                                          {
                                            timeController.text=value!.format(context).toString();
                                          }

                                      );
                                    } ,
                                  ), //end time
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  //date
                                  defaultFormField(
                                    Controller: dateConttroller,
                                    Type: TextInputType.datetime,
                                    label: 'Tasks Date',
                                    prefix: Icons.calendar_today_outlined,
                                    vali: 'Tasks Date must not be empty',
                                    onTap: ()
                                    {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2022-11-01'),
                                      ).then((value) {
                                        dateConttroller.text= DateFormat.yMMMd().format(value!);
                                      });

                                    } ,
                                  ),//end date
                                  SizedBox(
                                    height: 15.0,
                                  ),

                                ],
                              ),
                            ),
                          ),
                        elevation: 50.0,
                      ).closed.then((value)
                      {
                        cubitt.isBottonSheetShow=false;
                        cubitt.ChangeBottomSheetState(isShow: false,
                            icon: Icons.edit);
                      });

                      cubitt.ChangeBottomSheetState(isShow: true,
                          icon: Icons.add);
                    }

                  },
                    child:
                    Icon(
                      cubitt.Iconbottom,
                    )

                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    currentIndex: cubitt.currentIndex,
                    type: BottomNavigationBarType.fixed,
                    onTap: (index){
                      cubitt.ChangeIndex(index);
                    },
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.menu) ,
                        label: 'Tasks',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.check_circle_outline) ,
                        label: 'Done',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.archive_outlined) ,
                        label: 'Archive',
                      ),
                    ],
                  ),


                );

            },
            listener: (context,state){
              if(state is AppInsertDatabaseStates)
              {
                Navigator.pop(context);
              }
             })
    );

  }
}
