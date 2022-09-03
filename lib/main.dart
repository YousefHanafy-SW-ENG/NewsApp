import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter1/Layout/homelayout.dart';
import 'package:flutter1/Layout/newsapp/NewsApp.dart';
import 'package:flutter1/Layout/newsapp/cubit/cubit.dart';
import 'package:flutter1/Shared/cubit/cubit.dart';
import 'package:flutter1/Shared/cubit/states.dart';
import 'package:flutter1/Shared/network/local/cashe_helper.dart';
import 'package:flutter1/Shared/network/remote/dio_helper.dart';
import 'package:flutter1/assignemnt.dart';
import 'package:flutter1/modules/Login@.dart';
import 'package:flutter1/modules/home/Home_Screen.dart';
import 'package:flutter1/modules/messanger/Messenger_Screen.dart';
import 'package:flutter1/modules/bmi_result/bmi_result_sceen.dart';
import 'package:flutter1/modules/new_tasks/new_tasks_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Shared/block_observer.dart';
import 'modules/bmi/BMI_Screen.dart';
import 'modules/counter/Counter_Screen.dart';
import 'modules/first_news_screen/first_news_screen.dart';
import 'modules/login/Login_Screen.dart';

void main()  async
{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.GetBoolean(key: "isDark");
  runApp(Myapp(isDark!));

}


// stateless
// stateful


// class Myapp

class Myapp extends StatelessWidget
{
  late final bool isDark;

  Myapp(this.isDark, {Key? key}) : super(key: key);

  // constructor
  // build
  @override
  Widget build(BuildContext context)
  {


    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit()..getBusiness()..getSports()..getScience()),
        BlocProvider(create: (BuildContext context) => AppCubit()..changeAppMode(
          fromShared: isDark,
        ),
        ),
      ],
      child: BlocConsumer<AppCubit, ApppStates>(
        listener: (context,state) {},
        builder:  (context,state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.grey,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  titleSpacing: 20,
                  backwardsCompatibility: false,
                  backgroundColor: Colors.white12,
                  elevation: 0.0,
                  iconTheme: IconThemeData(
                    color: Colors.black,
                    size: 30,
                  ),
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.red,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange,
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  //type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.red,
                  elevation: 20,
                  unselectedItemColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )
                ),
              ),
              themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
              darkTheme: ThemeData(
                scaffoldBackgroundColor: HexColor('333739'),
                primarySwatch: Colors.red,
                appBarTheme: AppBarTheme(
                  titleSpacing: 20,
                  backwardsCompatibility: false,
                  backgroundColor: HexColor('333739'),
                  elevation: 0.0,
                  iconTheme: IconThemeData(
                    color: Colors.white,
                    size: 30,
                  ),
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('333739'),
                    statusBarIconBrightness: Brightness.light,
                  ),
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange,
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.red,
                  elevation: 20,
                  unselectedItemColor: Colors.black.withAlpha(100),
                  backgroundColor: HexColor('333739'),

                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    )
                ),
              ),
              home: Directionality(
                textDirection: TextDirection.ltr,
                child: NewsLayout(),
              )
          );
        },
      ),
    );
  }
}
