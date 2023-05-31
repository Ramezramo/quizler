import 'package:flutter/material.dart';
// import 'questions.dart';
import 'Quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quizbrain quizbrain = Quizbrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: UniqueKey(),
      navigatorKey: navigatorKey,

      // theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Color(0xFF1F1F23),
        appBar: AppBar(
          backgroundColor: Color(0xFF1A191E),
          title: Text('destni by ramez'),
          actions: [
            IconButton(
              icon: Icon(Icons.restart_alt_outlined),
              onPressed: () {
                quizbrain.restart();
                // Action to perform when the button is pressed
                navigatorKey.currentState?.pushReplacement(
                  MaterialPageRoute(builder: (context) => Quizzler()),

                );
              },
            ),
          ],
        ),
        body: QuizPage(),
      ),
    );
    //
    //
    // return MaterialApp(
    //   home: Scaffold(
    //     backgroundColor: Colors.blueGrey,
    //     body: SafeArea(
    //       child: Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 10.0),
    //         child: QuizPage(),
    //       ),
    //     ),
    //   ),
    // );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> score = [  Icon(
    Icons.add_circle,
    color: Colors.black38,
  ),];
  // score.add(
  // Icon(
  // Icons.close,
  // color: Colors.red,
  // ),
  // ),
  void checker(){
    if (score.length-1 == quizbrain.questions_num()! - 2) {
      thealert();
    }
  }
  int right_points = 0;
  int false_points = 0;
  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  //   'hi i\'am ramez \nare you a new \nuser ?',
  //   'are you ok '
  // ];
  // Question q1 = Question('You can lead a cow down stairs but not up stairs.', false);
  // Question q2 = Question('Approximately one quarter of human bones are in the feet.',true);
  // // Question q3 = Question('A slug\'s blood is green.',true);
  // List<Question> questions_premium = [
  //                   Question('You can lead a cow down stairs but not up stairs.', false),
  //                   Question('Approximately one quarter of human bones are in the feet.',true),
  //                   Question('A slug\'s blood is green.',true)
  //                                    ];

  // void checker() {
  //   print(quizbrain.getquestion(0));
  //   print("true");
  //   print("the qnum before $q_num");
  //
  //   if (q_num != quizbrain.questions_num()){
  //     if (q_num >= quizbrain.questions_num()!-1){
  //       q_num -= 1;
  //       print("the qnum after $q_num");
  //     };
  // }
  // }

  // List<bool> answers = [
  //   false,
  //   true,
  //   true,
  //   true,
  //   true
  // ];
  void thealert(){
    Alert(
      context: context,
      type: AlertType.success,
      title: "success",
      desc: "great job you achieved $right_points ",
      buttons: [
        DialogButton(
          child: Text(
            "Done",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
          width: 120,
        ),

      ],
    ).show();
  }
  bool isScoreThresholdReached() {
    return score.length >= 1;
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Column(
          children: [
            Row(
              children: score,
            ),

          ],
        ),

        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(25.0),
            child: Center(
              child: Text(
                quizbrain.getquestion()!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF03EBB2)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),

              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                // checker();

                bool correcanswer = quizbrain.getanswer()!;

                if (correcanswer == true) {
                  print("the user got it write");
                  setState(() {
                    quizbrain.next_Q();

                    if (score.length-1 <= quizbrain.questions_num()! - 1) {
                      // q_num += 1;
                      // quizbrain.next_Q();
                      // print(q_num);
                      right_points ++;
                      score.add(
                        Icon(
                          Icons.check,
                          color: Colors.lightGreen,
                        ),
                      );
                    }else {thealert();}
                  });
                } else {
                  print("user got it wrong");
                  false_points ++;
                  setState(() {
                    // checker();
                    quizbrain.next_Q();
                    if (score.length-1 <= quizbrain.questions_num()! - 1) {
                      // q_num += 1;
                      // print(q_num);
                      score.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      );
                    }else {thealert();}
                  });
                }
              },
            ),
          ),

        ),
        
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),

            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF2D2C2D)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correcanswer = quizbrain.getanswer()!;
                if (correcanswer == false) {
                  print("the user got it write");
                  right_points ++;
                  setState(() {
                    quizbrain.next_Q();


                    if (score.length-1 <= quizbrain.questions_num()! - 1) {
                      print(quizbrain.questions_num()! - 1);
                      print(score.length);

                      score.add(
                        Icon(
                          Icons.check,
                          color: Colors.lightGreen,
                        ),
                      );
                    }else {thealert();}
                  });
                } else {
                  print("user got it wrong");
                  false_points ++;
                  setState(() {
                    quizbrain.next_Q();
                    // checker();
                    if (score.length-1 <= quizbrain.questions_num()! - 1) {
                      // q_num += 1;
                      // print(q_num);
                      score.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      );
                    }else {thealert();}
                  });
                }
              },
            ),
          ),
        ),



        // if (score.length == 1 ){
        //
        //
        // }
        if (isScoreThresholdReached())
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                child: const Icon(Icons.delete_sweep),
                onPressed: () {
                  // checker();
                  setState(() {
                    // q_num = 0;
                    quizbrain.restart();
                    false_points = 0;
                    right_points = 0;

                    score.removeRange(1, score.length);
                  });
                  // checker();
                },
              ),
            ),
          ),
      ],
    );
  }
}
