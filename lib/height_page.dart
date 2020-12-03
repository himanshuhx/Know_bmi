import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'bottom_button.dart';
import 'weight_page.dart';

class Height extends StatefulWidget {
  final String gender;
  final MaterialColor sliderColor;
  final String tag;

  const Height({Key key, this.gender, this.sliderColor, this.tag})
      : super(key: key);

  @override
  _HeightState createState() => _HeightState(
      gender: this.gender, sliderColor: this.sliderColor, tag: this.tag);
}

class _HeightState extends State<Height> {
  String gender;
  MaterialColor sliderColor;
  int height = 25;
  String tag;
  _HeightState({this.gender, this.sliderColor, this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff16171B),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'HEIGHT',
                  style: kHeadingStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                padding: EdgeInsets.all(25),
                child: Column(
                  children: [
                    Expanded(
                      child: Hero(
                        tag: tag,
                        child:
                            Container(child: Image.asset('images/$gender.png')),
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: sliderColor,
                        activeTrackColor: Colors.lightGreenAccent,
                        thumbColor: sliderColor,
                        overlayColor: Color(0x29536054),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 10,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          height.toString(),
                          style: kHeightStyle,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'cm',
                          style: kTextStyle,
                        )
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xff222430),
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          BottomButton(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Weight(
                    height: height,
                  );
                },
              ));
            },
            buttonTitle: 'Next',
          ),
        ],
      ),
    );
  }
}
