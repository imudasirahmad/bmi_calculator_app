import 'package:bmi_calculator/app_brain.dart';
import 'package:bmi_calculator/contants.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_widgets.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {

  late gender  selectedGender = gender.male;
  int height = 150;
  int weight = 40;
  int age = 14;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
        title: Center(child: Text("BMI Calculator")),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                 mainAxisAlignment: MainAxisAlignment.end,
                children: [
            Expanded(
                child: CardUi(
                  pressed: () {
                    setState(() {

                      selectedGender= gender.male;

                    });
                  },
                  color: selectedGender== gender.male ? cardActiveColor : cardInactiveColor,
                  cardChild: (
                      IconWidget(

                        cardIcon: FontAwesomeIcons.mars,
                        cardText: 'Male' ,
                      )
                  ),
                )
            ),
                Expanded(
                    child: CardUi(
                      pressed: () {
                        setState(() {
                          selectedGender= gender.female;
                        });

                      },
                      color: selectedGender == gender.female ? cardActiveColor : cardInactiveColor,
                      cardChild: (
                          IconWidget(
                            cardIcon: FontAwesomeIcons.venus,
                            cardText: 'Female',
                          )
                      ),
                    )
                ),
          ],
          )),
          Expanded(
              child: CardUi(pressed: () {  },
                color: cardActiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT' , style: headingStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(height.toString() ,style: nameStyle,),
                        Text('cm')

                    ],),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor:activeTrackColor,
                        inactiveTrackColor: Colors.grey,
                        thumbColor: thumbcolor,
                        overlayColor: overlaycolor,
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double value) {
                          setState(() {
                            height =value.toInt();
                          });
                        },
                      
                    ))
                ],
          ),)),
          Expanded(child: Row(children: [
            Expanded(child: CardUi(
              pressed: () {  },
              color: cardActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("WEIGHT" , style: headingStyle,),
                      Text(weight.toString() , style: nameStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },),
                          SizedBox(width: 10,),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },),

                        ],)

                    ],)

              ],),)),
            Expanded(
                child: CardUi(
                  pressed: () {  },
                  color: cardActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("AGE" , style: headingStyle,),
                          Text(age.toString(), style: nameStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: (){
                                    setState(() {
                                      age--;

                                    });
                                  }, icon: Icon(Icons.remove)),
                              IconButton(
                                  onPressed: (){
                                    setState(() {
                                      age++;

                                    });
                                  }, icon: Icon(Icons.add)),

                            ],
                          )],
                      )],
                  ),
                ))
          ],
          )
          ),
          Padding(
            padding: const EdgeInsets.symmetric( horizontal: 17),
            child: bButton(
              buttonName: 'CALCULATE',
              page: () {
                Brain newBrain = Brain(height: height, weight: weight);

                Navigator.push(context, MaterialPageRoute(
                builder: (context)=> ResultPage(
                  bmi: newBrain.calculate(),
                  result: newBrain.result(),
                  compliment: newBrain.compliment(),


                ),)); },),
          ),
          const SizedBox(height: 10,)
        ],
      ),
    );
  }
}
