import 'package:bmi_calculator/custom_widgets.dart';
import 'package:flutter/material.dart';

import 'contants.dart';
import 'input_page.dart';


class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.bmi, required this.result, required this.compliment});

  final String bmi;
  final String result;
  final String compliment;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
        title: Center(child: Text(" Calculation Result")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 30,),
          Column(children: [Center(child: Text("Your Score" , style: txtStyle, ))]),
          Expanded(
              flex: 5,
              child: CardUi(
                pressed: () {  },
                color: greyColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(bmi , style: bmiTxtStyle,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Text(result , style: resultTextStyle,),
                      Text(compliment , style: complimentTxtStyle,)
                    ],),





                  ],),)),
          Padding(
            padding: const EdgeInsets.symmetric( horizontal: 17),
            child: bButton(buttonName: 'Re Calculate',
              page: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> InputScreen()));

            },),
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
