import 'package:flutter/material.dart';
import 'package:global_configs/global_configs.dart';
import 'package:my_website/configs/config_path.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // load config files
  try {
    for (final element in ConfigPath.values) {
      await GlobalConfigs().loadJsonFromdir('configs/${element.name}.json');
    }
  } catch (e) {
    print("Error loading config files: $e");
  }

  // This is the entry point of the application.
  runApp(const App());
}
