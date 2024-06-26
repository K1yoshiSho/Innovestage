import 'dart:async';
import 'dart:ui';

import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innovestage/src/app/widget/app.dart';
import 'package:innovestage/src/common/services/provider_observer.dart';
import 'package:innovestage/src/common/ui/pages/restart_wrapper.dart';
import 'package:innovestage/src/common/utils/talker_logger.dart';
import 'package:innovestage/src/feature/initialization/logic/initialization_processor.dart';
import 'package:innovestage/src/feature/initialization/logic/initialization_steps.dart';
import 'package:innovestage/src/feature/initialization/model/initialization_hook.dart';

/// A class which is responsible for initialization and running the app.
final class AppRunner
    with
        InitializationSteps,
        InitializationProcessor,
        InitializationFactoryImpl {
  /// Start the initialization and in case of success run application
  Future<void> initializeAndRun(
    InitializationHook hook,
  ) async {
    final binding = WidgetsFlutterBinding.ensureInitialized()
      ..deferFirstFrame();
    DartPluginRegistrant.ensureInitialized();

    // Preserve splash screen
    FlutterNativeSplash.preserve(widgetsBinding: binding);

    // Override logging
    await initHandling();

    // Setup bloc observer and transformer
    Bloc.transformer = bloc_concurrency.sequential();
    Future<void> initializeAndRun(InitializationHook hook) async {
      try {
        final result = await processInitialization(
          steps: initializationSteps,
          hook: hook,
          factory: this,
        );

        FlutterNativeSplash.remove();
        runApp(
          ProviderScope(
            observers: [
              ProviderLoggerObserver(),
            ],
            child: RestartWrapper(
              child: App(
                result: result,
              ),
            ),
          ),
        );
      } catch (e) {
        rethrow;
      } finally {
        binding.allowFirstFrame();
      }
    }

    await initializeAndRun(hook);
  }
}
