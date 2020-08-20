import 'package:flutter/material.dart';

class CardProgram extends StatelessWidget {
  final Color cardColor;
  final String lable;
  final Widget cardImage;
  final Function onPressed;

  CardProgram({
    @required this.cardColor,
    this.lable,
    this.cardImage,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: <Widget>[
          Container(
            width: screen.width * 0.4,
            height: screen.width * 0.4,
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                cardImage,
                SizedBox(
                  height: 10,
                ),
                Text(
                  lable,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
