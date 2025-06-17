import 'package:flutter/material.dart';

const mainBackground = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: <Color>[
    Color.fromARGB(255, 255, 255, 255), // deep burgundy
    Color.fromARGB(255, 117, 117, 117), // magenta
    Color.fromARGB(255, 61, 6, 6), // warm orange
  ],
  stops: [0.0, 0.5, 1.0],
);

const backupImage = "https://reqres.in/img/faces/7-image.jpg";
