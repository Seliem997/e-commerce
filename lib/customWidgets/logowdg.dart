import 'package:flutter/material.dart';

class logoNamedWDG extends StatelessWidget {
  const logoNamedWDG({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: height*.07),
      child: Container(
        height: height*.170,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage('images/icons/iconbuyonline.png'),
            ),
            Positioned(
              bottom: 0,
              child: Text(
                'Buy it',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 25,

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
