import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Appbar extends StatelessWidget {
  final List<String> swipeData;

  Appbar(this.swipeData);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: 60,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Text(
                  swipeData[index],
                  style: TextStyle(
                      fontSize: 35,
                      fontFamily: "Josefin",
                      fontWeight: FontWeight.bold),
                );
              },
              itemCount: swipeData.length,
              pagination: new SwiperPagination(alignment: Alignment.bottomLeft),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Container(
                  height: 25,
                  width: 30,
                  child: Image.asset("assets/images/stats.png"),
                ),
                SizedBox(
                  width: 40,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    height: 20,
                    width: 20,
                    child: Image.asset("assets/images/exit.png"),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
