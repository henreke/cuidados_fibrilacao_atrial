import 'package:cuidados_fibrilacao_atrial/blocs/medicamento_manager.dart';
import 'package:cuidados_fibrilacao_atrial/blocs/user_manager.dart';
import 'package:cuidados_fibrilacao_atrial/screens/cad_user_screen.dart';
import 'package:cuidados_fibrilacao_atrial/screens/login_screen.dart';
import 'package:cuidados_fibrilacao_atrial/screens/main_screen.dart';
import 'package:cuidados_fibrilacao_atrial/utils/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workmanager/workmanager.dart';
import 'package:shared_preferences/shared_preferences.dart';
void callbackDispatcher(){
  Workmanager().executeTask((taskName, inputData) async{
    int? totalExecutions;
    final _sharedPreference = await SharedPreferences.getInstance(); //Initialize dependency

    try { //add code execution
      totalExecutions = _sharedPreference.getInt("totalExecutions");
      _sharedPreference.setInt("totalExecutions", totalExecutions == null ? 1 : totalExecutions+1);
      print('Executando $totalExecutions');
    } catch(err) {
      //Logger().e(err.toString()); // Logger flutter package, prints error on the debug console
      print('errorrr');
      throw Exception(err);
    }

    return Future.value(true);
  });
}
Future<void> main() async{
  print('msin');
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().init();
  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: false,
  );
  Workmanager().registerPeriodicTask(
    'Teste workmanager',
    'Teste workmanager',
    initialDelay: Duration(seconds: 10),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MultiProvider(
        providers: [
          Provider<UserManager>(
            create: (_) => UserManager(),
            dispose: (context,value) => value.dispose(),
          ),
          Provider<MedicamentoManager>(
            create: (_) => MedicamentoManager(),
            dispose: (context,value) => value.dispose(),
          ),
        ],
        child: MaterialApp(
          title: 'Cuidados FA',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.green,
            snackBarTheme: const SnackBarThemeData(
                backgroundColor: Colors.green,
                actionTextColor: Colors.white,
                contentTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500)
            ),
            textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(bodyText1: GoogleFonts.pacifico(textStyle: textTheme.bodyText1))
          ),
          home: const MainScreen(),
        ),
      );
  }
}