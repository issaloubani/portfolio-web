import 'package:flutter/material.dart';
import 'package:my_website/pages/home_page.dart';
import 'package:my_website/pages/projects_page.dart';
import 'package:my_website/providers/page_provider.dart';
import 'package:provider/provider.dart';
import 'package:ruki_nav_bar/ruki_nav_bar.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class PageList extends StatelessWidget {
  const PageList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PageProvider>(
      builder: (context, pageProvider, child) {
        return LayoutBuilder(
          builder: (_, constraints) {
            return SiteNavBar.get(
              body: WebSmoothScroll(
                scrollOffset: 100,
                animationDuration: 500,
                controller: pageProvider.pageController,
                child: Consumer<PageProvider>(
                  builder: (context, pageProvider, child) {
                    return SizedBox(
                      height: constraints.maxHeight,
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: pageProvider.pageController,
                        children: [
                          HomePage(constraints: constraints),
                          ProjectsPage(constraints: constraints),
                          Container(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    );
                  },
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
            ).getNavBar(DeviceType.desktop.currentDevice(constraints.maxWidth));
          },
        );
      },
    );
  }
}
