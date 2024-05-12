import 'package:flutter/material.dart';

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
      body: Center(
        child: Text('Pantalla de Noticias'),
      ),
    );
  }
}

class CambioMonedasScreen extends StatefulWidget {
  @override
  _CambioMonedasScreenState createState() => _CambioMonedasScreenState();
}

class _CambioMonedasScreenState extends State<CambioMonedasScreen> {
  String monedaOrigen = 'Dólares';
  String monedaDestino = 'Lempiras';
  double cantidad = 0.0;
  double resultado = 0.0;

  void calcularCambio() {
    setState(() {
      if (monedaOrigen == 'Dólares' && monedaDestino == 'Lempiras') {
        resultado = cantidad * 24.5; // Tasa de cambio dólares a lempiras
      } else if (monedaOrigen == 'Euros' && monedaDestino == 'Lempiras') {
        resultado = cantidad * 28.2; // Tasa de cambio euros a lempiras
      } else if (monedaOrigen == 'Lempiras' && monedaDestino == 'Dólares') {
        resultado = cantidad / 24.5; // Tasa de cambio lempiras a dólares
      } else if (monedaOrigen == 'Lempiras' && monedaDestino == 'Euros') {
        resultado = cantidad / 28.2; // Tasa de cambio lempiras a euros
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cambio de Monedas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Cantidad'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  cantidad = double.parse(value);
                });
              },
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: monedaOrigen,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    monedaOrigen = newValue;
                  });
                }
              },
              items: <String>['Dólares', 'Euros', 'Lempiras']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: monedaDestino,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    monedaDestino = newValue;
                  });
                }
              },
              items: <String>['Lempiras', 'Dólares', 'Euros']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularCambio,
              child: Text('Calcular'),
            ),
            SizedBox(height: 20),
            Text(
              'Resultado: $resultado',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class ListaTareasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
      body: Center(
        child: Text('Pantalla de Lista de Tareas'),
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
