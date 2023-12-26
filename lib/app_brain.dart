


import 'dart:math';

class Brain{

   final int weight;
   final int height;
  late double _bmi;

  Brain({required this.height,required this.weight});

  //Brain({required this.height,required this.weight , this._bmi = 0});



  String calculate(){

    _bmi = weight/ pow(height/100 , 2);
    return _bmi.toStringAsFixed(1);
  }
String result(){
    if (_bmi>25){
      return "OVERWEIGHT";
    }
    if (_bmi>18.5){
      return "NORMAL";
    }
    else{
      return "UNDERWEIGHT";
    }

}

  String compliment(){
    if (_bmi>25){
      return "Do exercise and loose your weight";
    }
    if (_bmi>18.5){
      return "Great Job! You're Healthy";
    }
    else{
      return "You are weak. Increase your meal";
    }

  }


}