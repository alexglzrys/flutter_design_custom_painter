import 'package:custom_painter_flutter_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          HeaderRectangular(),
          Content(),
        ],
      )),
    );
  }
}

// Widget que representa el contenido principal de la pantalla
class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const Column(
        children: [
          SizedBox(height: 20),
          Text(
              'El CustomPainter en Flutter es una clase que te permite realizar dibujos personalizados en un lienzo (canvas) dentro de un widget. Esto te da un alto grado de control sobre cómo se renderizan los gráficos y la capacidad de crear representaciones visuales completamente personalizadas.')
        ],
      ),
    );
  }
}
