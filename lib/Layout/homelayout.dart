import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/Shared/components/components.dart';
import 'package:flutter1/Shared/cubit/cubit.dart';
import 'package:flutter1/Shared/cubit/states.dart';
import 'package:flutter1/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:flutter1/modules/counter/cubit/states.dart';
import 'package:flutter1/modules/done_tasks/done_tasks_screen.dart';
import 'package:flutter1/modules/new_tasks/new_tasks_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import '../Shared/components/constants.dart';

class HomeLayout extends StatelessWidget
  {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  return BlocProvider(
    create: (BuildContext context) =>AppCubit()..createDatabase(),
    child: BlocConsumer<AppCubit, ApppStates>(
      listener: (BuildContext context, ApppStates state) {
        if (state is AppInsertDatabaseState)
          {
            Navigator.of(context);
          }
      },
      builder:  (BuildContext context, ApppStates state)
      {
        AppCubit cubit = AppCubit.get(context);

        return  Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
          ),
          body: ConditionalBuilder(
            condition: state is! AppGetDatabaseLoadingState,
            builder: (context)=>cubit.screens[cubit.currentIndex],
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: ()
            {
              if (cubit.isBottomSheetShown) {
                if (formKey.currentState!.validate())
                {
                  cubit.insertToDatabase(title: titleController.text, time: timeController.text);
                //  insertToDatabase(
                  //  title: titleController.text,
                   // time: timeController.text,
                 // ).then((value)
                 // {
                  //  getDatafromDatabase(database).then((value)
                   // {
                     // Navigator.pop(context);
                      //setState(()
                      //{
                      //isBottomSheetShown = false;
                      //fabIcon=Icons.edit;
                      //tasks=value;
                      //print(tasks);
                      //});
                    // });
                   // });
                }
              }
              else
              {
                scaffoldKey.currentState?.showBottomSheet(
                      (context) => Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children:
                        [
                          TextFormField(
                            controller: titleController,
                            keyboardType: TextInputType.text,
                            validator: (value )
                            {
                              if(value!.isEmpty)
                              {
                                return 'Task Title must not be empty' ;
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Task Title",
                              prefixIcon: Icon(
                                Icons.title,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            controller: timeController,
                            keyboardType: TextInputType.datetime,
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                timeController.text= value!.format(context).toString();
                                print(value.format(context));
                              });
                            },
                            validator: (value )
                            {
                              if(value!.isEmpty)
                              {
                                return 'Task Time must not be empty' ;
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Task Time",
                              prefixIcon: Icon(
                                Icons.watch_later_outlined,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            controller: dateController,
                            keyboardType: TextInputType.datetime,
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse('2022-09-05'),
                              ).then((value) {
                                dateController.text=DateFormat.yMMMd().format(value!);
                                print(DateFormat.yMMMd().format(value));
                              });
                            },
                            validator: (value )
                            {
                              if(value!.isEmpty)
                              {
                                return 'Task Date must not be empty' ;
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Task Date",
                              prefixIcon: Icon(
                                Icons.calendar_today,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  elevation: 20.0,
                ).closed.then((value)
                {
                  cubit.changeBottomSheetsState(
                      isShow: false,
                      icon: Icons.edit
                  );
                });
                cubit.changeBottomSheetsState(
                    isShow: true,
                    icon: Icons.add
                );
              }

            },
            child: Icon(
              cubit.fabIcon,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar (
            type: BottomNavigationBarType.fixed,
            currentIndex:cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeIndex(index);
            },
            items:
            [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu,
                ),
                label: 'Tasks',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.check_circle_outline,
                ),
                label: 'Done',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.archive_outlined,
                ),
                label: 'Archived',
              ),
            ],
          ),
        );
      },
    ),
  );
  }
  // Instance of 'Future<String>
  Future <String> getName() async
  {
  return'Ahmed Ali';
  }


}



//1. create database
//2. create table
//3. open database
//4. insert to database
//5. get from database
//6.update in database
//7. delete from database




