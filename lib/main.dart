import 'package:flutter/material';
import 'package:flutter_laboratorio2_grupo5/Paginas/formulario.dart';
import 'package:flutter_laboratorio2_grupo5/Paginas/lista_de_tareas.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(), // Cambiado a tema claro (fondo blanco)
      initialRoute: '/',
      routes: {
        '/': (context) => MainMenu(),
        '/noticias': (context) => NoticiasScreen(),
        '/cambio_monedas': (context) => CambioMonedasScreen(),
        '/lista_tareas': (context) => ListaTareasScreen(),
        '/podcast': (context) => PodcastScreen(),
        '/formulario':(context) => FormularioPage(),
      },
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú Principal'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Noticias'),
            onTap: () {
              Navigator.pushNamed(context, '/noticias');
            },
          ),
          ListTile(
            title: Text('Cambio de Monedas'),
            onTap: () {
              Navigator.pushNamed(context, '/cambio_monedas');
            },
          ),
          ListTile(
            title: Text('Lista de Tareas'),
            onTap: () {
              Navigator.pushNamed(context, '/lista_tareas');
            },
          ),
          ListTile(
            title: Text('Podcast'),
            onTap: () {
              Navigator.pushNamed(context, '/podcast');
            },
          ),
        ],
      ),
    );
  }
}

class NoticiasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias'),
      ),
      body: ListView(
        children: <Widget>[
          _buildNoticia(
            titulo: 'Consejos para equilibrar el trabajo con el estudio.',
            contenido:
                'Equilibrar el trabajo y los estudios puede ser una tarea difícil, sin embargo, lograr ese equilibrio es esencial para tener éxito tanto en la carrera profesional como en los estudios. Los siguientes consejos pueden ser útiles para encontrar la forma de equilibrar ambas actividades y dividir el tiempo entre un horario académico y laboral.',
            imagenUrl:
                'https://mtau.us/wp-content/uploads/2021/07/motivacion-y-esfuerzo.jpg',
          ),
          _buildNoticia(
            titulo: 'La demanda creciente de expertos en programacion.',
            contenido:
                'La pandemia aceleró la transformación digital de todos los sectores, contribuyendo a que el tecnológico haya sufrido sus consecuencias, y la demanda de perfiles técnicos siga en aumento. Sin embargo, en la actualidad, el número de desarrolladores sigue siendo insuficiente.',
            imagenUrl:
                'https://www.shutterstock.com/image-vector/kid-online-learning-vector-child-600nw-2288905273.jpg',
          ),
        ],
      ),
    );
  }

  Widget _buildNoticia(
      {required String titulo,
      required String contenido,
      required String imagenUrl}) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            imagenUrl,
            height: 200, // Tamaño deseado de la imagen
            width: double
                .infinity, // Ancho de la imagen para llenar el espacio disponible
            fit: BoxFit
                .cover, // Ajuste de la imagen para cubrir completamente el espacio
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  titulo,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  contenido,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CambioMonedasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cambio de Monedas'),
      ),
      body: Center(
        child: Text('Pantalla de Cambio de Monedas'),
      ),
    );
  }
}

class ListaTareasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PaginaListado(),
      ),
    );
  }
}

class PodcastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Podcast'),
      ),
      body: Center(
        child: Text('Pantalla de Podcast'),
      ),
    );
  }
}