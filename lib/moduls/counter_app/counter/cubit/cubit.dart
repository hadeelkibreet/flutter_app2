import 'package:bloc/bloc.dart';
import 'package:flutter_app2/moduls/counter_app/counter/cubit/states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
class CounterCubit extends Cubit<CounterStates>{
  CounterCubit() : super(CounterInitialState());

  int counter=1;

  static CounterCubit get(context)=> BlocProvider.of(context);

  void minus(){
    counter--;
    emit(CounterMinusStates(counter));
  }

  void plus(){
    counter++;
    emit(CounterPlusStates(counter));
  }

}