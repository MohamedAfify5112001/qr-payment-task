import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_demo/app/observer/bloc_observer.dart';

import 'app/app.dart';
import 'app/locator/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependenciesLocator();
  Bloc.observer = const SimpleBlocObserver();
  runApp(const MyApp());
}
