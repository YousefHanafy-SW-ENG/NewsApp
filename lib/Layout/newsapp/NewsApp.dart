import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/Layout/newsapp/cubit/cubit.dart';
import 'package:flutter1/Shared/components/components.dart';
import 'package:flutter1/Shared/cubit/cubit.dart';
import 'package:flutter1/Shared/network/remote/dio_helper.dart';
import 'package:flutter1/search/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/states.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  => BlocConsumer<NewsCubit, NewsStates>(
        listener: (context ,state) {},
        builder:  (context ,state)
        {
          var cubit = NewsCubit.get(context);

          return  Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    AppCubit.get(context).changeAppMode();
                  },
                  icon: Icon(
                    Icons.dark_mode,
                    color: Colors.red,
                    size:35,
                  ),
                ),
              title: Center(
                child: Row(
                  children: [
                    Container(
                      color: Colors.red,
                      padding: EdgeInsets.all(4),
                      child: Text(
                        'FLASH',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: Colors.black,fontWeight: FontWeight.w900),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      child: Text(
                        'NEWS',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: Colors.black,fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),

              ),
              actions: [
                IconButton(
                    onPressed: ()
                    {
                       navigateto(context,SearchScreen(),);
                    },
                    icon: Icon(
                        Icons.search_outlined,
                        color: Colors.red,
                        size:35,
                    ),
                ),
              ],
            ),
            body: cubit.screens[cubit.currentindex] ,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex:cubit.currentindex,
              onTap: (index)
              {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItems,
            ),
          );
        },
      );
}
