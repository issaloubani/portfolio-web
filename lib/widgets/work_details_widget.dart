import 'package:flutter/material.dart';
import '../models/work.dart';

class WorkDetailsWidget extends StatelessWidget {
  final Work work;

  const WorkDetailsWidget({
    Key? key,
    required this.work,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          work.title,
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Colors.greenAccent,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: 10,
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: work.companyName,
              style: Theme.of(context).textTheme.headline5,
            ),
            WidgetSpan(
              child: SizedBox(
                width: 15,
              ),
            ),
            WidgetSpan(
              child: Icon(Icons.location_on_outlined, size: 28),
              style: Theme.of(context).textTheme.headline5,
            ),
            WidgetSpan(
              child: SizedBox(
                width: 8,
              ),
            ),
            TextSpan(
              text: work.companyLocation,
              style: Theme.of(context).textTheme.headline5,
            ),
          ]),
        ),
        SizedBox(
          height: 10,
        ),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                ),
            children: [
              TextSpan(
                text: work.companyPhone,
              ),
              WidgetSpan(child: SizedBox(width: 10)),
              TextSpan(
                text: "-",
              ),
              WidgetSpan(child: SizedBox(width: 10)),
              TextSpan(
                text: work.companyWebsite,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          work.date,
          style: TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          work.description,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Responsibilities:",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: work.responsibilities
              .map(
                (e) => Text(
                  "- $e",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
