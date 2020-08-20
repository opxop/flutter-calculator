import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:slim_calculator/components/btnCalculator.dart';
import 'package:slim_calculator/global/global.dart';

class ScientificCalculator extends StatefulWidget {
  @override
  _ScientificCalculatorState createState() => _ScientificCalculatorState();
}

class _ScientificCalculatorState extends State<ScientificCalculator> {
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
        appBar: AppBar(
          title: Text('Calculator', style: kAppBarStyle),
          backgroundColor: kMainColorDark,
          centerTitle: true,
        ),
        backgroundColor: kMainColorDark,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  _expression,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 75,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 30, bottom: 20),
                  child: Text(
                    _history,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 25,
                      color: Color(0xFF545F61),
                    ),
                  ),
                  alignment: Alignment(1, 1),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: kCardColorDark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          CalcButton(
                            text: 'AC',
                            callback: allClear,
                            textColor: 0xFF536DFF,
                          ),
                          CalcButton(
                            text: 'C',
                            callback: clear,
                            textColor: 0xFF536DFF,
                          ),
                          CalcButton(
                            text: '%',
                            callback: numClick,
                            textColor: 0xFF536DFF,
                          ),
                          CalcButton(
                            text: '/',
                            callback: numClick,
                            textColor: 0xFF536DFF,
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
                            textColor: 0xFF536DFF,
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
                            textColor: 0xFF536DFF,
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
                            textColor: 0xFF536DFF,
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
                            textColor: 0xFF536DFF,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
