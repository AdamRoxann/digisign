import 'package:digisign/model/slide.dart';
import 'package:flutter/material.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                slideList[index].imageUrl,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          slideList[index].title,
          style: TextStyle(
            color: Color.fromRGBO(15, 213, 152, 1),
            fontSize: 22,
            fontFamily: 'Georgia',
          ),
        ),
        SizedBox(
          height: 35,
        ),
        Text(
          slideList[index].desc,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
