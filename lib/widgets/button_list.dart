import 'package:flutter/material.dart';

import '../configs/themes.dart';

class ButtonList extends StatefulWidget {
  final Map<String, Function> buttons;

  const ButtonList({Key? key, required this.buttons}) : super(key: key);

  @override
  State<ButtonList> createState() => _ButtonListState();
}

class _ButtonListState extends State<ButtonList> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: widget.buttons.entries
            .map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  style: topPageButtonStyle,
                  onPressed: () {
                    e.value();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                        text: TextSpan(
                      style: Theme.of(context).textTheme.button!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                      children: [
                        TextSpan(
                          text: "0${widget.buttons.keys.toList().indexOf(e.key) + 1}.",
                          style: Theme.of(context).textTheme.button!.copyWith(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                              ),
                        ),
                        TextSpan(
                          text: "   ",
                        ),
                        TextSpan(
                          text: e.key,
                        ),
                        /*  WidgetSpan(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),*/
                      ],
                    )),
/*                    child: Text(
                      e.key,
                      style: Theme.of(context).textTheme.button!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                    ),*/
                  ),
                ),
              ),
            )
            .toList());
  }
}
