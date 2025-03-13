import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app_module.dart';
import 'app_widget.dart';
import 'core/services/api_security.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = ConfigHttpOverrides();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory(
              (await getApplicationDocumentsDirectory()).path,
            ),
  );
  usePathUrlStrategy();
  return runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
