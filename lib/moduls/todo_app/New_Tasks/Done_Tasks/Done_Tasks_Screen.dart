import 'package:flutter/material.dart';
import 'package:flutter_app2/shared/components/components.dart';
import 'package:flutter_app2/shared/components/constants.dart';
import 'package:flutter_app2/shared/cubit/cubit.dart';
import 'package:flutter_app2/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoneTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        builder:(context,state)
        {
          var cubitindex= AppCubit.get(context).DonetasksMap;
          return tasksbuilder(cubitindex: cubitindex, showdone: false, showearchive: true);

        },
        listener:(context,state){}
    );
  }

}
