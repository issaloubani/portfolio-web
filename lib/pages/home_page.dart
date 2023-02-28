import 'package:flutter/material.dart';
import 'package:global_configs/global_configs.dart';

class HomePage extends StatelessWidget {
  final BoxConstraints constraints;
  final String name = GlobalConfigs().get("name");
  final String bio = GlobalConfigs().get("summary");

  HomePage({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth,
      height: constraints.maxHeight,
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
                  CircleAvatar(
                    minRadius: 120,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Fullstack Developer",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  TextButton(onPressed: () {}, child: Text("LinkedIn"))
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
                  Text(
                    name,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: constraints.maxWidth * 0.4,
                    child: Text(
                      bio,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("Download"))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
