import 'package:flutter/material.dart';
import 'package:flutter_app2/layout/shopLayout/cubit/cubitShop.dart';
import 'package:flutter_app2/layout/shopLayout/cubit/statesShop.dart';
import 'package:flutter_app2/models/shopapp/cateogries_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/components.dart';

class cateogriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shoplayuotCubit,shopLayuotStates>
      (
      listener:(context,state){},
      builder:(context,state){
        return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder:(context,index)=> buildCatItem(shoplayuotCubit.get(context).categoriesModel!.data!.data[index]),
            separatorBuilder:(context, index)=> myDivider(),
            itemCount: shoplayuotCubit.get(context).categoriesModel!.data!.data.length);
      },

    );
  }
  Widget buildCatItem(DataModel model)=>Padding(
      padding: const EdgeInsets.all(20.0),
    child: Row(

      children: [

        Image(image: NetworkImage(model.image),
        width: 100.0,
          height: 100.0,
          fit: BoxFit.cover,
        ),
        Spacer(),
        Text(
          model.name,
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.black
          ),
        ),
        Spacer(),
        Icon(Icons.arrow_forward_ios),

      ],
    ),
  );
}
