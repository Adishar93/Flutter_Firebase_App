import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:progress_dialog/progress_dialog.dart';






class MainPage extends StatefulWidget {

  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> {


  bool _obscure=true;
  bool _obscure2=true;
  final _registerFormKey = GlobalKey<FormState>();

  final nameController=TextEditingController();
  final emailController = TextEditingController();
  final phoneController=TextEditingController();
  final passController = TextEditingController();
  final confirmPassController=TextEditingController();


  void _toggleObscure()
  {
    setState(() {
      _obscure=!_obscure;
    });

  }

  void _toggleObscure2()
  {
    setState(() {
      _obscure2=!_obscure2;
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
                      child: SingleChildScrollView(

                        child: Padding(
                            padding: EdgeInsets.fromLTRB(40,40,40,150),
                            child: Card(
                                elevation: 12,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),

                                ),
                                child: Form(
                                  key:_registerFormKey,
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

                                                if(input.length>3)
                                                {
                                                  return null;
                                                }
                                                else
                                                {
                                                  return "Enter name with valid size";
                                                }
                                              },
                                              controller: nameController,

                                              decoration: InputDecoration(
                                                icon: Icon(
                                                    Icons.account_circle,
                                                    color: Colors.black,
                                                    size:30

                                                ),


                                                labelText: 'Enter full name',
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
                                          padding: EdgeInsets.fromLTRB(35, 20, 40, 20),
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
                                          padding: EdgeInsets.fromLTRB(35, 20, 40, 20),
                                          child: SizedBox(
                                            width: 250,
                                            child: TextFormField(
                                              cursorColor: Theme
                                                  .of(context)
                                                  .cursorColor,
                                              //initialValue: 'Input text',
                                              // maxLength: 20,
                                              inputFormatters: [
                                                WhitelistingTextInputFormatter.digitsOnly,
                                              ],
                                              keyboardType: TextInputType.phone,
                                              style: TextStyle(
                                                  fontSize: 20
                                              ),
                                              // autovalidate: true,
                                              validator: (input){

                                                if(input.length==10)
                                                {
                                                  return null;
                                                }
                                                else
                                                {
                                                  return "Enter valid phone number";
                                                }
                                              },
                                              controller: phoneController,

                                              decoration: InputDecoration(
                                                icon: Icon(
                                                    Icons.phone_android,
                                                    color: Colors.black,
                                                    size:30

                                                ),


                                                labelText: 'Enter phone',
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
                                          padding: EdgeInsets.fromLTRB(35,20,40,30),
                                          child: SizedBox(
                                            width: 250,
                                            child: TextFormField(
                                              obscureText: _obscure2, // Only n
                                              cursorColor: Theme
                                                  .of(context)
                                                  .cursorColor,
                                              //initialValue: 'Input text',
                                              // maxLength: 20,
                                              style: TextStyle(
                                                  fontSize: 20
                                              ),
                                              controller: confirmPassController,
                                              validator: (input){
                                                if(input.length<6)
                                                {
                                                  return "Length of password less than 6";
                                                }
                                                else if(passController.text.length>5&&passController.text!=confirmPassController.text)
                                                  {
                                                    return "Passwords don't match";
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

                                                labelText: 'Confirm Password',
                                                labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                // helperText: 'Helper text',
                                                suffixIcon: IconButton(
                                                  icon:
                                                  Icon(Icons.remove_red_eye)
                                                  ,
                                                  onPressed: _toggleObscure2,
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
                                              onPressed: () async{
                                                FocusScope.of(context).requestFocus(new FocusNode());
                                                if (_registerFormKey.currentState.validate()) {
                                                  // If the form is valid, display a snackbar. In the real world,
                                                  // you'd often call a server or save the information in a database.

                                                  ProgressDialog registering_loading=ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
                                                  registering_loading.style(
                                                      message: ' Registering',
                                                      borderRadius: 10.0,
                                                      progressWidget: CircularProgressIndicator(),
                                                      padding: EdgeInsets.all(25),
                                                      backgroundColor: Colors.white,
                                                      elevation: 10.0,
                                                      insetAnimCurve: Curves.easeInOut,

                                                      messageTextStyle: TextStyle(
                                                          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
                                                  );

                                                  registering_loading.show();
                                                  // Scaffold
                                                  //     .of(context)
                                                  //     .showSnackBar(SnackBar(content: Text('Form Validated Successfully!'),elevation: 20,backgroundColor: Color(0xFFcc7a00),));

                                                  try {
                                                    //final Future<FirebaseApp> _initialization = Firebase.initializeApp();
                                                    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                                        email: emailController.text,
                                                        password: passController.text,
                                                    );
                                                    registering_loading.hide();

                                                    Navigator.pop(context,"Registered Successfully");
                                                  } on FirebaseAuthException catch (e) {
                                                    if (e.code == 'weak-password') {
                                                      registering_loading.hide();

                                                      Scaffold
                                                          .of(context)
                                                      ..removeCurrentSnackBar()
                                                          ..showSnackBar(SnackBar(content: Text("The password provided is too weak."),elevation: 20,backgroundColor: Color(0xFFcc7a00),));
                                                      //print('No user found for that email.');
                                                    } else if (e.code == 'email-already-in-use') {
                                                      registering_loading.hide();

                                                      Scaffold
                                                          .of(context)
                                                      ..removeCurrentSnackBar()
                                                          ..showSnackBar(SnackBar(content: Text("The account already exists for that email."),elevation: 20,backgroundColor: Color(0xFFcc7a00),));
                                                      //print('Wrong password provided for that user.');
                                                    }
                                                    else
                                                    {
                                                      registering_loading.hide();

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
                                              child: Text('REGISTER',
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
                        ),
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

