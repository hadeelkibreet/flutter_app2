import 'package:flutter_app2/models/shopapp/SearchModel.dart';
import 'package:flutter_app2/moduls/shop_app/search/cubit/searchstates.dart';
import 'package:flutter_app2/netWork/end_points.dart';
import 'package:flutter_app2/netWork/remote/dio_helper.dart';
import 'package:flutter_app2/shared/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ShopSearchCubit extends Cubit<shopsearchstates> {
  ShopSearchCubit(): super(shopsearchinitialstates());

  static ShopSearchCubit get(context)=> BlocProvider.of(context);

   SearchModel? searchmodel;

  void search(String text){
    emit(shopsearchloadingstates());
    DioHelper.postData(
        url: SEARCH,
        token: token,
        data: {
          'text':text,
        }).then((value) {
         // print(value.data);
      searchmodel = SearchModel.fromJson(value.data);
      emit(shopsearchsuccessstates());
    }).catchError((error){
      print(error.toString());
      emit(shopsearcherorrestates(error.toString()));
    });
  }

}