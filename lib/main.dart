import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Counter App Redesign'),
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
  int _counter = 0;
  void _incrementCounter() => setState(() => _counter++); // Fully converted to arrow function...
  void _decrementCounter() => setState(() {
    if (_counter > 0) _counter--;
  }); // Reduce number
  void _resetCounter() => setState(() => _counter = 0);   // Reset number

  ButtonStyle buttonStyle = ButtonStyle(
    padding: WidgetStateProperty.all(EdgeInsets.all(20)),
    backgroundColor: WidgetStateProperty.all(Colors.deepOrange),
    iconColor: WidgetStateProperty.all(Colors.white),
    shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.orange, width: 2)
        )
    ),
    elevation: WidgetStateProperty.all(10),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2D1B69),
        title: Text(
          'COUNTER GAME',
          style: TextStyle(
            color: Colors.yellowAccent,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 10,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color(0xFF2D1B69),
              Color(0xFF0F0F0F),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'YOUR SCORE',
                style: TextStyle(
                  color: Colors.yellowAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$_counter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Add Button
                  Tooltip(
                    message: "Increase Counter",
                    child: ElevatedButton(
                        onPressed: _incrementCounter,
                        style: buttonStyle,
                        child: Icon(Icons.keyboard_arrow_up, size: 30)
                    ),
                  ),
                  SizedBox(width: 40,),
                  // Reduce Button
                  Tooltip(
                    message: "Decrease Counter",
                    child: ElevatedButton(
                        onPressed: _decrementCounter,
                        style: buttonStyle,
                        child: Icon(Icons.keyboard_arrow_down, size: 30)
                    ),
                  ),
                  SizedBox(width: 40,),
                  // Reset Button
                  Tooltip(
                    message: "Reset Counter to 0",
                    child: ElevatedButton(
                        onPressed: _resetCounter,
                        style: buttonStyle,
                        child: Icon(Icons.refresh, size: 30)
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
