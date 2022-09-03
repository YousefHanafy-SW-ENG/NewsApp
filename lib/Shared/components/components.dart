import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/Shared/cubit/cubit.dart';
import 'package:flutter1/modules/webview/web_view_screen.dart';

Widget defaultButton({
   double width = double.infinity,
    Color background = Colors.blue ,
    bool isUpperCase = true,
    double radius = 10.0,
   required Function function,
   required String text,
}) => Container(
  width: width,
  color: background,
  child: MaterialButton(
      onPressed: function (),
      child: Text (
          isUpperCase ? text.toUpperCase() : text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      )
  ),
);
// Widget defaultFormField ({
//   required TextEditingController controller,
//   required TextInputType type,
//   Function? onSubmit,
//   Function? onChange,
//   Function?  onTap,
//   bool isPassword = false,
//   required Function validate,
//   required String label,
//   required IconData prefix,
//   IconData? suffix,
//   Function? suffixPressed,
// }) => TextFormField(
//   controller: controller,
//   keyboardType: type,
//   obscureText: isPassword,
// );
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
    // onFieldSubmitted: onSubmit,
     // onChanged: onChange,
      //onTap: onTap,
       //validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: (){},
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: OutlineInputBorder(),
      ),
    );
Widget buildTaskItem(Map model, context) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      CircleAvatar(
        radius:40.0,
        child: Text(
          '${model['time']}',
        ),

      ),
      SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${model['title']}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '2 april, 2021 ',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        width: 20.0,
      ),
      IconButton(
          onPressed: ()
          {
             AppCubit.get(context).updateData(
               status: 'done',
               id: model['id'],
             );
          },
          icon: Icon(
            Icons.check_box,
            color: Colors.green,
          ),
      ),
      IconButton(
        onPressed: ()
        {
          AppCubit.get(context).updateData(
            status: 'archive',
            id: model['id'],
          );
        },
        icon: Icon(
          Icons.archive,
          color: Colors.black45,
        ),
      ),
    ],
  ),
);
Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 30.0,
    end: 30.0,
  ),
  child: Container(
    width: double.infinity,
    height: 3.0,
    color: Colors.red,
  ),
);

Widget buildArticleItem(article,context) => InkWell(
  onTap: (){
   navigateto(context, WebViewScreen(article['url']),);
  },
  child:   Padding(
  
    padding: const EdgeInsets.all(20.0),
  
    child:Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
       border: Border.all(color: Colors.red,width: 4 ),
       borderRadius: BorderRadius.circular(30) 
      ),
      child: Row(

        children: [

          Container(

            width: 120,

            height: 120,

            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(20.0,),

              image: DecorationImage(

                image:NetworkImage('${article['urlToImage']}'),

                fit: BoxFit.cover,

              ),

            ),

          ),

          SizedBox(

            width: 20,

          ),

          Expanded(

            child: Container(

              height: 120,

              child:Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                mainAxisAlignment: MainAxisAlignment.start,

                children:

                [

                  Expanded(

                    child: Text(

                      '${article['title']}',

                      style: Theme.of(context).textTheme.bodyText1,

                      maxLines: 3,

                      overflow: TextOverflow.ellipsis,

                    ),

                  ),

                  Text(

                    '${article['publishedAt']}',

                    style: Theme.of(context).textTheme.bodyMedium,

                  ),

                ],

              ),

            ),

          )

        ],

      ),
    ),
  
  ),
);

Widget articleBuilder(list,context,{isSearch = false}) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) =>
      ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder:(context,index) => buildArticleItem(list[index],context),
        separatorBuilder: (context,index) => myDivider(),
        itemCount: 10,),
  fallback: (context) => isSearch ? Container() : Center(child: CircularProgressIndicator()),
);

void navigateto(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
