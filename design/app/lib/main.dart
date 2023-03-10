import 'package:drawer/orientation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            fontSize: 36,
            fontStyle: FontStyle.italic,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
          ),
        ),
        useMaterial3: true);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Design Cookbook"),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
              ],
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    'Drawer Header',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.message),
                  title: Text('Messages'),
                ),
                const ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Profile'),
                ),
                const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Close Drawer'),
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              MyHomePage(title: 'Flutter Demo Home Page'),
              MyHomePage(title: 'Flutter Demo Home Page'),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Using the Raleway font from the awesome_fonts',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 20,
          ),
        ),
        const Text(
          'Using the Raleway Italic font from the awesome_fonts',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
        ),
        const Text(
          'Using the Raleway Extrabold font',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        const Text(
          'Using the Raleway Extrabold font declared in awesome_fonts',
          style: TextStyle(
            fontFamily: 'Raleway',
            package: 'awesome_fonts',
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        Image.asset(
          'packages/awesome_fonts/logo.png',
        ),
        Image.asset(
          'logo.png',
          package: 'awesome_fonts',
        ),
        const SnackBarPage(),
        const SizedBox(height: 20),
        Theme(
          data: Theme.of(context).copyWith(
            filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
            ),
          ),
          child: FilledButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrientationPage(),
                ),
              );
            },
            child: const Text("Go to Orientation By Size Page"),
          ),
        ),
      ],
    );
  }
}

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text("Yay! A SnackBar!"),
            action: SnackBarAction(label: 'Done', onPressed: () {}),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text("Show SnackBar"),
      ),
    );
  }
}
