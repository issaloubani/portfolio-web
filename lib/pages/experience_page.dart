import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:global_configs/global_configs.dart';
import 'package:my_website/configs/themes.dart';

import '../models/work.dart';
import '../widgets/button_menu.dart';
import '../widgets/work_details_widget.dart';

class ExperiencePage extends StatefulWidget {
  final BoxConstraints constraints;

  const ExperiencePage({Key? key, required this.constraints}) : super(key: key);

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  int _selectedIndex = 0;
  final List<Work> works = (GlobalConfigs().get("experience")['work'] as List)
      .map((e) => Work.fromJson(e))
      .toList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.constraints.maxWidth,
      height: widget.constraints.maxHeight,
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.2),
              child: SizedBox(
                height: 800,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "02. ",
                          style: highlightedTitleStyle,
                        ),
                        TextSpan(
                          text: "Where I've worked",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ButtonMenu(
                          width: 320,
                          works: works,
                          onIndexChanged: (index) {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Flexible(child: WorkDetailsWidget(
                          work: works[_selectedIndex],
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
