import 'package:flutter/material.dart';

import 'contants.dart';

class CardUi extends StatelessWidget {
   const CardUi({super.key, required this.pressed, required this.color, required this.cardChild});


  final VoidCallback  pressed;
  final Color color;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}


class IconWidget extends StatelessWidget {
  const IconWidget({super.key, required this.cardIcon, required this.cardText});

  final IconData cardIcon;
  final String cardText;

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Icon(cardIcon,
          color: Colors.white,
          size: 80,
        ),
        Text(cardText , style: labelStyle,)
      ],
    );
  }
}

class IconButtonn extends StatelessWidget {
  const IconButtonn({super.key, required this.onpressed, required this.icon});

  final VoidCallback onpressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return  RawMaterialButton(
        onPressed: onpressed,
      elevation: 0,
      constraints: const BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      child: Icon(icon),
    );
  }
}

class bButton extends StatelessWidget {
  const bButton({super.key, required this.buttonName, required this.page});

  final String buttonName;
  final VoidCallback page;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: page,
      child: Container(
            height: 80,
        margin: EdgeInsets.only(top: 10),
        width: 80,
        color: Color(0xFFEB1555),
            child: Center(child: Text(buttonName , style: buttonNameStyle,)),
      ),
    );
  }
}



