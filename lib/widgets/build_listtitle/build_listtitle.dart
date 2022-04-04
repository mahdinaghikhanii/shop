import 'package:flutter/material.dart';

class BuildListTile extends StatelessWidget {
  const BuildListTile(
      {Key? key,
      required this.ontap,
      required this.color,
      required this.icon,
      required this.title,
      required this.trailing})
      : super(key: key);
  final String title, trailing;
  final IconData icon;
  final Color color;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: color.withAlpha(30)),
            child: Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
          ),
          title: Text(title, style: textTheme.headline6),
          trailing: SizedBox(
            width: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(trailing,
                    style: textTheme.bodyText1
                        ?.copyWith(color: Colors.grey.shade600)),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ],
            ),
          ),
          onTap: ontap),
    );
  }
}
