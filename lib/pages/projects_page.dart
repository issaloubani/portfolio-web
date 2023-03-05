import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  final BoxConstraints constraints;

  const ProjectsPage({required this.constraints, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // TODO: Create a page for project showcase, still under dev for now
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.build, color: Colors.greenAccent),
            SizedBox(
              width: 20,
            ),
            Text('Still Under development',style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),),
          ],
        ),
        /*GridView.extent(
          shrinkWrap: true,
          maxCrossAxisExtent: 600,
          childAspectRatio: 12 / 6,
          mainAxisSpacing: 20,
          children: [
            ProjectTile(constraints: constraints),
            ProjectTile(constraints: constraints),
            ProjectTile(constraints: constraints),
            ProjectTile(constraints: constraints),
            ProjectTile(constraints: constraints),
            ProjectTile(constraints: constraints),
            ProjectTile(constraints: constraints),
            ProjectTile(constraints: constraints),
            ProjectTile(constraints: constraints),
            ProjectTile(constraints: constraints),
          ],
        ),*/
      ],
    );
  }
}

class ProjectTile extends StatefulWidget {
  final BoxConstraints constraints;

  const ProjectTile({Key? key, required this.constraints}) : super(key: key);

  @override
  State<ProjectTile> createState() => _ProjectTileState();
}

class _ProjectTileState extends State<ProjectTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
