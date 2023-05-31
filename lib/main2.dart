import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Icon> score = [];
  var calcer = 0;
  List<String> questions =[
    'You can lead a cow down stairs but not up stairs.',
     'Approximately one quarter of human bones are in the feet.',
      'A slug\'s blood is green.'
  ];



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text("Quizzler App"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Center(
                  child: Text(

                    questions[calcer],

                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ),
            ),

            Expanded(
              // flex: 5
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    setState(() {
                      // score.add(
                      //   Icon(
                      //     Icons.check,
                      //     color: Colors.green,
                      //   ),
                      // );
                    });
                  },
                  child: Text(
                    'True',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              // flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      // score.add(
                      //   Icon(
                      //     Icons.close,
                      //     color: Colors.red,
                      //   ),
                      // );
                    });
                  },
                  child: Text(
                    'False',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              // flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.redAccent,
                  ),
                  onPressed: () {
                    setState(() {
                      score.clear();
                      // score.add(
                      //   Icon(
                      //     Icons.close,
                      //     color: Colors.red,
                      //   ),
                      // );
                    });
                  },
                  child: Text(
                    'clear answers',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
            ),

            Row(
              children: score,
            )
          ],
        ),
      ),
    );
  }
}
/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/