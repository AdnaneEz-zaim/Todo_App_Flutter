import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo/shared/conts/blocObserver.dart';

import 'layout/homme_page.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HommePage(),
    );
  }
}
