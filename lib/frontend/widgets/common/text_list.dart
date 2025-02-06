import 'package:flutter/material.dart';

enum TextListType {
  number,
  bulletPoint,
}

class TextList extends StatelessWidget {
  const TextList(
      {super.key, required this.texts, this.type = TextListType.bulletPoint});
  final List<String> texts;
  final TextListType type;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: texts
          .asMap()
          .map((index, item) => MapEntry(
              index,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  type == TextListType.bulletPoint
                      ? const Padding(
                          padding: EdgeInsets.fromLTRB(8, 6, 8, 0),
                          child: Icon(Icons.circle, size: 8),
                        )
                      : SizedBox(width: 24, child: Text('${index + 1}.')),
                  Expanded(child: Text(item)),
                ],
              )))
          .values
          .toList(),
    );
  }
}
