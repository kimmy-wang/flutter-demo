import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:intl/intl.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';

import 'package:flutter_demo/common/model/app_state.dart';
import 'package:flutter_demo/common/config/flutter_demo_config.dart';
import 'package:flutter_demo/ui/store/reducers/app_state_reducer.dart';
import 'package:flutter_demo/ui/pages/app_intro_screen.dart';
import 'package:flutter_demo/ui/l10n/messages_all.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AmapService.init(
    iosKey: FlutterDemoConfig.AMAP_CLIENT_KEY_IOS,
    androidKey: FlutterDemoConfig.AMAP_CLIENT_KEY_ANDROID,
  );
  // Create Persistor
  final persistor = Persistor<AppState>(
    storage: FlutterStorage(),
    serializer: JsonSerializer<AppState>(AppState.fromJson),
  );

  // Load initial state
  final initialStateFromStorage = await persistor.load();
  final store = Store<AppState>(appReducer,
      initialState: initialStateFromStorage ?? initialState,
      middleware: [
        persistor.createMiddleware(),
        LoggingMiddleware.printer(),
        thunkMiddleware,
      ]);
  runApp(FlutterDemoApp(
    store: store,
  ));
}

class FlutterDemoApp extends StatefulWidget {
  final Store<AppState> store;

  FlutterDemoApp({Key key, this.store}) : super(key: key);

  @override
  _FlutterDemoAppState createState() => _FlutterDemoAppState();
}

class _FlutterDemoAppState extends State<FlutterDemoApp> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: StoreConnector<AppState, ThemeMode>(
        converter: (store) => store.state.darkMode,
        builder: (context, darkMode) {
          return MaterialApp(
            localizationsDelegates: [
              const DemoLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en'),
              // English
              const Locale.fromSubtags(languageCode: 'zh'),
              // Chinese *See Advanced Locales below*
            ],
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: darkMode,
            onGenerateTitle: (BuildContext context) =>
                DemoLocalizations.of(context).title,
            home: AppIntroScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

class DemoLocalizations {
  DemoLocalizations(this.localeName);

  static Future<DemoLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      return DemoLocalizations(localeName);
    });
  }

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  final String localeName;

  String get title {
    return Intl.message(
      'Flutter Sample',
      name: 'title',
      desc: 'Title for the Demo application',
      locale: localeName,
    );
  }
}

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<DemoLocalizations> load(Locale locale) =>
      DemoLocalizations.load(locale);

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}
