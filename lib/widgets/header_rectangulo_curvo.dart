import 'package:flutter/material.dart';

// Widget para representar una cabecera rectangular con curva en la parte inferior
class HeaderRectanguloCurvo extends StatelessWidget {
  const HeaderRectanguloCurvo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      // ? CustomPaint permite realizar dibujos personalizados en tu aplicación.
      child: CustomPaint(
        // * Especificar el objeto CustomPainter encargado de definir el dibujo personalizado
        painter: _PainterRectanguloCurvo(),
        child: const _Content(),
      ),
    );
  }
}

// Cuando utilizas CustomPaint, debes proporcionar un objeto CustomPainter que implemente los método paint y shouldRepaint
// Este será el encargado de dibujar el o los elementos complejos sobre la pantalla
class _PainterRectanguloCurvo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Inicializar el objeto paint (lápiz para dibujar) y sus respectivas propiedades
    // Los .. es un operador en cascada usado en DART que permite encadenar varias operaciones en un solo objeto, lo que hace que el código sea más conciso y legible.
    final paint = Paint()
      //..color = const Color(0xffA39171)

      // ? Para usar colores gradientes en un objeto Paint se requiere de un shader (sombra)
      // el método createShader crea un Shader a partir de un gradiente lineal y un rectángulo que representa el área de dibujo del CustomPaint.
      ..shader = const LinearGradient(
        colors: [
          Color(0xff326B95),
          Color(0xff6E529E),
          Color(0xffB00466),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    // Inicializar el objeto path (encargado de establecer el camino a dibujar)
    final path = Path();

    // Trazar las rutas correspondientes (dibujar triangulo rectángulo con pico inferior)
    path.lineTo(0, size.height * .8);
    // ? El método quadraticBezierTo es una función que se utiliza para agregar una curva de Bézier cuadrática al objeto Path.
    // * La curva de Bézier cuadrática se define mediante un punto de control (punto de ancla) y un punto final donde terminará la curva.

    // ! El punto de ancla define la forma del triangulo (pico) que se forma por el punto inicial y punto final. Entonces al momento de generar la curva esta se pintará sin exceder el área marcada por ese triángulo. Es por ello que si definimos como punto de ancla (50%, 100%) la curva no llegará hasta al limite inferior del padre. Si ese es nuestro propósito, debemos especificar un punto de ancla mpás alla de los limintes.
    // https://www.udemy.com/course/flutter-disenos-y-animaciones/learn/lecture/18374590#questions/13862748
    path.quadraticBezierTo(
        size.width * .5, size.height * 1.2, size.width, size.height * .8);
    path.lineTo(size.width, 0);
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.jpg'),
            radius: 60,
          ),
          SizedBox(height: 10),
          Text(
            'Alejandro González Reyes',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
