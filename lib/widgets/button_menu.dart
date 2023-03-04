import 'package:flutter/material.dart';
import 'package:global_configs/global_configs.dart';

class ButtonMenu extends StatefulWidget {
  final Function(int index) onIndexChanged;

  const ButtonMenu({Key? key, required this.onIndexChanged}) : super(key: key);

  @override
  State<ButtonMenu> createState() => _ButtonMenuState();
}

class _ButtonMenuState extends State<ButtonMenu> {
  int selectedIndex = 0;
  List<dynamic> titles = GlobalConfigs().get("experience")['work'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          /*borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),*/
          ),
      width: 200,
      child: Column(
        children: titles
            .map(
              (e) => ButtonMenuItem(
                width: 300,
                isSelected: selectedIndex == titles.indexOf(e),
                title: e['title'],
                onPressed: () {
                  setState(() {
                    selectedIndex = titles.indexOf(e);
                  });
                  widget.onIndexChanged(selectedIndex);
                },
                color: Colors.blueAccent,
              ),
            )
            .toList(),
      ),
    );
  }
}

class ButtonMenuItem extends StatelessWidget {
  final double width;
  final String title;
  final Function onPressed;
  final bool isSelected;
  final Color color;

  const ButtonMenuItem({Key? key, required this.width, required this.title, required this.onPressed, required this.isSelected, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? color.withOpacity(0.4) : Colors.transparent,
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: SizedBox(
            width: width,
            height: 60,
            child: Row(
              children: [
                Container(
                  width: 5,
                  color: isSelected ? color : Colors.transparent,
                ),
                SizedBox(
                  width: 10,
                ),
                Center(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.button!.copyWith(
                          color: isSelected ? Colors.white : Colors.grey[300],
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                        ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
