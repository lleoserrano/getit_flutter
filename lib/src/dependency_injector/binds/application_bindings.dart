import '../../../flutter_getit.dart';

@protected
abstract class FlutterGetItBindings {
  List<Bind> bindings();
}

abstract class ApplicationBindings extends FlutterGetItBindings {
  @override
  List<Bind> bindings();
}
