import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login UI',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Stack(
          children:<Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration:BoxDecoration(
                image: DecorationImage(
                  image:ExactAssetImage('images/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: _buildColumn(context),
              ),
            ),
          ]
        ),
      ),
    );
  }

  Column _buildColumn(BuildContext context) {
    return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Image.asset('images/dhoond.png',scale: 1.3,),
                      ),
                    ],
                  ),

                  SizedBox(height: 10,),

                  Text('Sign in',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.indigo),),

                  SizedBox(height: 20),

                  Container(
                    height: 60,
                    padding: EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width-44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.indigo),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        icon: Icon(Icons.email),
                        focusColor: Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(height: 15,),

                  Container(
                    height: 60,
                    padding: EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width-44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.indigo),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        icon: Icon(Icons.lock_outline),
                        suffixIcon: Icon(Icons.remove_red_eye),
                      ),
                      obscureText: true,
                    ),
                  ),

                  SizedBox(height: 15,),

                  FlatButton(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('Login',style: TextStyle(color: Colors.white),),
                    ),
                    onPressed: (){},
                    color: Colors.indigo,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                  ),

                  SizedBox(height: 5,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Opacity(
                        opacity: 0,
                        child: Text('Forgot Password?'),
                      ),
                      Container(
                        child: Text('Forgot Password?',style: TextStyle(color: Colors.indigo),),
                      ),
                    ],
                  ),

                  SizedBox(height: 15,),

                  Row(
                    children: <Widget>[
                      SizedBox(width:MediaQuery.of(context).size.width*0.4,child: Divider(thickness: 1.5,)),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('or',textAlign: TextAlign.center,),
                      ),
                      SizedBox(width:MediaQuery.of(context).size.width*0.4,child: Divider(thickness: 1.5,)),
                    ],
                  ),
                  SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Image.asset('images/facebook.png',color: Colors.blue,)),
                      SizedBox(width: 20,),
                      CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Image.asset('images/google-logo.png',scale: 1,)),
                    ],
                  ),

                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Don\'t have an Acoount?',textAlign: TextAlign.center,),
                      SizedBox(width: 5,),
                      Text('Sign Up',style: TextStyle(color: Colors.indigo,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ],
              );
  }
}
