import 'package:flutter/cupertino.dart';
import 'package:flutter_app2/layout/shopLayout/cubit/statesShop.dart';
import 'package:flutter_app2/models/shopapp/cateogries_model.dart';
import 'package:flutter_app2/models/shopapp/changeFavoretModel.dart';
import 'package:flutter_app2/models/shopapp/home_model.dart';
import 'package:flutter_app2/models/shopapp/loginmodel.dart';
import 'package:flutter_app2/moduls/shop_app/cateogries/cateogriesScreen.dart';
import 'package:flutter_app2/moduls/shop_app/favorits/favoritesScreen.dart';
import 'package:flutter_app2/moduls/shop_app/products/productsScreen.dart';
import 'package:flutter_app2/moduls/shop_app/settings/settingsScreen.dart';
import 'package:flutter_app2/netWork/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app2/netWork/end_points.dart';

import '../../../models/shopapp/FavoritesModel.dart';
import '../../../models/user/user_model.dart';
import '../../../netWork/local/cache_helper.dart';
import '../../../shared/components/constants.dart';




class shoplayuotCubit extends Cubit<shopLayuotStates>
{
  shoplayuotCubit() : super(shoplayuotinitilStates());

  static shoplayuotCubit get(context)=> BlocProvider.of(context);

  int currentIndex=0;

  List<Widget> bottomscreen=
  [
    productsScreen(),
    cateogriesScreen(),
    FavoritesScreen(),
    settingScreen(),
  ];


void changeBottom(int index)
{
  currentIndex=index;
  emit(shopChangeBottomNavStates());
}

  Map<int,bool> favorites={};
  HomeModel? homeModel1;
  void getHomeData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(url: HOME,token: token).then((value)
    {
      homeModel1 = HomeModel.fromJson(value.data);
      homeModel1!.data!.products.forEach((element) {
        favorites.addAll(
          {
            element.id : element.inFavorites,
          }
        );
      });
     print(favorites.toString());
      //print(homeModel1!.data!.products.length);
      emit(ShopSuccessHomeDataState());
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopErrorHomeDataState(error));
    });
  }
   CategoriesModel? categoriesModel;
  void getCategories() {
    DioHelper.getData(
        url: GET_CATEGORIES,
        token: token).then((value)
    {
      categoriesModel = CategoriesModel.fromJson(value.data);

      emit(ShopSuccessCategoriesState());
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopErrorCategoriesState(error));
    });
  }


  ChangeFavoritesModel? changeFavoritesModel;

  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;
    emit(ShopChangeFavoritesState());

    DioHelper.postData(
      url: FAVORITES,
      token: token,
      data: {
        'product_id': productId,
      },
    ).then((value) {
     // print(token);
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      print(value.data);
      if (!changeFavoritesModel!.status!) {
        favorites[productId] = favorites[productId]!;
      } else {
        getFavorites();
      }
      emit(ShopSuccessChangeFavoritesState(changeFavoritesModel!));
    }).catchError((error) {
      favorites[productId] = favorites[productId]!;

      emit(ShopErrorChangeFavoritesState(error.toString()));
    });
  }
  FavoritesModel? favoritesModel;

  void getFavorites() {
    emit(ShopLoadingGetFavoritesState());

    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      print(value.data);
      emit(ShopSuccessGetChangeFavoritesState());
    }).catchError((error) {
      emit(ShopErrorChangeFavoritesState(error.toString()));
    });
  }

  shopUserDatamodel? userModel;

  void getUserData() {
    emit(ShopLoadingGetUserDataState());
    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {


      userModel = shopUserDatamodel.fromJson(value.data) ;
      print(userModel!.data?.name );


      emit(ShopSuccessGetUserDataState());
    }).catchError((error) {
      emit(ShopErrorUserDataState(error.toString()));
      print(error);

    });
  }




}

