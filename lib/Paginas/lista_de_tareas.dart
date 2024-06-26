import 'package:flutter/material.dart';
import 'package:flutter_laboratorio2_grupo5/ListaTareasProvider/tareas_provider.dart';
import 'package:flutter_laboratorio2_grupo5/Paginas/formulario.dart';


class PaginaListado extends StatelessWidget {
  const PaginaListado({super.key});

  static final nombrePagina = "listado";

  static final List<Map<String, dynamic>> tareas = [
    {
      'nombre': "Tarea uno",
      'descripcion': "Descripcion de la tarea uno",
      'estado': false 
    },
    {
      'nombre': "Tarea dos",
      'descripcion': "Descripcion de la tarea uno",
      'estado': false 
    },
    {
      'nombre': "Tarea tres",
      'descripcion': "Descripcion de la tarea uno",
      'estado': true 
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Listado de Tareas',
          style: TextStyle(color: Colors.white),),
          backgroundColor: Color.fromARGB(255, 212, 20, 20),
        ),
        body: (TareasProvider().tareas.isNotEmpty)?ListView(
          children: _crearItem()
        ): 
        Center(child: Text("Aún no tienes tareas.")
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>Navigator.pushNamed(context, "/formulario"),
          child: Icon(
            Icons.add
          ),
          ),
      );
  }
  
  List<Widget> _crearItem() {

    List<Widget> temporal = [];

    for (Map<String, dynamic>tarea in TareasProvider().tareas) {
      Widget item = ListTile(
        title: Text("${tarea['nombre']}"),
        trailing: (tarea['estado'])?Icon(Icons.star):Icon(Icons.star_border),
      );
      temporal.add(item);
    }
    return temporal;
  }
}
