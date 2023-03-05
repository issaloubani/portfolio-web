import 'package:flutter/material.dart';
import 'package:global_configs/global_configs.dart';

import '../models/work.dart';

class ButtonMenu extends StatefulWidget {
  final Function(int index) onIndexChanged;
  final List<Work> works;
  final double width;

  const ButtonMenu({Key? key, required this.onIndexChanged, required this.works, this.width = 200}) : super(key: key);

  @override
  State<ButtonMenu> createState() => _ButtonMenuState();
}

class _ButtonMenuState extends State<ButtonMenu> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          /*borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),*/
          ),
      width: widget.width,
      child: Column(
        children: widget.works
            .map(
              (e) => ButtonMenuItem(
                width: widget.width,
                isSelected: selectedIndex == widget.works.indexOf(e),
                title: e.companyName,
                onPressed: () {
                  setState(() {
                    selectedIndex = widget.works.indexOf(e);
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
