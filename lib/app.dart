import 'package:flutter/material.dart';
import 'package:my_website/page_list.dart';
import 'package:my_website/providers/page_provider.dart';
import 'package:provider/provider.dart';

import 'page_container.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageProvider()),
      ],
      child: MaterialApp(
        title: 'Portfolio',
        // theme: ThemeData(
        //   scrollbarTheme: ScrollbarThemeData(
        //     thumbColor: MaterialStateProperty.all(Colors.black),
        //     trackColor: MaterialStateProperty.all(Colors.black),
        //   ),
        // ),
        debugShowCheckedModeBanner: false,
        home: PageContainer(),
      ),
    );
  }
}
