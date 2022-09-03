import 'package:flutter/material.dart';
import 'package:flutter1/Layout/newsapp/NewsApp.dart';
import 'package:flutter1/Shared/components/components.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'News App';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> with TickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),)..addListener(()
    {
      setState(() {navigateto(context, NewsLayout());});
    });
    controller.repeat(reverse: true);
    super.initState();
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.red,
                  child: Text("FLASH",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                ),
                SizedBox(width:5),
                Container(
                  child: Text("NEWS",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                    child: Icon(Icons.newspaper_outlined,color:Colors.redAccent,size: 50,)
                ),
              ],
            ),
            SizedBox(height:30),
            LinearProgressIndicator(
              value: controller.value,
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),

    );
  }
}
