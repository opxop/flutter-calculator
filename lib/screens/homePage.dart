// import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:slim_calculator/components/cardHome.dart';
import 'package:slim_calculator/global/global.dart';
import 'package:slim_calculator/screens/bmiCalc.dart';
import 'package:slim_calculator/screens/scientificCalc.dart';

enum Program { Scietific, BMI }
Program program;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kMainColorDark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: screen.height * 0.12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'IDK',
                  style: kCardText,
                ),
                Text(
                  'just Calculator!',
                  style: kHeaderText,
                ),
                Text(
                  'あいかわらず ~',
                  style: kCardText,
                ),
              ],
            ),
          ),
          Card(
            color: kCardColorDark,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(
                    top: screen.height * 0.05, bottom: screen.height * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: screen.height * 0.05),
                      child: Text(
                        'Choose a program :',
                        style: kCardText,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CardProgram(
                          onPressed: () {
                            setState(() {
                              program = Program.Scietific;
                            });
                          },
                          cardColor: program == Program.Scietific
                              ? kActiveColor
                              : kInactiveColor,
                          cardImage: SvgPicture.asset(
                            "assets/image/calculator.svg",
                            height: 85.0,
                          ),
                          lable: 'Scietific \n Calculator',
                        ),
                        CardProgram(
                          onPressed: () {
                            setState(() {
                              program = Program.BMI;
                            });
                          },
                          cardColor: program == Program.BMI
                              ? kActiveColor
                              : kInactiveColor,
                          cardImage: SvgPicture.asset(
                            "assets/image/bmi-cal.svg",
                            height: 85.0,
                          ),
                          lable: 'BMI \n Calculator',
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screen.height * 0.05),
                      child: FlatButton(
                        color: kButtonColor,
                        onPressed: () {
                          if (program == Program.Scietific) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScientificCalculator(),
                              ),
                            );
                          } else if (program == Program.BMI) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BmiCalculator(),
                              ),
                            );
                          } else {
                            Fluttertoast.showToast(
                              msg: "Tap on Program first to continue",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red[300],
                              textColor: Colors.white,
                              fontSize: 15.0,
                            );
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Container(
                          width: screen.width * 0.4,
                          height: screen.height * 0.07,
                          child: Center(
                            child: Text(
                              "Let's Started".toUpperCase(),
                              style: kButtonStyle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
