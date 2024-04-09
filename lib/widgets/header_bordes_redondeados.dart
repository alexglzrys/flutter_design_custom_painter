import 'package:flutter/material.dart';

// Widget para representar una cabecera rectangular con bordes semi-rendondeados en la parte inferior
class HeaderBordesRedondeados extends StatelessWidget {
  const HeaderBordesRedondeados({super.key});

  @override
  Widget build(BuildContext context) {
    // Para la mayoría de los diseños, se recomienda usar Container hasta donde sea posible.
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        // Aplicar esquinas semi-redondeadas en la parte inferior
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
        // ? Si aplicamos decoración y color a un elemento, el color debe estar definido dentro de la propiedad decoration.
        color: Color(0xff912F56),
      ),
      child: const HeaderInformation(),
    );
  }
}

// Widget encargado de mostrar información dentro de la sección de cabecera
class HeaderInformation extends StatelessWidget {
  const HeaderInformation({
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
        Text(
          'Alejandro González',
          style: TextStyle(color: Colors.white),
        )
      ],
    ));
  }
}
