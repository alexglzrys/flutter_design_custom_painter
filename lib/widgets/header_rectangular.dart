import 'package:flutter/material.dart';

// Widget para representar una cabecera rectangular
class HeaderRectangular extends StatelessWidget {
  const HeaderRectangular({super.key});

  @override
  Widget build(BuildContext context) {
    // Se recomienda usar Container hasta donde sea posible.
    return Container(
      height: 300,
      // Establecer un color en formato hexadecimal
      // Se utiliza el prefijo 0xff seguido del código de color con 6 dígitos
      color: const Color(0xffF374AE),
      // Contenido a mostrar denro de la cabecera personalizada
      child: const Center(
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatar.jpg'),
          radius: 60,
        ),
      ),
    );
  }
}
