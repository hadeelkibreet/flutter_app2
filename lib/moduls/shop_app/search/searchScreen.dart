import 'package:flutter/material.dart';
import 'package:flutter_app2/moduls/shop_app/search/cubit/searchcubit.dart';
import 'package:flutter_app2/moduls/shop_app/search/cubit/searchstates.dart';
import 'package:flutter_app2/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class searchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    var SearchController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context)=>ShopSearchCubit(),
      child: BlocConsumer<ShopSearchCubit,shopsearchstates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(),
            body: Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      defaultFormField(Controller: SearchController,
                      Type: TextInputType.text,
                      label: 'SEARCH',
                      prefix: Icons.search,
                      vali: 'enter textto search',
                        onSubmit: (String text ){
                           ShopSearchCubit.get(context).search(text);
                        },

                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      if(state is shopsearchloadingstates)
                        LinearProgressIndicator(),
                      if(state is shopsearchsuccessstates )
                      Expanded(
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) =>
                              buildListProductt(ShopSearchCubit.get(context).searchmodel!.data!.data![index], context),
                          separatorBuilder: (context, index) => myDivider(),
                          itemCount:
                          ShopSearchCubit.get(context).searchmodel!.data!.data!.length,
                        ),
                      )

                    ],
                  ),
                )) ,
          );
        },
      ),
    );
  }


  Widget buildListProductt(
      model,
      context) =>
      Padding(
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
                  if (model.discount != 0 )
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
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        if (model.discount != 0 )
                          Text(
                            model.oldPrice.toString(),
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
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
