import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/Shared/components/components.dart';
import 'package:flutter1/Shared/components/constants.dart';
import 'package:flutter1/Shared/cubit/cubit.dart';
import 'package:flutter1/Shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTasksScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,ApppStates>(
      listener: (context,state){},
      builder:  (context,state)
      {
        var tasks = AppCubit.get(context).newtasks;
        return ListView.separated(
          itemBuilder: (context,index) => buildTaskItem(tasks[index],context),
          separatorBuilder: (context,index) => Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          itemCount: tasks.length,
        );
      },
    );
  }
}
