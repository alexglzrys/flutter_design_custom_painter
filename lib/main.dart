import 'package:custom_painter_flutter_app/screens/headers_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const CustomPainterApp());

class CustomPainterApp extends StatelessWidget {
  const CustomPainterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños Personalizados',
      home: HeadersPage(),
    );
  }
}
