import 'package:flutter/material.dart';

import 'package:flutter_app2/moduls/counter_app/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';


class CounterScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
          builder: (context,state){
            return
              Scaffold(
                appBar: AppBar(
                  title: Text('Counter ',),
                ),
                body:
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: (){
                        CounterCubit.get(context).minus();
                      },
                        child: Text('Minus',),),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text('${CounterCubit.get(context).counter}'
                          ,style: TextStyle(
                            fontSize: 40.0,
                          ),
                        ),
                      ),
                      TextButton(onPressed: (){
                        CounterCubit.get(context).plus();
                      },
                        child: Text('Plus',),),
                    ],
                  ),
                ),


              );

          },
          listener: (context,state){
            if(state is CounterPlusStates ) {print('plus ${state.counter} ');}
            if(state is CounterMinusStates ) {print('minus ${state.counter}');}
          })
    );
  }
}
/*
 Scaffold(
          appBar: AppBar(
            title: Text('Counter ',),
          ),
          body:
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){

                  },
                  child: Text('Minus',),),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('${counter}'
                    ,style: TextStyle(
                      fontSize: 40.0,
                    ),
                  ),
                ),
                TextButton(onPressed: (){

                },
                  child: Text('Plus',),),
              ],
            ),
          ),


        ),
 */
