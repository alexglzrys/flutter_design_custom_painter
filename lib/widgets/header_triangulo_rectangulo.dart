import 'package:flutter/material.dart';

class HeaderTrianguloRectangulo extends StatelessWidget {
  const HeaderTrianguloRectangulo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      // ? CustomPaint permite realizar dibujos personalizados en tu aplicación.
      child: CustomPaint(
        // Especificar el objeto CustomPainter encargado de definir el dibujo personalizado
        painter: _PainterTrianguloRectangulo(),
        child: const _Content(),
      ),
    );
  }
}

// Cuando utilizas CustomPaint, debes proporcionar un objeto CustomPainter que implemente los método paint y shouldRepaint
// Este será el encargado de dibujar el o los elementos complejos sobre la pantalla
class _PainterTrianguloRectangulo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Inicializar el objeto paint (lápiz para dibujar) y sus respectivas propiedades
    // Los .. es un operador en cascada usado en DART que permite encadenar varias operaciones en un solo objeto, lo que hace que el código sea más conciso y legible.
    final paint = Paint()
      ..color = const Color(0xff8D0801)
      ..style = PaintingStyle.fill;

    // Inicializar el objeto path (encargado de establecer el camino a dibujar)
    final path = Path();

    // Trazar las rutas correspondientes (dibujar triangulo rectángulo)
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);

    // Plasmar los trazos sobre el canvas (lienzo)
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// Widget que representa el contenido prinicpal a dibujar sobre el elemento complejo dibujado con CustomPaint
class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/avatar.jpg'),
        radius: 60,
      ),
    );
  }
}
