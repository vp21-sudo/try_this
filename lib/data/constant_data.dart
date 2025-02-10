import 'package:flutter/material.dart';

class KTextStyle {
  static const TextStyle titleText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle descriptionText = TextStyle(
    fontSize: 16,
  );
}

class Env {
  static const String baseUrl = "http://localhost:12000/api/";
}
