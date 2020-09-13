import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.amber,
        cursorColor: Colors.amber,
        fontFamily: 'Comfortaa',
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Money Transaction'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  bool _obscure=true;
  final _loginFormKey = GlobalKey<FormState>();

  void _toggleObscure()
  {
    setState(() {
      _obscure=!_obscure;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
      resizeToAvoidBottomPadding: false,

        body:
        Builder(
          builder: (context)=>
           Stack(
            children: [Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg.jpg"),
                    fit: BoxFit.fill
                ),
              ),

            ),

              Center(
                  child: Padding(
                      padding: EdgeInsets.all(40),
                      child: Card(
                        elevation: 12,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),

                          ),
                          child: Form(
                            key:_loginFormKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(35, 40, 40, 20),
                                    child: SizedBox(
                                      width: 250,
                                      child: TextFormField(
                                        cursorColor: Theme
                                            .of(context)
                                            .cursorColor,
                                        //initialValue: 'Input text',
                                        // maxLength: 20,
                                        style: TextStyle(
                                            fontSize: 20
                                        ),
                                        // autovalidate: true,
                                        validator: (input){
                                          bool result=RegExp(
                                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                              .hasMatch(input);
                                          if(result)
                                          {
                                            return null;
                                          }
                                          else
                                          {
                                            return "Enter a valid email address";
                                          }
                                        },
                                        decoration: InputDecoration(
                                          icon: Icon(
                                              Icons.mail,
                                            color: Colors.black,
                                            size:25

                                          ),


                                          labelText: 'Enter email',
                                          labelStyle: TextStyle(
                                            color: Colors.grey,
                                          ),
                                          // helperText: 'Helper text',
                                          // suffixIcon: Icon(
                                          //   Icons.check_circle,
                                          // ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(35,20,40,30),
                                    child: SizedBox(
                                      width: 250,
                                      child: TextFormField(
                                       obscureText: _obscure, // Only n
                                        cursorColor: Theme
                                            .of(context)
                                            .cursorColor,
                                        //initialValue: 'Input text',
                                        // maxLength: 20,
                                        style: TextStyle(
                                            fontSize: 20
                                        ),
                                        validator: (input){
                                         if(input.length<6)
                                           {
                                             return "Length of password less than 6";
                                           }
                                         else
                                           {
                                             return null;
                                           }
                                        },
                                        decoration: InputDecoration(
                                          icon: Icon(
                                              Icons.vpn_key,
                                            size:30,
                                            color: Colors.black,

                                          ),

                                          labelText: 'Password',
                                          labelStyle: TextStyle(
                                            color: Colors.grey,
                                          ),
                                          // helperText: 'Helper text',
                                          suffixIcon: IconButton(
                                              icon:
                                           Icon(Icons.remove_red_eye)
                                          ,
                                            onPressed: _toggleObscure,
                                          ),

                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(30, 30, 30, 50),
                                  child:MaterialButton(
                                    height: 45,
                                    textColor: Colors.white,
                                    color: Colors.amber,
                                    onPressed: () {
                                      if (_loginFormKey.currentState.validate()) {
                                        // If the form is valid, display a snackbar. In the real world,
                                        // you'd often call a server or save the information in a database.

                                        Scaffold
                                            .of(context)
                                            .showSnackBar(SnackBar(content: Text('Form Validated Successfully!'),elevation: 20,backgroundColor: Color(0xFFcc7a00),));
                                      }
                                      else{
                                        Scaffold
                                            .of(context)
                                            .showSnackBar(SnackBar(content: Text("Errors in Form"),elevation: 20,backgroundColor: Color(0xFFcc7a00),));
                                      }
                                      // Respond to button press
                                    },
                                    child: Text('LOGIN',
                                    style:TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    )),
                                  )
                                ),

                                ]
                            ),
                          )


                      )
                  )

              )


            ],
          ),
        )


      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add_comment),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

