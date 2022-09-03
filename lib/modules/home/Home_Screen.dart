import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
  List<int> i = [3,5,4];
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          'FirstApp',
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notification_important,
            ),
            onPressed: onNotification,
          ),
          IconButton(onPressed: ()
          {
            print("Hell");
          },
            icon: Text(
              'Hell',
            ),
          ),

        ],

      ),
      body: Column(
        children: 
        [
           Padding(
             padding: const EdgeInsets.all(50.0),
             child: Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(
                   20.0,
                 ),
               ),
               clipBehavior: Clip.antiAliasWithSaveLayer,
               child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image(
                      image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg'
                      ),
                      height: 200.0,
                      width: 200.0,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.black.withOpacity(.7),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: Text(
                        'Flower',
                        textAlign: TextAlign.center,

                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
             ),
           ),

        ],
      ),

    );

  }
  void onNotification()
  {
    print('notification Clicked');
  }
}