import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                buildListProduct(shoplayuotCubit.get(context).favoritesModel!.data!.data![index].product, context),
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

  Widget buildListProduct(model, context) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      height: 120.0,
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(model.image),
                width: 120.0,
                height: 120.0,
              ),
              if (model.discount != 0)
                Container(
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  child: Text(
                    'DISCOUNT',
                    style: TextStyle(
                      fontSize: 8.0,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.0,
                    height: 1.3,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      model.price.toString(),
                      style: TextStyle(
                        fontSize: 12.0,
                        color: defaultcolor,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    if (model.discount != 0)
                      Text(
                        model.oldPrice.toString(),
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Spacer(),
                    Expanded(
                      child: IconButton(
                          icon: shoplayuotCubit.get(context).favorites[model.id]!
                              ? Icon(
                            Icons.favorite,
                            size: 17.0,
                            color: Colors.red,
                          )
                              : Icon(
                            Icons.favorite_border,
                            size: 17.0,
                            // color: Colors.white,
                          ),
                          onPressed: () {
                            shoplayuotCubit.get(context)
                                .changeFavorites(model.id);
                            print(model.id);
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}