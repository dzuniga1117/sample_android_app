import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Constants
const MaterialColor main_color = Colors.orange;
const String status = 'PASSED';

// Global counter
// int curRating = 0;

// Main app
void main() {
  runApp(MyApp());
}

// Root of the app, creates the base app that holds the home page
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vibe Check Pass',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// The home page of the app; broken down into three pieces:
// - user image
// - split columns with name, status, rating
// - bottom navigation bar with a list of items
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int cur_rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: main_color[100],
      appBar: AppBar(
        title: Text('Vibe Check Pass'),
        backgroundColor: main_color[600],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Column(
              children: <Widget>[
                Container(
                  // Keep in mind that this requires a change to the
                  // pubspec.yaml file
                  child: Image.asset('assets/Noseyface.png'),
                  height: 400.0,
                ),
                Divider(
                  color: main_color,
                  height: 20.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                    Column(
                      children: <Widget> [
                        Text(
                            'NAME',
                            style: TextStyle(
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                        Text(
                            'Nose Man',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontStyle: FontStyle.italic,
                            )
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                            'STATUS',
                            style: TextStyle(
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                        Text(
                            (cur_rating >= 30 ? "PASSED" : "FAILED"),
                            style: TextStyle(
                              fontSize: 20.0,
                              color: cur_rating >= 30 ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ]
                    ),
                    Column(
                      children: <Widget> [
                        Text(
                          'RATING',
                          style: TextStyle(
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                        Text(
                          '$cur_rating',
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          )
                        ),
                      ]
                    ),
                  ]
                )
              ],
            )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            cur_rating++;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: main_color,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: main_color,
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye),
            label: 'Spy',
          )
        ],
      ),
    );
  }
}

// class RatingButton extends StatefulWidget {
//   const RatingButton({Key? key}) : super(key: key);
//
//   @override
//   _RatingButtonState createState() => _RatingButtonState();
// }
//
// class _RatingButtonState extends State<RatingButton> {
//   int curRating = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             curRating++;
//           });
//         }
//     );
//   }
// }
