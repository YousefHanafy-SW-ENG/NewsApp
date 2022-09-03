import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/Layout/newsapp/cubit/cubit.dart';
import 'package:flutter1/Layout/newsapp/cubit/states.dart';
import 'package:flutter1/Shared/components/components.dart';
import 'package:flutter1/Shared/cubit/cubit.dart';
import 'dart:ui' as ui;

import 'package:flutter_bloc/flutter_bloc.dart';
class BusinessScreen extends StatelessWidget {

  //const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder:  (context,state)
      {
        var list = NewsCubit.get(context).business;


        return articleBuilder(list,context);
      },
    );
  }
}
