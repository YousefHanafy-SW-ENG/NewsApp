import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/modules/counter/cubit/cubit.dart';
import 'package:flutter1/modules/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// state less contain one class provide widget

// state ful contain 2 classes

//1.first class provide widget
//2.second class provide state from this widget

class CounterScreen extends StatelessWidget {
  int counter = 1;

  @override

  Widget build(BuildContext context)
  {

    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
           listener: (BuildContext context, CounterStates state) {
             if (state is CounterPlusState)
               {
                 print('Plus State');
                 }
                 if (state is CounterMinusState)
                   {
                     print('Minus State');
               }
           },
           builder: (BuildContext context,CounterStates state)
           {
            return Scaffold(
               appBar: AppBar(
                 title: Text(
                   'Counter',
                 ),
               ),
               body: Center(
                 child: Row (
                   mainAxisAlignment: MainAxisAlignment.center,
                   children:
                   [
                     TextButton(
                       onPressed: ()
                       {
                         CounterCubit.get(context).minus();
                       },
                       child: Text(
                         'MINUS',
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.symmetric(
                         horizontal: 20.0,
                       ),
                       child: Text(
                         '${CounterCubit.get(context).counter}',
                         style: TextStyle(
                           fontSize: 50.0,
                           fontWeight: FontWeight.w900,
                         ),
                       ),
                     ),
                     TextButton(
                       onPressed: ()
                       {
                         CounterCubit.get(context).plus();
                       },
                       child: Text(
                         'PLUS',
                       ),
                     ),
                   ],
                 ),
               ),
             );
           },
      ),
    );
  }
}

