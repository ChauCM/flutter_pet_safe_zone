import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CatMarkerWidget extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final Color markerColor;

  const CatMarkerWidget({
    super.key,
    this.width = 80,
    this.height = 80,
    required this.imagePath,
    this.markerColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: Key('cat_marker_widget $imagePath'),
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: width * 0.8,
            height: width * 0.8,
            margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.white, width: 2),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SvgPicture.asset(
            'assets/images/map_marker_circle.svg',
            width: width,
            height: height,
            colorFilter: ColorFilter.mode(markerColor, BlendMode.srcIn),
          ),
        ],
      ),
    );
  }
}
