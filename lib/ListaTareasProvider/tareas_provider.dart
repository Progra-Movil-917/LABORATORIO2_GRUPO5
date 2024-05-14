class TareasProvider {
  
  List<Map<String, dynamic>> _tareas = [
     
  ];

  static final TareasProvider _instancia = TareasProvider._privado();


  TareasProvider._privado();

  factory TareasProvider(){
    return _instancia;
  }

  List<Map<String, dynamic>> get tareas{
    return _tareas;
  }

  void agregarTarea(Map<String, dynamic> nuevaTarea){
    
    _tareas.add(nuevaTarea);

  }

}