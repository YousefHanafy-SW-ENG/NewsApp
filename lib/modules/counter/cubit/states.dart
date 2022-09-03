import 'package:flutter1/Shared/cubit/states.dart';

abstract class CounterStates {}

class CounterInitialState extends CounterStates {}

class CounterPlusState extends CounterStates {}

class CounterMinusState extends CounterStates {}

class AppChangeBottomNavBarState extends ApppStates{}

class AppCreateDatabaseState extends ApppStates {}

class AppGetDatabaseState extends ApppStates {}

class AppInsertDatabaseState extends ApppStates {}

class AppChangeBottomSheetState extends ApppStates{}

class AppGetDatabaseLoadingState extends ApppStates {}

class AppUpdateDatabaseState extends ApppStates {}

class AppChangeModeState extends ApppStates{}