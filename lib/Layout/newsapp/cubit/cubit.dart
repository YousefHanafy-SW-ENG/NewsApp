import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/Layout/newsapp/cubit/states.dart';
import 'package:flutter1/modules/business/business_screen.dart';
import 'package:flutter1/modules/politics/politics.dart';
import 'package:flutter1/modules/science/science_screen.dart';
import 'package:flutter1/modules/settings_screen/setting_screen.dart';
import 'package:flutter1/modules/sports/sports_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit <NewsStates>
{
  NewsCubit() : super (NewsInitialState());
  
  static NewsCubit get (context) => BlocProvider.of(context);

  int currentindex = 0;

  List<BottomNavigationBarItem> bottomItems = [
           BottomNavigationBarItem (
             icon: Icon(
               Icons.business,
             ),
             label: 'Business',
           ),
           BottomNavigationBarItem (
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
           BottomNavigationBarItem (
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
    BottomNavigationBarItem (
      icon: Icon(
        Icons.newspaper,
      ),
      label: 'Politics',
    ),
  ];


    List<Widget> screens = [
        BusinessScreen(),
        SportsScreen(),
        ScienceScreen(),
        PoliticsScreen(),
    ];

   void changeBottomNavBar (int index)
   {
     currentindex = index;
     if(index==1)
       getSports();
     if(index==2)
       getScience();
     if(index==3)
       getPolitics();
     emit(NewsBottomNavState());
   }

  List<dynamic> business = [];

  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());

     DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country':'us',
        'category':'business',
        'apiKey':'055afef22626436d9c5c5abb9b93fe8d',
      },
    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      print(business[0]['title']);

      emit(NewsGetBusinessSucessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports()
  {
    emit(NewsGetSportsLoadingState());

    if(sports.length==0)
    {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'us',
          'category':'sports',
          'apiKey':'055afef22626436d9c5c5abb9b93fe8d',
        },
      ).then((value)
      {
        //print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print(sports[0]['title']);

        emit(NewsGetSportsSucessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    }  else
    {
      emit(NewsGetSportsSucessState());
    }
  }

  List<dynamic> science = [];

  void getScience()
  {
   emit(NewsGetScienceLoadingState());

    if(science.length == 0){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'us',
          'category':'science',
          'apiKey':'055afef22626436d9c5c5abb9b93fe8d',
        },
      ).then((value)
      {
        //print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0]['title']);

        emit(NewsGetScienceSucessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSucessState());
    }

  }

  List<dynamic> search = [];

  void getsearch(String value)
  {
    emit(NewsGetSearchLoadingState());

      DioHelper.getData(
        url: 'v2/everything',
        query:
        {
          'q':'$value',
          'apiKey':'055afef22626436d9c5c5abb9b93fe8d',
        },
      ).then((value)
      {
        //print(value.data['articles'][0]['title']);
        search = value.data['articles'];
        print(search[0]['title']);

        emit(NewsGetSearchSucessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSearchErrorState(error.toString()));
      });
  }

  List<dynamic> politics = [];

  void getPolitics()
  {
    emit(NewsGetPoliticsLoadingState());

    if(politics.length == 0){
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'us',
          'category':'politics',
          'apiKey':'055afef22626436d9c5c5abb9b93fe8d',
        },
      ).then((value)
      {
        //print(value.data['articles'][0]['title']);
        politics= value.data['articles'];
        print(politics[0]['title']);

        emit(NewsGetPoliticsSucessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetPoliticsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetPoliticsSucessState());
    }

  }
}