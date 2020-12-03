import 'package:flutter/material.dart';
import 'package:know_bmi/constant.dart';
import 'gender_card.dart';
import 'height_page.dart';

class GenderSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Center(
                  child: Text(
                    'SELECT YOUR GENDER',
                    style: kHeadingStyle,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Hero(
                tag: 'male',
                child: Container(
                  child: GenderCard(
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Height(
                              gender: 'male',
                              tag: 'male',
                              sliderColor: kMaleColor,
                            );
                          },
                        ),
                      );
                    },
                    genderName: 'Male',
                    genderImage: Image.asset('images/male.png'),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Hero(
                tag: 'female',
                child: Container(
                  child: GenderCard(
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return Height(
                            gender: 'female',
                            tag: 'female',
                            sliderColor: kFemaleColor,
                          );
                        }),
                      );
                    },
                    genderName: 'Female',
                    genderImage: Image.asset('images/female.png'),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Hero(
                tag: 'others',
                child: Container(
                  child: GenderCard(
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return Height(
                            gender: 'others',
                            tag: 'others',
                            sliderColor: kOthersColor,
                          );
                        }),
                      );
                    },
                    genderName: 'Others',
                    genderImage: Image.asset('images/others.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
