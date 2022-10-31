import 'package:flutter/material.dart';

class ClippedRectangle extends StatelessWidget {
  const ClippedRectangle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: ClipPathClass(),
      child: Container(height: size.height * 0.6, width: double.infinity, color: Colors.cyan.withOpacity(0.8),),
    );
  }
}

class ClipPathClass extends CustomClipper<Path>{

  @override
  Path getClip(Size size){
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, size.height / 3);


    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
