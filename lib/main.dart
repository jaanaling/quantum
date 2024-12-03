import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:core_logic/core_logic.dart';
import 'package:quantum/firebase_options.dart';
import 'src/core/dependency_injection.dart';
import 'src/feature/app/presentation/app_root.dart';
import 'package:core_amplitude/core_amplitude.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
   runZonedGuarded(() async {

      FlutterError.onError = (FlutterErrorDetails details) {
         _handleFlutterError(details);
      };
  WidgetsFlutterBinding.ensureInitialized();

   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  setupDependencyInjection();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

    await InitializationUtil.coreInit(
    domain: 'quantumaitracker.com',
    amplitudeKey: '432e26f19d5e533f58d2250e3e2a550d',
    appId: 'com.qaisolutions.quantumaitracker',
    iosAppId: '6738796902',
    initialRoute: '/home',
  );

  runApp(
  
        const AppRoot(),
  );
   }, (Object error, StackTrace stackTrace) {
      _handleAsyncError(error, stackTrace);
   });
}

void _handleFlutterError(FlutterErrorDetails details) {
   AmplitudeUtil.logFailure(
      details.exception is Exception ? Failure.exception : Failure.error,
      details.exception.toString(),
      details.stack,
   );
}

void _handleAsyncError(Object error, StackTrace stackTrace) {
   AmplitudeUtil.logFailure(
      error is Exception ? Failure.exception : Failure.error,
      error.toString(),
      stackTrace,
   );
}