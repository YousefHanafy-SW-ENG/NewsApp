import 'package:flutter/material.dart';
import 'package:flutter1/Shared/components/components.dart';

// reusable components

// 1. timing
// 2. refactor
// 3. quality
// 4. Clean Code

class LoginScreen extends StatelessWidget {
 // const LoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var PasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Text(
                    'Login',
                     style: TextStyle(
                       fontSize: 40.0,
                       fontWeight: FontWeight.bold,
                     ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: ( String value)
                    {
                      print(value);
                    },
                    onChanged: (String value)
                    {
                      print(value);
                    },
                    validator: (value )
                    {
                      if(value!.isEmpty)
                        {
                          return 'email address must not be empty' ;
                        }
                      return null;
                    },
                    decoration: InputDecoration(
                     labelText: "Email Address",
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: PasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onFieldSubmitted: ( String value)
                    {
                      print(value);
                    },
                    onChanged: (String value)
                    {
                      print(value);
                    },
                    validator: (value)
                    {
                      if (value!.isEmpty)
                        {
                             return 'password must not be empty';
                        }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      suffixIcon: Icon(
                      Icons.remove_red_eye,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    text: 'LOGIN',
                    background: Colors.blue,
                    function: ()
                      {
                         if (formKey.currentState!.validate())
                           {
                             print(emailController.text);
                             print(PasswordController.text);
                           }
                      },
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Register Now',
                          ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
