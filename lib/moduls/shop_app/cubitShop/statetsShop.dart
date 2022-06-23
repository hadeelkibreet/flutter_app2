import 'package:flutter_app2/models/shopapp/loginmodel.dart';

abstract class shoploginstates {}

class shoplogininitialstates extends shoploginstates{}

class shoploginloadingstates extends shoploginstates{}

class shoploginsuccessstates extends shoploginstates{
  final shoploginmodel loginmodel;

  shoploginsuccessstates(this.loginmodel);
}

class shoploginerorrestates extends shoploginstates{

  final String error;
  shoploginerorrestates(this.error);
}
class shoploginispasswordstates extends shoploginstates{}


