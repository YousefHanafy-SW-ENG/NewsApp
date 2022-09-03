import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class assignemnt extends StatelessWidget {
  const assignemnt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              alignment: Alignment.center,
             padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(
                  color: Colors.black,
                  width: 8,
                ),
              ),
              child: Text(
                'Strawberry Pavlova Recipe',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Pavlova is a meringue-based dessert '
                    'named after the Russian ballerina Anna'
                    ' Pavolva. Pavolva feautures a crisp crust and '
                    'soft, light inside,topped with the fruit and'
                    ' whipped cream',


              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Container(
              padding: EdgeInsets.all(40),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
              ),
              child:Column(
                children: [
                  Center(
                    child: Row(
                      children: [
                        Icon(Icons.star_rate),
                        Icon(Icons.star_rate),
                        Icon(Icons.star_rate),
                        Icon(Icons.star_rate),
                        Icon(Icons.star_rate),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          '17 review',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.food_bank_sharp,size: 46,),
                      SizedBox(
                        width:50,
                      ),
                      Icon(Icons.no_food,size: 46,),
                      SizedBox(
                        width:50,
                      ),
                      Icon(Icons.no_food,size: 46,),

                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Feed',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        width:60,
                      ),
                      Text(
                        'Feed',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        width:55,
                      ),
                      Text(
                        'Feed',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        '2 - 4',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        width:65,
                      ),
                      Text(
                        '2 - 4',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        width:60,
                      ),
                      Text(
                        '2 - 4',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),

                    ],
                  ),
                ],
              ) ,
            ),
          ),



        ],
      ),
    );

  }
}
