import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app2/models/shopapp/FavoritesModel.dart';
import 'package:flutter_app2/shared/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import '../../../layout/shopLayout/cubit/cubitShop.dart';
import '../../../layout/shopLayout/cubit/statesShop.dart';
import '../../../shared/adaptive/adaptivw_indicator.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';


class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shoplayuotCubit,shopLayuotStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return  Conditional.single(
          context: context,
          conditionBuilder: (context) => state is! ShopLoadingGetFavoritesState,
          widgetBuilder: (context) =>shoplayuotCubit.get(context).favoritesModel!.data!.data!.length == 0
              ? Center(child:Text('You don\'t have item',),)
              : ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildListProduct(shoplayuotCubit.get(context).favoritesModel!.data!.data![index].product!, context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount:
            shoplayuotCubit.get(context).favoritesModel!.data!.data!.length,
          ),
          fallbackBuilder: (context) => Center(
              child: AdaptiveIndicator(
                os: getOS(),
              )),
        );
      },
    );
  }


}