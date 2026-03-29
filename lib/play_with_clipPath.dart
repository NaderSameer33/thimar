import 'package:flutter/material.dart';

class PlayWithClippath extends StatelessWidget {
  const PlayWithClippath({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        clipper: ContainerClippper(),
        child: Container(
          height: 400,
          decoration: BoxDecoration(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}

class ContainerClippper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.height * .5, size.width * .5);
    path.lineTo(size.height * .5, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
