import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/Layout/newsapp/cubit/cubit.dart';
import 'package:flutter1/Layout/newsapp/cubit/states.dart';
import 'package:flutter1/Shared/components/components.dart';
import 'package:flutter1/modules/business/business_screen.dart';
import 'package:flutter1/modules/science/science_screen.dart';
import 'package:flutter1/modules/sports/sports_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {

    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state) {},
      builder:  (context,state)
      {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   'Discover',
                   style: Theme.of(context)
                     .textTheme
                     .headline4
                     ?.copyWith(color: Colors.red,fontWeight: FontWeight.w900),
                 ),
                 SizedBox(
                   height:5 ,
                 ),
                 Text(
                   'News from all over the world',
                   style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.red,fontWeight: FontWeight.w900),

                 ),
                 SizedBox(
                   height:18 ,
                 ),
                 TextFormField(
                     controller: searchController,
                    onChanged:(value)
                      {
                        NewsCubit.get(context).getsearch(value);
                        },
                   validator: (value) {
                     if (value!.isEmpty) {
                        return 'search must not be empty';
                      }
                     return null;
                     },
                   decoration: InputDecoration(
                     labelText: 'Search',
                     labelStyle: TextStyle(color: Colors.red) ,
                     fillColor: Colors.grey.shade200,
                     filled: true,
                     prefixIcon: Icon(
                      Icons.search,
                       color: Colors.red,
                     ),
                     suffixIcon:Icon(
                       Icons.tune,
                       color: Colors.red,
                     ),
                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none,),
                   ),
                 ),
                 SizedBox(
                   height: 15,
                 ),
                 Row(
                   children: [
                     Container(
                       padding: EdgeInsets.all(6),
                       decoration:BoxDecoration(
                        color: Colors.grey.shade200,
                         borderRadius: BorderRadius.circular(12),
                       ),
                       child: (
                       Text(
                         'Business',
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           color: Colors.red,
                         ),
                       )
                       ),
                     ),
                     SizedBox(
                       width: 24,
                     ),
                     Container(
                       padding: EdgeInsets.all(6),
                       decoration:BoxDecoration(
                         color: Colors.grey.shade200,
                         borderRadius: BorderRadius.circular(12),
                       ),
                       child: (
                           Text(
                             'Sports',
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                               color: Colors.red,
                             ),
                           )
                       ),
                     ),
                     SizedBox(
                       width: 24,
                     ),
                     Container(
                       padding: EdgeInsets.all(6),
                       decoration:BoxDecoration(
                         color: Colors.grey.shade200,
                         borderRadius: BorderRadius.circular(12),
                       ),
                       child: (
                           Text(
                             'Science',
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                               color: Colors.red,
                             ),
                           )
                       ),
                     ),
                     SizedBox(
                       width:24,
                     ),
                     Container(
                       padding: EdgeInsets.all(7),
                       decoration:BoxDecoration(
                         color: Colors.grey.shade200,
                         borderRadius: BorderRadius.circular(12),
                       ),
                       child: (
                           Text(
                             'Politics',
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                               color: Colors.red,
                             ),
                           )
                       ),
                     ),
                   ],
                 ),
                 Expanded(child: articleBuilder(list, context,isSearch: true,)),
               ],
             ),
          ),
        );
      },

    );
  }
}
