
abstract class shopsearchstates {}

class shopsearchinitialstates extends shopsearchstates{}

class shopsearchloadingstates extends shopsearchstates{}

class shopsearchsuccessstates extends shopsearchstates{}
class shopsearcherorrestates extends shopsearchstates{
  final String error;
  shopsearcherorrestates(this.error);
}