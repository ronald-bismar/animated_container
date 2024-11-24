import 'package:animated_container/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(title: 'Animated Container Flutter'),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool cambiarBorde = false;
  bool cambiarRadius = false;
  bool cambiarTamano = false;
  bool cambiarColor = false;

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: cambiarBorde ? 6 : 0,
      ),
      borderRadius: BorderRadius.circular(cambiarRadius ? 50 : 0),
      color: cambiarColor ? Colors.amberAccent : Colors.blue,
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(247, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: fifthColor,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: boxDecoration,
              width: cambiarTamano ? 100 : 300,
              height: cambiarTamano ? 100 : 300,
            ),
            buttonsControllers(),
          ],
        ),
      ),
    );
  }

  Wrap buttonsControllers() {
    return Wrap(
      spacing: 10,
      alignment: WrapAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => setState(() => cambiarBorde = !cambiarBorde),
          child: const Text('Cambiar Borde'),
        ),
        ElevatedButton(
          onPressed: () => setState(() => cambiarTamano = !cambiarTamano),
          child: const Text('Cambiar Tamaño'),
        ),
        ElevatedButton(
          onPressed: () => setState(() => cambiarColor = !cambiarColor),
          child: const Text('Cambiar Color'),
        ),
        ElevatedButton(
          onPressed: () => setState(() => cambiarRadius = !cambiarRadius),
          child: const Text('Cambiar Radius'),
        ),
      ],
    );
  }
}
