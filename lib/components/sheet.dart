import 'package:flutter/material.dart';

class SheetDisplay extends StatelessWidget {
  final String assetPath;
  final double width;
  final double height;
  final BoxFit fit;

  const SheetDisplay({
    Key? key,
    required this.assetPath,
    this.width = 100.0,
    this.height = 100.0,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(assetPath),
            fit: fit,
          ),
        ),
      ),
    );
  }
}
