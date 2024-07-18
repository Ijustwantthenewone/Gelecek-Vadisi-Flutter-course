import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prayertimes/Pages/page_control.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// sayfa geçişlerinde yeniden yüklemeye çalışıyor ne yapmalıyım
void main() {
 
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const Go());
  });
}


class Go extends StatelessWidget {
  const Go({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 915),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: const [
             GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        ],
          supportedLocales: const [Locale('tr')],
          theme: ThemeData(
            datePickerTheme: DatePickerThemeData(
              backgroundColor: Colors.pink[200], 
              dividerColor: Colors.white, 
              headerBackgroundColor: Colors.pink[200], 
              shadowColor: Colors.pinkAccent, 
          
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: const PageControl(),
    );
  }
}
