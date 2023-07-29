import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgtes/custom_widgets.dart';

class AgregarCarritoBoton extends StatelessWidget {
  final double monto;

  const AgregarCarritoBoton({super.key, required this.monto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.circular(100)),
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              '\$$monto',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            const BotonNaranja(texto: 'Add to car'),
            SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
