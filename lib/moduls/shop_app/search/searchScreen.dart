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
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                  key: formkey,
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
                              buildListProduct(ShopSearchCubit.get(context).searchmodel!.data!.data![index], context),
                          separatorBuilder: (context, index) => myDivider(),
                          itemCount:
                          ShopSearchCubit.get(context).searchmodel!.data!.data!.length,
                        ),
                      )

                    ],
                  )),
            ) ,
          );
        },
      ),
    );
  }
}
