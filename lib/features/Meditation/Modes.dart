import 'package:flutter/material.dart';

class Modes extends StatelessWidget {
  final Color background;
  final int flexSize;
  final double mgLeft, mgRight, mgTop, mgBottom;
  final String modeName, assetImage, buttonAsset;
  final Function openMode;

  Modes({
    this.background,
    this.flexSize,
    this.mgLeft,
    this.mgRight,
    this.mgTop,
    this.mgBottom,
    this.modeName,
    this.assetImage,
    this.buttonAsset,
    this.openMode,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexSize,
      child: GestureDetector(
          onTap: openMode,
          child: Container(
            margin: EdgeInsets.only(
                top: mgTop, left: mgLeft, right: mgRight, bottom: mgBottom),
            // width: MediaQuery.of(context).size.width * 0.5 - 45,
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 20),
                        child: Text(
                          modeName,
                          style: TextStyle(
                            fontFamily: "josefin",
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: Image.asset(assetImage),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 15,
                  bottom: 15,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: background,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(14),
                        child: Image.asset(buttonAsset),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
