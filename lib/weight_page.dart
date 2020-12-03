import 'package:flutter/material.dart';
import 'constant.dart';
import 'round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'bottom_button.dart';
import 'result.dart';
import 'calculator.dart';

class Weight extends StatefulWidget {
  final int height;
  const Weight({Key key, this.height}) : super(key: key);
  @override
  _WeightState createState() => _WeightState(height: this.height);
}

class _WeightState extends State<Weight> {
  int height;
  int weight = 60;
  _WeightState({this.height});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff16171B),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'WEIGHT',
                  style: kHeadingStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      child: SfRadialGauge(
                        axes: [
                          RadialAxis(
                            minimum: 0,
                            maximum: 150,
                            interval: 10,
                            ranges: [
                              GaugeRange(
                                startValue: 0,
                                endValue: 65,
                                color: Colors.white38,
                              ),
                              GaugeRange(
                                startValue: 65,
                                endValue: 150,
                                color: Colors.lightBlueAccent,
                              ),
                            ],
                            pointers: [
                              NeedlePointer(
                                value: weight.toDouble(),
                                enableAnimation: true,
                                animationDuration: 3000,
                              )
                            ],
                            annotations: [
                              GaugeAnnotation(
                                widget: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      weight.toString(),
                                      style: kHeightStyle,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Kg',
                                      style: kTextStyle,
                                    )
                                  ],
                                ),
                                angle: 90,
                                positionFactor: 1,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                          SizedBox(
                            width: 70.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xff222430),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          BottomButton(
            onTap: () {
              Calculator calc = Calculator(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Result(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  );
                },
              ));
            },
            buttonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
