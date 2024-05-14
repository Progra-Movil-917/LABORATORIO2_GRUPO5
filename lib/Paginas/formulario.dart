import 'package:flutter/material.dart';
import 'package:flutter_laboratorio2_grupo5/ListaTareasProvider/tareas_provider.dart';

class FormularioPage extends StatefulWidget {
  const FormularioPage({super.key});

  

  static final nombrePagina = "formulario";

  @override
  State<FormularioPage> createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {

  final idForm = GlobalKey<FormState>();

  Map<String, dynamic> nuevaTarea={};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulario"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Form(
            key: idForm,
            child: Column(
              children: <Widget>[
                _crearInputNombre(),
                _crearInputDescripcion(),
                _botonAgregar(context),
              ],
              ),
          ),
        ),
      ),
    );
  }

  _crearInputNombre(){
    return TextFormField(
      onSaved: (valor){
        nuevaTarea['nombre']=valor;
      },
                  decoration: InputDecoration(
                    hintText: "Nombre de la tarea"
                  ),
                );
  }

  _crearInputDescripcion(){
    return Container(
                  margin: EdgeInsets.only(
                    top: 20.0
                  ),
                  child: TextFormField(
                    onSaved: (valor){
                      nuevaTarea['descripcion']=valor;
                    },
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: "Descripcion de la tarea"
                    ),
                  ),
                );
  }

  _botonAgregar(BuildContext context){
    return Container(
                  margin: EdgeInsets.only(
                    top: 20.0),
                  child: ElevatedButton(onPressed: (){
                    idForm.currentState?.save();
                    nuevaTarea['estado']=false;

                    TareasProvider().agregarTarea(nuevaTarea);
                    Navigator.pop(context);
                  },
                  child: Text('Crear tarea'),
                  ),
                );
  }
}