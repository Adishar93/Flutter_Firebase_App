import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_algo_anim_app/register.dart';
import 'package:progress_dialog/progress_dialog.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
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
            home: ErrorPage(title: 'Money Transaction'),
          );

        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
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

        // Otherwise, show something whilst waiting for initialization to complete
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
          home: LoadingPage(title: 'Money Transaction'),
        );
      },
    );

  }
}

ProgressDialog _initialLoading;

class LoadingPage extends StatefulWidget {

  LoadingPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoadingPageState createState() => _LoadingPageState();

}

class _LoadingPageState extends State<LoadingPage>{

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) =>
      initializeProgressDialog()

    );
  }

  void initializeProgressDialog()
  {
    _initialLoading=ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
    _initialLoading.style(
        borderRadius: 10.0,
        padding: EdgeInsets.all(25),
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
    );

    _initialLoading.show();
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

      body:Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.fill
          ),
        ),

      ),

    );
  }
  
}

class ErrorPage extends StatefulWidget {

  ErrorPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ErrorPageState createState() => _ErrorPageState();

}

class _ErrorPageState extends State<ErrorPage>{


  @override
  Widget build(BuildContext context) {
    if(_initialLoading!=null)
      {
        _initialLoading.hide();
      }

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      resizeToAvoidBottomPadding: false,

      body:
        Container(
          width:double.infinity,
          height: double.infinity,
          child: Center(
            child:Text("Sorry! Firebase Error Occured!",
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),),
          ),
        )


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

  final emailController = TextEditingController();
  final passController = TextEditingController();


  void _toggleObscure()
  {
    setState(() {
      _obscure=!_obscure;
    });

  }


  @override
  Widget build(BuildContext context) {
    if(_initialLoading!=null)
    {
      _initialLoading.hide();
    }

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
                                        controller: emailController,

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
                                        controller: passController,
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
                                  padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                                  child:MaterialButton(
                                    height: 45,
                                    textColor: Colors.white,
                                    color: Colors.amber,
                                    onPressed: () async{
                                      FocusScope.of(context).requestFocus(new FocusNode());
                                      if (_loginFormKey.currentState.validate()) {
                                        // If the form is valid, display a snackbar. In the real world,
                                        // you'd often call a server or save the information in a database.

                                        ProgressDialog loging_in=ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
                                        loging_in.style(
                                          message: ' Loging In',
                                            borderRadius: 10.0,
                                            progressWidget: CircularProgressIndicator(),
                                            padding: EdgeInsets.all(25),
                                            backgroundColor: Colors.white,
                                            elevation: 10.0,
                                            insetAnimCurve: Curves.easeInOut,

                                            messageTextStyle: TextStyle(
                                                color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
                                        );

                                        loging_in.show();
                                        // Scaffold
                                        //     .of(context)
                                        //     .showSnackBar(SnackBar(content: Text('Form Validated Successfully!'),elevation: 20,backgroundColor: Color(0xFFcc7a00),));

                                        try {
                                          //final Future<FirebaseApp> _initialization = Firebase.initializeApp();
                                          UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                              email: emailController.text,
                                              password: passController.text
                                           );
                                          loging_in.hide();
                                          Scaffold
                                              .of(context)
                                          ..removeCurrentSnackBar()
                                              ..showSnackBar(SnackBar(content: Text("Signed In Successfully!"),elevation: 20,backgroundColor: Color(0xFFcc7a00),));
                                        } on FirebaseAuthException catch (e) {
                                          if (e.code == 'user-not-found') {
                                            loging_in.hide();

                                            Scaffold
                                                .of(context)
                                            ..removeCurrentSnackBar()
                                                ..showSnackBar(SnackBar(content: Text("Email Address not registered"),elevation: 20,backgroundColor: Color(0xFFcc7a00),));
                                            //print('No user found for that email.');
                                          } else if (e.code == 'wrong-password') {
                                            loging_in.hide();

                                            Scaffold
                                                .of(context)
                                            ..removeCurrentSnackBar()
                                                ..showSnackBar(SnackBar(content: Text("Wrong password"),elevation: 20,backgroundColor: Color(0xFFcc7a00),));
                                            //print('Wrong password provided for that user.');
                                          }
                                          else
                                            {
                                              loging_in.hide();

                                              Scaffold
                                                  .of(context)
                                              ..removeCurrentSnackBar()
                                                  ..showSnackBar(SnackBar(content: Text("Unexpected error occured!"),elevation: 20,backgroundColor: Color(0xFFcc7a00),));
                                              //print('Firebase Error'+e.toString());
                                            }
                                        }
                                      }
                                      else{
                                        Scaffold
                                            .of(context)
                                        ..removeCurrentSnackBar()
                                            ..showSnackBar(SnackBar(content: Text("Errors in Form"),elevation: 20,backgroundColor: Color(0xFFcc7a00),));
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
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                                    child:FlatButton(
                                      textColor: Color(0xFFcc7a00),
                                      onPressed: () async {

                                        final result = await  Navigator.of(context).push(_openRegisterCreateRoute());

                                        // After the Selection Screen returns a result, hide any previous snackbars
                                        // and show the new result.
                                        if(result!=null) {
                                          Scaffold.of(context)
                                            ..removeCurrentSnackBar()
                                            ..showSnackBar(SnackBar(
                                                content: Text("$result"),elevation: 20,backgroundColor: Color(0xFFcc7a00),));
                                        }

                                        // Respond to button press
                                      },
                                      child: Text("Click Here to Register",
                                      style:TextStyle(
                                        fontSize: 15
                                      )),
                                    )
                                  )

                                ]
                            ),
                          )


                      )
                  ),


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

  Route _openRegisterCreateRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => RegisterPage(title:"Money Transaction"),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        // var begin=0.0;
        // var end=1.0;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          //position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

}

