import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0),

              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 320.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/menu.png'),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Center(
                    child: RotateAnimatedTextKit(
                      onTap: () {
                        print("Tap Event");
                      },
                      text: ["Medica", "Medica"],
                      textStyle: TextStyle(
                        fontSize: 52.0,
                        fontFamily: "Horizon",
                        color: Colors.white,
                        letterSpacing: 5.0,
                      ),
                      textAlign: TextAlign.start,
                      // or Alignment.topLeft
                    ),
                  ),
                ),
              ),
            ),


        ],
      ),
    );
  }
}

