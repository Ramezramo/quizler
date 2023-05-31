import 'questions.dart';

class Quizbrain{
  int _q_num = 0;



  List<Question> _questions_premium = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.',true),
    Question('A slug\'s blood is green.',true)
    ,
    Question('do you know that ramez developed this program',true)
  ];
  void next_Q (){
    if (_q_num < _questions_premium.length-1){
      _q_num ++;
    }
  }
  void restart(){
    _q_num = 0;
  }

  String? getquestion(){
    return _questions_premium[_q_num].question_text!;

  }
  bool? getanswer(){
    return _questions_premium[_q_num].q_answer!;

  }
  int? questions_num(){
    return _questions_premium.length;
  }

}