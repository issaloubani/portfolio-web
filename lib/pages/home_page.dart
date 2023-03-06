import 'dart:html' as html;
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:global_configs/global_configs.dart';
import 'package:ionicons/ionicons.dart';

import '../configs/themes.dart';

class HomePage extends StatelessWidget {
  final BoxConstraints constraints;

  const HomePage({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: _CenterElement(constraints: constraints)),
      ],
    );
  }
}

class _CenterElement extends StatefulWidget {
  final BoxConstraints constraints;

  const _CenterElement({Key? key, required this.constraints}) : super(key: key);

  @override
  State<_CenterElement> createState() => _CenterElementState();
}

class _CenterElementState extends State<_CenterElement> {
  final String name = GlobalConfigs().get("name");
  final String bio = GlobalConfigs().get("summary");

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.constraints.maxWidth,
      height: widget.constraints.maxHeight,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.only(top: 100, left: 200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("assets/images/me.jpeg"),
                      maxRadius: 120,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Fullstack Developer",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      html.window.open("https://www.linkedin.com/in/issa-loubani-6195a5200/", "linkedin");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Linked",
                              style: Theme.of(context).textTheme.button!.copyWith(color: Colors.blue),
                            ),
                            WidgetSpan(child: SizedBox(width: 5)),
                            WidgetSpan(
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Center(
                                  child: Text("In",style: Theme.of(context).textTheme.button!.copyWith(color: Colors.white),),
                                )
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              margin: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "01. ",
                        style: highlightedTitleStyle,
                      ),
                      TextSpan(
                        text: "Who am I ...",
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
                  Text(
                    name,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.greenAccent,
                        ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: widget.constraints.maxWidth * 0.4,
                    child: Text(
                      bio,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      AnchorElement anchorElement = AnchorElement(href: "assets/resume/Issa Loubani Resume.pdf");
                      anchorElement.download = "Issa Loubani Resume.pdf";
                      anchorElement.click();
                    },
                    icon: Icon(Icons.download),
                    label: Text("Download CV"),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
