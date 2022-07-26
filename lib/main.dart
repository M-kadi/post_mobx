import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:posts_mobx/route/route.dart';
import 'package:posts_mobx/service/locator.dart';
import 'package:posts_mobx/service/preferences_service.dart';
import 'package:posts_mobx/service/provider_service.dart';
import 'package:posts_mobx/service/theme_manager.dart';
import 'package:posts_mobx/widgets//StaticWidgets.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'constants/font_size.dart';
import 'localization/app_localizations.dart';
import 'localization/app_localizations_delegate.dart';
// import 'package:device_preview/device_preview.dart';

void main() async{
  // For binding sharedPreferences in locator setup()
  WidgetsFlutterBinding.ensureInitialized();

  // add Dio Local dio_api : CERTIFICATE_VERIFY_FAILED
  HttpOverrides.global = CertificateHttpOverrides();

  await setup();

  runApp(MyApp());
  // Preview app on any device (any size : small - big, ...)
  // runApp(
  //     DevicePreview(
  //       enabled: !kReleaseMode,
  //       builder: (context) => MyApp(), // Wrap your app
  //     ));
}

// add Dio Local dio_api : CERTIFICATE_VERIFY_FAILED
class CertificateHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) async {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();

    state?.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ProviderService _providerService = locator.get();
  final PreferencesService _preferencesService = locator.get();

  Locale _locale = const Locale(AppLocalizations.languageCodeDefault);

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    this._fetchLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Increase Font Size Text : all App
    changeValuesPercent(_preferencesService.fontSizeID); // default 25 %

    return
      MultiProvider(
          providers: _providerService.init(context),
          child: AppWithTheme(_locale)
      );
  }

  _fetchLocale() async {
    final languageCode = _preferencesService.languageCode;

    return Locale(languageCode);
  }
}

class AppWithTheme extends StatelessWidget {
  var _locale;

  AppWithTheme(Locale locale){
    _locale = locale;
  }

  @override
  Widget build(BuildContext context) {
    final themeManager =  Provider.of<ThemeManager>(context);

    // add MyTool.isIOS : Constant
    StaticWidgets.isIOS = (Theme.of(context).platform == TargetPlatform.iOS);

    return MaterialApp(
      // Preview app on any device (any size : small - big, ...)
 /*
        useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
*/
        navigatorKey: App.navKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.lightTheme(context),//ThemeData.light(),
        darkTheme: ThemeManager.darkTheme(context),//ThemeData.dark(),
        themeMode: themeManager.themeMode,
        locale: _locale,
        supportedLocales: AppLocalizations.getSupportedLocales(),
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        initialRoute: Routes.SPLASH_SCREEN,
        // home: new SplashScreen(),
        routes: Routes.getRoute()
    );
  }
}