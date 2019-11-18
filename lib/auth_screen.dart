import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  AuthScreenState createState() {
    return new AuthScreenState();
  }
}

class AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    // new page needs scaffolding!
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text('Log in Page'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          width: width,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new RaisedButton(
                onPressed: () => print('login'),
                color: Colors.white,
                child: new Container(
                  width: 230.0,
                  height: 50.0,
                  alignment: Alignment.center,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: new Image.network(
                          'https://blog.hubspot.com/hubfs/image8-2.jpg',
                          width: 60.0,
                        ),
                      ),
                      new Text(
                        'Sign in With Google',
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
