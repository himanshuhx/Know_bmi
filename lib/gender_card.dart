import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constant.dart';

class GenderCard extends StatelessWidget {
  GenderCard({this.genderName, this.genderImage, this.onPress});

  final String genderName;
  final Image genderImage;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              genderImage,
              SizedBox(
                width: 10.0,
              ),
              Text(
                genderName,
                style: kTextStyle,
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Color(0xff222430),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
