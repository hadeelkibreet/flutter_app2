import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/layout/News_App/cubit/cubitNews.dart';
import 'package:flutter_app2/layout/News_App/cubit/statesNews.dart';
import 'package:flutter_app2/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class sciencesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit,NewAppState>
      (builder: (context,state)
    {
      var list = newsCubit.get(context).science;
      return articalBuilder(list);
    }
        , listener: (context,state){});
  }
}
