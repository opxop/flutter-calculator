import 'package:flutter/material.dart';
import 'package:slim_calculator/global/global.dart';

class BmiCalculator extends StatefulWidget {
  BmiCalculator({Key key}) : super(key: key);

  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  bool isCalc = false;
  double _height = 150;
  double _weight = 70;
  double _bmi = 0;
  String bmi = '';
  String outputText = '';

  Color _color() {
    if (_bmi <= 18.5)
      return Colors.blue;
    else if (_bmi <= 25)
      return Colors.green;
    else if (_bmi <= 30)
      return Colors.orange;
    else
      return Colors.red;
  }

  String getText() {
    if (_bmi <= 18.5)
      return 'Underweight';
    else if (_bmi <= 25)
      return 'Normal';
    else if (_bmi <= 30)
      return 'Overweight';
    else
      return 'Obesity';
  }

  void getBMI() {
    setState(() {
      _bmi = _weight / ((_height / 100) * (_height / 100));
      bmi = _bmi.toStringAsFixed(1);
      isCalc = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator', style: kAppBarStyle),
        backgroundColor: kMainColorDark,
        centerTitle: true,
      ),
      backgroundColor: kMainColorDark,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              isCalc == true
                  ? Padding(
                      padding: EdgeInsets.only(top: screen.height * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Result Card
                          Container(
                            height: screen.height * 0.25,
                            width: screen.width * 1 - 50,
                            decoration: BoxDecoration(
                              color: kCardColorDark,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: screen.height * 0.02),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Your BMI',
                                        style: kCardText,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: screen.height * 0.02),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        bmi,
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: _color(),
                                          fontSize: 62,
                                        ),
                                      ),
                                      SizedBox(
                                        height: screen.height * 0.02,
                                      ),
                                      Text(
                                        getText(),
                                        style: kOutputText,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
              // End Result Card

              // Height Card
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          top: screen.height * 0.03,
                          bottom: screen.height * 0.03,
                        ),
                        child: Container(
                          height: screen.height * 0.20,
                          width: screen.width * 1 - 50,
                          decoration: BoxDecoration(
                            color: kCardColorDark,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    EdgeInsets.only(top: screen.height * 0.02),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Height',
                                      style: kCardText,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: screen.height * 0.02,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      _height.toStringAsFixed(0),
                                      style: kIndicatorText,
                                    ),
                                    Text(
                                      ' cm',
                                      style: kUnit,
                                    )
                                  ],
                                ),
                              ),
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  activeTrackColor: Colors.indigoAccent,
                                  inactiveTrackColor: Colors.white30,
                                  thumbColor: Colors.indigoAccent,
                                  overlayColor: Colors.indigoAccent,
                                  trackHeight: 4,
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 10.0),
                                ),
                                child: Slider(
                                  value: _height,
                                  min: 50,
                                  max: 250,
                                  onChanged: (double newValue) {
                                    setState(() {
                                      _height = newValue;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: screen.height * 0.20,
                        width: screen.width * 1 - 50,
                        decoration: BoxDecoration(
                          color: kCardColorDark,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  EdgeInsets.only(top: screen.height * 0.02),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Weight',
                                    style: kCardText,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: screen.height * 0.02,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    _weight.toStringAsFixed(0),
                                    style: kIndicatorText,
                                  ),
                                  Text(
                                    ' kg',
                                    style: kUnit,
                                  )
                                ],
                              ),
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.indigoAccent,
                                inactiveTrackColor: Colors.white30,
                                thumbColor: Colors.indigoAccent,
                                overlayColor: Colors.indigoAccent,
                                trackHeight: 4,
                                thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 10.0,
                                ),
                              ),
                              child: Slider(
                                value: _weight,
                                min: 20,
                                max: 120,
                                onChanged: (double newValue) {
                                  setState(() {
                                    _weight = newValue;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: screen.height * 0.03, bottom: screen.height * 0.01),
                child: FlatButton(
                  color: kButtonColor,
                  onPressed: getBMI,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    width: screen.width * 0.4,
                    height: screen.height * 0.07,
                    child: Center(
                      child: Text(
                        'Calculate'.toUpperCase(),
                        style: kButtonStyle,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                tooltip: 'Reset',
                icon: Icon(
                  Icons.redo,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(
                    () {
                      _height = 150;
                      _weight = 70;
                      isCalc = false;
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
