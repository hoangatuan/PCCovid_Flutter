import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeHeaderView extends StatelessWidget {
  final String image;
  final String title;

  const HomeHeaderView({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ClipPath(
      clipper: MyClipper(),
      child: Container(
          padding: const EdgeInsets.only(left: 36, top: 60),
          height: 320,
          width: size.width,
          decoration: const BoxDecoration(
              color: Colors.yellow,
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xFF3383CD), Color(0xFF11249F)]),
              image:
                  DecorationImage(image: AssetImage("assets/home/virus.png"))),
          child: Stack(
            children: [
              SvgPicture.asset(
                image,
                width: 230,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topLeft,
              ),
              Positioned(
                  left: 150,
                  top: 20,
                  child: Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ))
            ],
          )),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
