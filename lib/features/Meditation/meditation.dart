import 'package:flutter/material.dart';
import 'PromoIcons.dart';
import 'Modes.dart';

class Meditation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                // height: MediaQuery.of(context).size.height * 0.3,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Good Morning",
                            style: TextStyle(
                              fontFamily: "Josefin",
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                            )),
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage('assets/images/meditation.png'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            PromoIcons(assetName: "assets/images/circle.png"),
                            PromoIcons(assetName: "assets/images/moon.png"),
                            PromoIcons(assetName: "assets/images/triangle.png"),
                            PromoIcons(assetName: "assets/images/drop.png"),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            children: [
                              Text(
                                "Let's focus on the new day ",
                                style: TextStyle(
                                  fontFamily: "Josefin",
                                  fontSize: 23,
                                ),
                              ),
                              Text("~"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          children: [
                            Modes(
                                background: Color(0xffffb773),
                                flexSize: 4,
                                mgTop: 30,
                                mgLeft: 30,
                                mgRight: 10,
                                mgBottom: 10,
                                modeName: "Focus Mode",
                                assetImage: "assets/images/coltri.png",
                                buttonAsset: "assets/images/triangle.png",
                                openMode: null),
                            Modes(
                              background: Color(0xffcf8cf9),
                              flexSize: 6,
                              mgTop: 10,
                              mgLeft: 30,
                              mgRight: 10,
                              mgBottom: 30,
                              modeName: "Meditation\nMode",
                              assetImage: "assets/images/colmoon.png",
                              buttonAsset: "assets/images/moon.png",
                              openMode: null,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          children: [
                            Modes(
                                background: Color(0xff74e9f8),
                                flexSize: 6,
                                mgTop: 30,
                                mgLeft: 10,
                                mgRight: 30,
                                mgBottom: 10,
                                modeName: "Relaxation\nMode",
                                assetImage: "assets/images/colcir.png",
                                buttonAsset: "assets/images/circle.png",
                                openMode: null),
                            Modes(
                              background: Color(0xff97e37b),
                              flexSize: 4,
                              mgTop: 10,
                              mgLeft: 10,
                              mgRight: 30,
                              mgBottom: 30,
                              modeName: "Sleep Mode",
                              assetImage: "assets/images/coldrop.png",
                              buttonAsset: "assets/images/drop.png",
                              openMode: null,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
