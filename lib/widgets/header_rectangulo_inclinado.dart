import 'package:flutter/material.dart';

// Widget para representar una cabecera rectangular con estilo en diagonal
class HeaderRectanguloInclinado extends StatelessWidget {
  const HeaderRectanguloInclinado({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Definir el tamaño exacto del lienzo (300 alto x 100% de ancho)
      height: 300,
      width: double.infinity,
      // ? CustomPaint permite realizar dibujos personalizados en tu aplicación.
      // Te da un lienzo en blanco donde puedes dibujar formas, gráficos y otros elementos de forma programática mediante el uso de la clase CustomPainter.
      // * Es especialmente útil cuando necesitas representaciones visuales que no se pueden lograr con los widgets predefinidos de Flutter.
      child: CustomPaint(
        // ! Especificar el objeto CustomPainter encargado de definir el dibujo personalizado
        painter: _PainterDiagonal(),
        child: const _HeaderInformation(),
      ),
    );
  }
}

// Cuando utilizas CustomPaint, debes proporcionar un objeto CustomPainter que implemente los método paint y shouldRepaint
class _PainterDiagonal extends CustomPainter {
  // El método paint define cómo se debe dibujar en el lienzo. Toma dos argumentos: un objeto Canvas, que es el lienzo donde se realizará el dibujo, y un objeto Size, que representa el tamaño del área de dibujo.
  @override
  void paint(Canvas canvas, Size size) {
    // Inicializar el objeto paint (lápiz) que me servirá para dibujar
    final paint = Paint();

    // Establecer propiedades del objeto paint (color, estilo (borde | relleno), ancho (borde))
    paint.color = const Color(0xffFFBA08);
    paint.style = PaintingStyle.fill;
    // paint.style = PaintingStyle.stroke;
    // paint.strokeWidth = 3;

    // Inicializar el objeto path que me servirá para dibujar el camino que debe seguir el lápiz sobre el lienzo
    final path = Path();

    // Por defecto el CustomPaint posiciona el lapiz en la coordenada (0,0), que se corresponde con la esquina superior izquierda de la pantalla del dispositivo

    path.moveTo(0,
        size.height); // Mover el lapiz a la posicion (0, 100%) - A partir de este punto comenzaré a dibujar
    path.lineTo(size.width,
        size.height * 0.9); // dibujar una linea hasta la posición (100%, 90%)
    path.lineTo(size.width, 0); // dibujar una linea hasta la posición (100%, 0)
    path.lineTo(0, 0); // dibujar una linea hasta la posición (0, 0)
    path.lineTo(
        0, size.height); // dibujar una linea hasta la posición (0, 100%)

    // Dibujar el path definido sobre el canvas o lienzo (utilizando las propiedades definidas en el lápiz)
    canvas.drawPath(path, paint);
  }

  // El método shouldRepaint especifica si se necesita una actualización del dibujo basada en el nuevo estado del widget
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // (en la mayoría de los casos debe retornar true).
    return true;
  }
}

// Widget encargado de mostrar información dentro de la sección de cabecera
class _HeaderInformation extends StatelessWidget {
  const _HeaderInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatar.jpg'),
          radius: 50,
        ),
        SizedBox(height: 10),
        Text('Alejandro González Reyes'),
        SizedBox(height: 3),
        Text(
          'Desarrollador Web',
          style: TextStyle(color: Color.fromARGB(255, 246, 246, 246)),
        ),
      ],
    ));
  }
}
