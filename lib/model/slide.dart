import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String desc;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.desc,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/User.png',
    title: 'Made For You',
    desc: 'Lorem Ipsum dolor sit amet, consectur \n'
        'adipiscing elit, sed do eiusmod tempor \n'
        'incididunt ut labore et dolore magna aliqua',
  ),
   Slide(
    imageUrl: 'assets/images/Mosque.png',
    title: 'This is just the beginning',
    desc: 'Lorem Ipsum dolor sit amet, consectur \n'
        'adipiscing elit, sed do eiusmod tempor \n'
        'incididunt ut labore et dolore magna aliqua',
  ),
   Slide(
    imageUrl: 'assets/images/Computer.png',
    title: 'High-tech',
    desc: 'Lorem Ipsum dolor sit amet, consectur \n'
        'adipiscing elit, sed do eiusmod tempor \n'
        'incididunt ut labore et dolore magna aliqua',
  ),
];
