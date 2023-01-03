import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(const MyApp());
}

Stream<String> getDateTime() => Stream.periodic(
      const Duration(seconds: 1),
      (_) => DateTime.now().toIso8601String(),
    );

class MyApp extends HookWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dateTime = useStream(getDateTime());
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
      appBar: AppBar(
        title:  Text(dateTime.data ?? 'home page'),
      ),
    ),
    );
  }
}



