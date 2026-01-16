import 'package:flutter/material.dart';

class ActionItem extends StatelessWidget {
  final String id;

  final String title;
  final String description;
  final String type;
  final bool isChecked;
  final ValueChanged<bool?>? onChanged;

  const ActionItem({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.isChecked,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.pinkAccent.withAlpha(50),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$id - $title',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(description),
                  SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.pinkAccent.withAlpha(50),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(type),
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Checkbox(
                              value: isChecked,
                              onChanged: onChanged,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
