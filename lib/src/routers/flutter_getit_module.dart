import 'package:flutter/material.dart';

import '../../flutter_getit.dart';
import '../core/flutter_getit_context.dart';

abstract class FlutterGetItModule {
  List<Bind> get bindings => [];
  List<FlutterGetItPageRouter> get pages;
  String get moduleRouteName;
  void onClose(Injector i);
  void onInit(Injector i);
}

class FlutterGetItPageModule extends StatefulWidget {
  const FlutterGetItPageModule({
    super.key,
    required this.module,
    required this.page,
  });

  final FlutterGetItModule module;
  final FlutterGetItPageRouter page;

  @override
  State<FlutterGetItPageModule> createState() => _FlutterGetItPageModuleState();
}

class _FlutterGetItPageModuleState extends State<FlutterGetItPageModule> {
  late final String id;
  late final String moduleName;
  late final FlutterGetItContainerRegister containerRegister;

  @override
  void initState() {
    final FlutterGetItPageModule(
      module: (FlutterGetItModule(:moduleRouteName, bindings: bindingsModule)),
      :page,
    ) = widget;
    final flutterGetItContext = Injector.get<FlutterGetItContext>();
    containerRegister = Injector.get<FlutterGetItContainerRegister>();
    moduleName = '$moduleRouteName-module';
    id = '$moduleRouteName-module${page.name}';
    /*  final moduleAlreadyRegistered =
        flutterGetItContext.isRegistered(moduleRouteName); */

    //Module Binds
    containerRegister
      ..register(
        moduleName,
        bindingsModule,
      )
      ..load(moduleName);

    //Register Module
    flutterGetItContext.registerId(
      id,
    );

    //Route Binds
    containerRegister
      ..register(
        id,
        page.bindings,
      )
      ..load(id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.page.page(context);
  }

  @override
  void dispose() {
    final flutterGetItContext = Injector.get<FlutterGetItContext>();
    final canRemoveModule =
        flutterGetItContext.canUnregisterCoreModule(moduleName);

    if (canRemoveModule) {
      containerRegister.unRegister(moduleName);
      flutterGetItContext.removeId(moduleName);
    }
    containerRegister.unRegister(id);
    flutterGetItContext.removeId(id);

    if (canRemoveModule) {
      DebugMode.fGetItLog(
          '🛣️$yellowColor Exiting Module: ${widget.module.moduleRouteName} - calling $yellowColor"onClose()"');
      widget.module.onClose(Injector());
    }
    super.dispose();
  }
}
