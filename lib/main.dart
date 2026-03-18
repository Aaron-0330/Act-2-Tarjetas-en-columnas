import 'package:flutter/material.dart';

void main() => runApp(const MiTiendaElectroMejorada());

class MiTiendaElectroMejorada extends StatelessWidget {
  const MiTiendaElectroMejorada({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hagalo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF3F7FA), // Un gris-azul muy suave de fondo
        primarySwatch: Colors.blue,
      ),
      home: const ListadoProductos(),
    );
  }
}

class ListadoProductos extends StatelessWidget {
  const ListadoProductos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Electrodomesticos',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[800],
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        // Padding para que las tarjetas no toquen los bordes de la pantalla
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: const [
          // 1. Microondas
          TarjetaProductoMejorada(
            nombre: 'Microondas Digital',
            precio: '2,500',
            urlImagen:
                'https://raw.githubusercontent.com/Aaron-0330/Imagenes-para-flutter-6to-I-fecha-11-de-febrero-2026/refs/heads/main/microondas.jfif',
          ),
          // 2. Lavadora
          TarjetaProductoMejorada(
            nombre: 'Lavadora Automática',
            precio: '8,900',
            urlImagen:
                'https://raw.githubusercontent.com/Aaron-0330/Imagenes-para-flutter-6to-I-fecha-11-de-febrero-2026/refs/heads/main/lavadora.jfif',
          ),
          // 3. Licuadora
          TarjetaProductoMejorada(
            nombre: 'Licuadora de Alta Potencia',
            precio: '1,200',
            urlImagen:
                'https://raw.githubusercontent.com/Aaron-0330/Imagenes-para-flutter-6to-I-fecha-11-de-febrero-2026/refs/heads/main/licuadora.jfif',
          ),
          // 4. Refrigerador
          TarjetaProductoMejorada(
            nombre: 'Refrigerador No Frost',
            precio: '12,400',
            urlImagen:
                'https://raw.githubusercontent.com/Aaron-0330/Imagenes-para-flutter-6to-I-fecha-11-de-febrero-2026/refs/heads/main/refrigerador.jpg',
          ),
          // 5. Tostador
          TarjetaProductoMejorada(
            nombre: 'Tostador de Acero',
            precio: '750',
            urlImagen:
                'https://raw.githubusercontent.com/Aaron-0330/Imagenes-para-flutter-6to-I-fecha-11-de-febrero-2026/refs/heads/main/tostador.webp',
          ),
        ],
      ),
    );
  }
}

class TarjetaProductoMejorada extends StatelessWidget {
  final String nombre;
  final String precio;
  final String urlImagen;

  const TarjetaProductoMejorada({
    super.key,
    required this.nombre,
    required this.precio,
    required this.urlImagen,
  });

  @override
  Widget build(BuildContext context) {
    // Definimos el radio de borde una vez para reusarlo
    const double borderRadiusValue = 16.0;

    return Container(
      margin: const EdgeInsets.only(bottom: 18), // Espacio entre tarjetas
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadiusValue),
        // --- CAMBIO CLAVE: Sombra personalizada ---
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06), // Sombra muy tenue
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4), // Sombra hacia abajo
          ),
        ],
      ),
      child: IntrinsicHeight( // Esto asegura que el Row tenga la altura de su hijo más alto
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch, // La imagen y el texto se estiran
          children: [
            // --- DETALLE VISUAL: Barra azul a la izquierda ---
            Container(
              width: 6,
              decoration: const BoxDecoration(
                color: Color(0xFF1976D2), // Un azul medio
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadiusValue),
                  bottomLeft: Radius.circular(borderRadiusValue),
                ),
              ),
            ),
            
            // --- PARTE DE LA IMAGEN (Izquierda) ---
            ClipRRect(
              // No redondeamos las esquinas izquierdas para que toquen la barra azul
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(0),
                bottomLeft: Radius.circular(0),
              ),
              child: Image.network(
                urlImagen,
                width: 110, // Un poco más estrecha
                height: 110, // Altura fija uniforme
                fit: BoxFit.cover, // Imagen centrada y recortada
              ),
            ),
            
            // --- PARTE DEL TEXTO (Derecha) ---
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center, // Texto centrado verticalmente
                  children: [
                    // Nombre del Producto
                    Text(
                      nombre,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700, // Semi-bold
                        color: Colors.blue[900], // Azul oscuro
                        letterSpacing: 0.5,
                      ),
                      maxLines: 2, // Por si el nombre es largo
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    
                    // Precio (con icono y formato)
                    Row(
                      children: [
                        const Icon(Icons.attach_money, color: Colors.green, size: 20),
                        const SizedBox(width: 2),
                        Text(
                          precio,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'MXN',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}