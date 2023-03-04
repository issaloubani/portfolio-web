import 'package:flutter/material.dart';
import 'package:my_website/pages/experience_page.dart';
import 'package:my_website/pages/home_page.dart';
import 'package:my_website/widgets/button_list.dart';
import 'package:global_configs/global_configs.dart';
import 'pages/projects_page.dart';

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
            return AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: content ?? Container(),
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
