import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_website/pages/experience_page.dart';
import 'package:my_website/pages/home_page.dart';
import 'package:my_website/widgets/button_list.dart';
import 'package:global_configs/global_configs.dart';
import 'common/utils.dart';
import 'pages/projects_page.dart';
import 'dart:html' as html;

final GlobalKey<PageContainerState> pageContainerKey = GlobalKey();

class PageContainer extends StatefulWidget {
  PageContainer({Key? key}) : super(key: pageContainerKey);

  @override
  State<PageContainer> createState() => PageContainerState();
}

class PageContainerState extends State<PageContainer> {
  Widget? content;
  late BoxConstraints constraints;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setContent(HomePage(constraints: constraints));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: LayoutBuilder(
          builder: (context, constraints) {
            this.constraints = constraints;
            return Stack(
              children: [
                Positioned(
                  left: 100,
                  top: 100,
                  bottom: 200,
                  child: _LeftElement(),
                ),
                Positioned(
                  right: 100,
                  top: 100,
                  bottom: 200,
                  child: _RightElement(),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return _BottomElement(width: constraints.maxWidth);
                    },
                  ),
                ),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  child: content ?? Container(),
                ),
              ],
            );
          },
        ));
  }

  setContent(Widget content) {
    setState(() {
      this.content = content;
    });
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final pageNameList = GlobalConfigs().get("titles") ?? [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Spacer(),
          ButtonList(buttons: {
            pageNameList[0]['name'] ?? "Home": () {
              pageContainerKey.currentState?.setContent(HomePage(constraints: pageContainerKey.currentState!.constraints));
            },
            pageNameList[1]['name'] ?? "Experience": () {
              pageContainerKey.currentState?.setContent(ExperiencePage(constraints: pageContainerKey.currentState!.constraints));
            },
            pageNameList[2]['name'] ?? "Work": () {
              pageContainerKey.currentState?.setContent(ProjectsPage(constraints: pageContainerKey.currentState!.constraints));
            },
          }),
          SizedBox(
            width: 200,
          ),
        ],
      ),
    );
  }
}

class _RightElement extends StatelessWidget {
  const _RightElement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: VerticalDivider(
        thickness: 1,
      ),
    );
  }
}

class _LeftElement extends StatelessWidget {
  const _LeftElement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: VerticalDivider(
            thickness: 1,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Tooltip(
          message: "Instagram",
          preferBelow: false,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                html.window.open("https://www.instagram.com/issa.loubani.5/", "issa.loubani.5");
              },
              child: Icon(
                Ionicons.logo_instagram,
                size: 30,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Tooltip(
          message: "issa.loubani.5@gmail.com",
          child: Icon(
            Icons.email,
            size: 30,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: VerticalDivider(
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

class _BottomElement extends StatelessWidget {
  final double width;
  final String footerText = GlobalConfigs().get("footer") ?? "Developed & Designed by Issa Loubani using Flutter\n2023";

  _BottomElement({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darken(Theme.of(context).scaffoldBackgroundColor, 0.04),
      width: width,
      height: 100,
      child: Center(
        child: Text(
          footerText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
            color: darken(Colors.white, 0.2),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
