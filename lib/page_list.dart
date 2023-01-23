import 'package:flutter/material.dart';
import 'package:my_website/pages/home_page.dart';
import 'package:my_website/pages/projects_page.dart';
import 'package:my_website/providers/page_provider.dart';
import 'package:provider/provider.dart';

class PageList extends StatelessWidget {
  final BoxConstraints constraints;
  final PageController pageController;

  const PageList(
    this.constraints, {
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PageProvider>(
      builder: (context, pageProvider, child) {
        return SizedBox(
          height: constraints.maxHeight,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
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
    );
  }
}
