import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Please Login'),
    );
  }
}

class MyHomePage extends StatefulWidget
{

    MyHomePage({Key key, this.title}) : super(key: key);
    final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

      
      body:
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
                child:Padding(
                  padding: EdgeInsets.all(40),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),

                    ),
                    child:Padding(
                      padding: EdgeInsets.all(30),
                      child: TextFormField(
                        cursorColor: Theme.of(context).cursorColor,
                        //initialValue: 'Input text',
                        maxLength: 20,
                        style: TextStyle(
                          fontSize: 23
                        ),
                        decoration: InputDecoration(
                          // icon: Icon(Icons.favorite),
                          labelText: 'Label text',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          helperText: 'Helper text',
                          suffixIcon: Icon(
                            Icons.check_circle,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                          ),
                        ),
                      ),
                    )

                  )
                )

            )



        ],
      )




      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add_comment),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

