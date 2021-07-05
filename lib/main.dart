import 'package:do_it_app/ui/pages/plan/plan_view.dart';
import 'package:do_it_app/ui/pages/root_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'do-it',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => RootPage()),
        GetPage(name: '/plan', page: () => PlanView()),
      ],
    );
  }
}
