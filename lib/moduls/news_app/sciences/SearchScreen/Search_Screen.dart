import 'package:flutter/material.dart';
import 'package:flutter_app2/layout/News_App/cubit/cubitNews.dart';
import 'package:flutter_app2/layout/News_App/cubit/statesNews.dart';
import 'package:flutter_app2/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app2/main.dart';
class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cont = TextEditingController();
    return BlocConsumer<newsCubit,NewAppState>(builder: (context,state)
    {
      return  Scaffold(
        appBar: AppBar(),
        body: Column(

          children:
          [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: defaultFormField(Controller: cont,
                Type: TextInputType.text,
                label: 'Search',
                prefix: Icons.search,
                vali: 'The search must not be embty ',
                onChanged: (String value)
                {
                  newsCubit.get(context).getSearch(value);

                },

              ),
            ),
            Expanded(child: articalBuilder(newsCubit.get(context).search,issersh: true)),
          ],
        ),
      );
    },


        listener: (context,state){});


      /*
      Scaffold(
      appBar: AppBar(),
      body: Column(

        children:
        [
          defaultFormField(Controller: cont,
              Type: TextInputType.text,
              label: 'Search',
              prefix: Icons.search,
              vali: 'The search must not be embty ',
             onChanged: (String value)
             {

             },

          ),
          articalBuilder(list),
        ],
      ),
    );*/
  }
}
