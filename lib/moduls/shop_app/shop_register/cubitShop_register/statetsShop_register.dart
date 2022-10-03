import 'package:flutter_app2/models/shopapp/loginmodel.dart';

abstract class shopregisterstates {}

class shopregisterinitialstates extends shopregisterstates{}

class shopregisterloadingstates extends shopregisterstates{}

class shopregistersuccessstates extends shopregisterstates{
  final shoploginmodel regstermodel;

  shopregistersuccessstates(this.regstermodel);
}

class shopregistererorrestates extends shopregisterstates{

  final String error;
  shopregistererorrestates(this.error);
}
class shopregisterispasswordstates extends shopregisterstates{}


