import '../../../models/shopapp/changeFavoretModel.dart';

abstract class shopLayuotStates {}

class shoplayuotinitilStates extends shopLayuotStates{}

class shoplayuotBottomNavStates extends shopLayuotStates{}

class shopChangeBottomNavStates extends shopLayuotStates{}


class ShopLoadingHomeDataState extends shopLayuotStates {}

class ShopSuccessHomeDataState extends shopLayuotStates {}

class ShopErrorHomeDataState extends shopLayuotStates
{
  final dynamic error;
  ShopErrorHomeDataState(this.error);
}


class ShopSuccessCategoriesState extends shopLayuotStates {}

class ShopErrorCategoriesState extends shopLayuotStates
{
  final dynamic error;
  ShopErrorCategoriesState(this.error);
}
class ShopChangeFavoritesState extends shopLayuotStates {}

class ShopSuccessChangeFavoritesState extends shopLayuotStates
{
  final ChangeFavoritesModel model;

  ShopSuccessChangeFavoritesState(this.model);
}

class ShopErrorChangeFavoritesState extends shopLayuotStates
{
  final dynamic error;
  ShopErrorChangeFavoritesState(this.error);
}

class ShopLoadingGetFavoritesState extends shopLayuotStates{}
class ShopSuccessGetChangeFavoritesState extends shopLayuotStates{}
class ShopSuccessGetChangeFavoritesState11 extends shopLayuotStates{}

class ShopLoadingGetUserDataState extends shopLayuotStates{}
class ShopSuccessGetUserDataState extends shopLayuotStates{}
class ShopErrorUserDataState extends shopLayuotStates
{
  final dynamic error;
  ShopErrorUserDataState(this.error);
}
class ShopLoadingUpdataState extends shopLayuotStates{}
class ShopSuccessUpdataState extends shopLayuotStates{}
class ShopErrorUpdataState extends shopLayuotStates
{
  final dynamic error;
  ShopErrorUpdataState(this.error);
}

