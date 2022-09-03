import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/Shared/cubit/states.dart';
import 'package:flutter1/Shared/network/local/cashe_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import '../../modules/archived_tasks/archived_tasks_screen.dart';
import '../../modules/counter/cubit/states.dart';
import '../../modules/done_tasks/done_tasks_screen.dart';
import '../../modules/new_tasks/new_tasks_screen.dart';

class AppCubit extends Cubit<ApppStates>
{
  AppCubit() : super (AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex= 0;
  List<Widget> screens =
  [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  List<String> titles =
  [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  void changeIndex (int index)
  {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  late Database database ;
  List<Map> newtasks =[];
  List<Map> donetasks =[];
  List<Map> Archivedtasks =[];


  void createDatabase()
  {
     openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version)
      {
        // id integer
        // title String
        // date String
        // time String
        // status String

        print('database created');
        database.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT,  time TEXT) ').then((value)
        {
          print('table created');
        }).catchError((error){
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database)
      {
        getDatafromDatabase(database);
        print('database opened');
      },
    ) .then((value)
    {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  Future insertToDatabase({
    @required title,
    @required time,
  }) async
  {
    await database.transaction((txn)
    {
      txn.rawInsert('INSERT INTO tasks(title,  time) VALUES("$title",  "$time" )'
      ).
      then((value)
      {
        print('$value inserted succesfully');
        emit(AppInsertDatabaseState());

        getDatafromDatabase(database);
      }).catchError((error) {
        print('Error When Creating New Record ${error.toString()}');
      });
      return null;
    });
  }

  void getDatafromDatabase(database)
  {

    newtasks = [];
    donetasks = [];
    Archivedtasks = [];
    emit(AppGetDatabaseLoadingState());

     database.rawQuery('SELECT * FROM tasks').then((value)
     {
       // value.forEach((element)
       // {
       //   if (element ['status'] == 'new' )
       //      { newtasks.add(element);}
       //    else if (element['status'] == 'done')
       //         {donetasks.add(element);}
       //    else Archivedtasks.add(element);
       // });
       emit(AppGetDatabaseState());
     });
  }

  void updateData({
  required String status,
  required int id,
}) async
  {
    database.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
     [ '$status' , id],
    ).then((value)
    {
      getDatafromDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetsState({
    required bool isShow,
    required IconData icon,
  })
  {
    isBottomSheetShown = isShow;
    fabIcon = icon;

    emit(AppChangeBottomSheetState());

  }

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    }
    else
      {isDark = !isDark;
    CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value)
    {
      emit(AppChangeModeState());
    });}

}

}