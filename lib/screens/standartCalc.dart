import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:slim_calculator/components/calcButton.dart';

class StandartCalc extends StatefulWidget {
  @override
  _StandartCalcState createState() => _StandartCalcState();
}

class _StandartCalcState extends State<StandartCalc> {
  String _expression = '';
  String _history = '';

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evalute(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      _history = _expression;
      _expression = eval.toString().replaceAll(RegExp(r'.0'), '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF282A36),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                _expression,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(fontSize: 75),
                  color: Colors.white,
                ),
              ),
              alignment: Alignment.center,
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 30),
            child: Text(
              _history,
              style: GoogleFonts.rubik(
                textStyle: TextStyle(fontSize: 30),
                color: Color(0xFF545F61),
              ),
            ),
            alignment: Alignment(1, 1),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            color: Colors.white12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CalcButton(
                      text: 'AC',
                      callback: allClear,
                      textColor: 0xFF65BDAC,
                    ),
                    CalcButton(
                      text: 'C',
                      callback: clear,
                      textColor: 0xFF65BDAC,
                    ),
                    CalcButton(
                      text: '%',
                      callback: numClick,
                      textColor: 0xFF65BDAC,
                    ),
                    CalcButton(
                      text: '/',
                      callback: numClick,
                      textColor: 0xFF65BDAC,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CalcButton(
                      text: '7',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '8',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '9',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '*',
                      textSize: 28,
                      callback: numClick,
                      textColor: 0xFF65BDAC,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CalcButton(
                      text: '4',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '5',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '6',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '-',
                      textSize: 28,
                      callback: numClick,
                      textColor: 0xFF65BDAC,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CalcButton(
                      text: '1',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '2',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '3',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '+',
                      textSize: 28,
                      callback: numClick,
                      textColor: 0xFF65BDAC,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CalcButton(
                      text: '.',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '0',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '00',
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '=',
                      textSize: 28,
                      callback: evalute,
                      fillColor: 0xFFFFFFFF,
                      textColor: 0xFF65BDAC,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
