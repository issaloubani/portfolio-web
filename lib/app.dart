import 'package:flutter/material.dart';
import 'package:my_website/page_list.dart';
import 'package:my_website/providers/page_provider.dart';
import 'package:provider/provider.dart';
import 'package:ruki_nav_bar/ruki_nav_bar.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

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
          home: Consumer<PageProvider>(
            builder: (context, pageProvider, child) {
              return LayoutBuilder(
                builder: (_, constraints) {
                  return SiteNavBar.get(
                    body: WebSmoothScroll(
                      scrollOffset: 100,
                      animationDuration: 500,
                      controller: pageProvider.pageController,
                      child: PageList(
                        constraints,
                        pageController: pageProvider.pageController,
                      ),
                    ),
                    showFab: true,
                    indicatorLineThickness: 4,
                    drawerMode: NavDrawerMode.full,
                    pageIndicator: PageIndicator.line,
                    itemPosition: NavItemPosition.center,
                    drawerHeader: Container(),
                    leading: const Text(
                      "Logo",
                      style: TextStyle(color: Colors.red, fontSize: 30),
                    ),
                    navItemSpacing: 8,
                    navItems: pageProvider.titles.asMap().entries.map((e) {
                      return NavItem(
                          relativeIndex: e.key,
                          label: e.value,
                          activeColor: Colors.blue,
                          onTap: () => pageProvider.animateToPage(e.key));
                    }).toList(),
                  ).getNavBar(
                      DeviceType.desktop.currentDevice(constraints.maxWidth));
                },
              );
            },
          )),
    );
  }
}
