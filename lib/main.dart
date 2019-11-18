import 'package:flutter/material.dart';
import 'auth_screen.dart';
import 'dog_model.dart';
import 'new_dog_form.dart';
import 'dog_list.dart';

void main() {
  runApp(
    new MyApp(),
  );
}

class MyApp extends StatelessWidget {
  ThemeData get _themeData => new ThemeData(
        primaryColor: Colors.blueGrey[100],
        accentColor: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[300],
      );
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Doggos Rating App',
      theme: _themeData,
      routes: {
        '/': (BuildContext context) =>
            new MyHomePage(title: 'Doggos Rating App'),
        '/auth': (BuildContext context) => new AuthScreen(),
      },
      // theme: ThemeData(brightness: Brightness.dark),
      // home: new MyHomePage(title: 'Doggos Rating App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dog> initialDoggos = []
    ..add(Dog('Ruby', 'Portland, OR, USA',
        'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
    ..add(Dog('Rex', 'Seattle, WA, USA', 'Best in Show 1999'))
    ..add(Dog('Rod Stewart', 'Prague, CZ',
        'Star good boy on international snooze team.'))
    ..add(Dog('Herbert', 'Dallas, TX, USA', 'A Very Good Boy'))
    ..add(Dog('Herbert', 'Dallas, TX, USA', 'A Very Good Boy'))
    ..add(Dog('Herbert', 'Dallas, TX, USA', 'A Very Good Boy'))
    ..add(Dog('Herbert', 'Dallas, TX, USA', 'A Very Good Boy'))
    ..add(Dog('Buddy', 'North Pole, Earth', 'Self proclaimed human lover.'));

  _showNewDogForm() async {
    // Any time you're pushing a new route and expect that route
    // to return something back to you,
    // you need to use an async function.
    // In this case, the function will create a form page
    // which the user can fill out and submit.
    // On submission, the information in that form page
    // will be passed back to this function.

    // push a new route like you did in the last section
    Dog newDog = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return AddDogFormPage();
        },
      ),
    );
    // A null check, to make sure that the user didn't abandon the form.
    if (newDog != null) {
      // Add a newDog to our mock dog array.
      initialDoggos.add(newDog);
    }
  }

  _logInPage() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return AuthScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: Colors.blueGrey[400],
        // This is how you add new buttons to the top right of a material appBar.
        // You can add as many as you'd like.
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: _showNewDogForm,
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: _logInPage,
          ),
        ],
      ),
      body: Container(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Colors.blueGrey[900],
                Colors.blueGrey[500],
                Colors.blueGrey[400],
                Colors.blueGrey[200],
              ],
            )),
            child: Center(child: DogList(initialDoggos))),
      ),
    );
  }
}
