import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valstore/firebase_options.dart';
import 'package:valstore/routes.dart';
import 'package:valstore/theme.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) {
        ThemeProvider().initTheme();
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: routes,
          navigatorKey: navigatorKey,
          theme: light,
          darkTheme: dark,
          themeMode: themeProvider.themeMode,
        );
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences prefs;

  @override
  void initState() {
    loadPrefs();
    super.initState();
  }

  void loadPrefs() async {
    prefs = await SharedPreferences.getInstance();
    bool? login = prefs.getBool('login');
    if (login != null && login) {
      navigatorKey.currentState!.pushNamed('/login');
    }
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF16141a).withOpacity(.8),
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('ValStore'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                navigatorKey.currentState!.pushNamed('/login');
              },
              child: const Text(
                'Login at Riot games',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                    prefs.setBool('login', value!);
                  },
                  fillColor:
                      MaterialStateProperty.resolveWith((states) => Colors.red),
                ),
                const Text('Automatically sign me in next time'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Restarter extends StatefulWidget {
  const Restarter({required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestarterState>()?.restartApp();
  }

  @override
  State<Restarter> createState() => _RestarterState();
}

class _RestarterState extends State<Restarter> {
  Key key = UniqueKey();
  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
