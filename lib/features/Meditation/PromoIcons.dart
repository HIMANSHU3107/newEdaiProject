import 'package:flutter/material.dart';

class PromoIcons extends StatelessWidget {
  final String assetName;
  PromoIcons({this.assetName});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      height: 20,
      width: 20,
      child: Image.asset(assetName),
    );
  }
}
