class TareasProvider {
  
  List<Map<String, dynamic>> _tareas;

  static final TareasProvider _instancia = TareasProvider._private();


  TareasProvider._private(){
    _tareas = [];
  }

  factory TareasProvider(){
    return _instancia;
  }

  List<Map<String, dynamic>> get tareas{
    return _tareas;
  }

}