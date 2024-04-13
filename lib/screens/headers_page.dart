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
            // HeaderRectangular(),
            // HeaderBordesRedondeados(),
            // HeaderRectanguloInclinado(),
            //HeaderRectanguloPico(),
            HeaderRectanguloCurvo(),
            Content(),
          ],
        ),
      ),
      //body: HeaderTrianguloRectangulo(),
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
              'El CustomPainter en Flutter es una clase que te permite realizar dibujos personalizados en un lienzo (canvas) dentro de un widget. Esto te da un alto grado de control sobre cómo se renderizan los gráficos y la capacidad de crear representaciones visuales completamente personalizadas.'),
          SizedBox(height: 10),
          Text(
              'Es importante saber que, color y decoration son mutuamente excluyentes. No puedes aplicar ambos al mismo tiempo en un Container. Si usas decoration, no necesitas usar color, ya que este puede ser definido como una caracteristica de decoration. '),
          SizedBox(height: 10),
          Text(
              'Los .. es un operador en cascada usado en DART que permite encadenar varias operaciones en un solo objeto, lo que hace que el código sea más conciso y legible.'),
        ],
      ),
    );
  }
}
