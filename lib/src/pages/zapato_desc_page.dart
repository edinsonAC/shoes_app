import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/models/zapato_model.dart';
import 'package:shoes_app/src/widgtes/custom_widgets.dart';

class ZapatoDesPage extends StatelessWidget {
  const ZapatoDesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Hero(
                  tag: 'zapato-1', child: ZapatoPreview(fullScreen: true)),
              Positioned(
                  top: 50,
                  child: FloatingActionButton(
                    elevation: 0,
                    highlightElevation: 0,
                    backgroundColor: Colors.transparent,
                    child: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 60,
                    ),
                    onPressed: () {
                      cambiarStatusDark();
                      Navigator.pop(context);
                    },
                  ))
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                const ZapatoDescripcion(
                  titulo: 'Nike Air Max 720',
                  descripcion:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
                _MontoBuyNow(),
                _ColoresYmas(),
                _BotonesSettings()
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class _BotonesSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const _botonSombreado(
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 25,
            ),
          ),
          _botonSombreado(
            icon: Icon(
              Icons.add_shopping_cart,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          ),
          _botonSombreado(
            icon: Icon(
              Icons.settings,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}

class _botonSombreado extends StatelessWidget {
  final Icon icon;

  const _botonSombreado({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black,
                spreadRadius: -5,
                blurRadius: 20,
                offset: Offset(0, 10))
          ]),
      child: icon,
    );
  }
}

class _ColoresYmas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
              child: Stack(
            children: const [
              Positioned(
                left: 90,
                child: _BotonColor(
                  color: Color(0xffC6D642),
                  index: 1,
                  assets: 'assets/imgs/verde.png',
                ),
              ),
              Positioned(
                left: 60,
                child: _BotonColor(
                  color: Color(0xffFFAD29),
                  index: 2,
                  assets: 'assets/imgs/amarillo.png',
                ),
              ),
              Positioned(
                left: 30,
                child: _BotonColor(
                  color: Color(0xff2099F1),
                  assets: 'assets/imgs/azul.png',
                  index: 3,
                ),
              ),
              _BotonColor(
                color: Color(0xff364D56),
                index: 4,
                assets: 'assets/imgs/negro.png',
              ),
            ],
          )),
          const BotonNaranja(
            texto: 'More related items',
            alto: 30,
            ancho: 170,
            color: Color(0xffFFC675),
          )
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String assets;

  const _BotonColor(
      {super.key,
      required this.color,
      required this.index,
      required this.assets});

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 200),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = assets;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            const Text(
              '\$180.0',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Bounce(
              delay: const Duration(seconds: 1),
              from: 8,
              child: const BotonNaranja(
                texto: 'Buy now',
                ancho: 120,
                alto: 35,
              ),
            )
          ],
        ),
      ),
    );
  }
}
