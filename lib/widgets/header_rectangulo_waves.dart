import 'package:flutter/material.dart';

// Widget para representar una cabecera rectangular con efecto waves en la parte inferior
class HeaderRectanguloWaves extends StatelessWidget {
  const HeaderRectanguloWaves({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      // ? CustomPaint permite realizar dibujos personalizados en la aplicación.
      child: CustomPaint(
        // * Especificar el objeto CustomPainter encargado de definir el dibujo personalizado
        painter: _PainterRectanguloWaves(),
        child: const _Content(),
      ),
    );
  }
}

// Cuando se utiliza CustomPaint, se debe proporcionar un objeto CustomPainter que implemente los método paint y shouldRepaint
// Este será el encargado de dibujar el elementos complejo sobre el canvas o área designada
class _PainterRectanguloWaves extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Inicializar el objeto paint (lápiz para dibujar) y sus respectivas propiedades
    // Los .. es un operador en cascada usado en DART que permite encadenar varias operaciones en un solo objeto, lo que hace que el código sea más conciso y legible.
    final paint = Paint()
      ..style = PaintingStyle.fill
      // ? Para usar colores gradientes en un objeto Paint se requiere de un shader
      // * el método createShader crea un Shader a partir de un gradiente lineal y un rectángulo que representa el área de dibujo del CustomPaint.
      ..shader = const LinearGradient(
        colors: [
          Color(0xff1B798B),
          Color(0xff00947B),
          Color(0xff51A431),
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    // Definir otro objeto Paint
    // Permitirá definir una capa oscura con opacidad
    final maskPaint = Paint();
    maskPaint.color = Colors.black.withOpacity(0.4);

    // Inicializar el objeto path (encargado de establecer el camino a dibujar)
    final path = Path();

    // Trazar las rutas correspondientes (dibujar triangulo rectángulo con pico inferior)
    path.lineTo(0, size.height * .9);
    // ? El método quadraticBezierTo es una función que se utiliza para agregar una curva de Bézier cuadrática al objeto Path.
    // * La curva de Bézier cuadrática se define mediante un punto de control (ancla) y un punto final donde terminará la curva.

    // Linea que va del punto (0, 90%) al punto (50%, 90%) - Punto de ancla que definela la intersección lineas tangentes (25%, 100%)
    path.quadraticBezierTo(
        size.width * .25, size.height, size.width * .5, size.height * .9);
    // Linea que va del punto (50, 90%) al punto (100%, 90%) - Punto de ancla que definela la intersección lineas tangentes (75%, 80%)
    path.quadraticBezierTo(
        size.width * .75, size.height * .8, size.width, size.height * .9);

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    // ?Plasmar los trazos sobre el canvas
    canvas.drawPath(path, paint); // Lienzo gradiente
    canvas.drawPath(path, maskPaint); // Lienzo capa oscura con opacidad
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
