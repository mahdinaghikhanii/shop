import 'package:flutter/material.dart';
import 'package:shop/constant.dart';

class ShowToast extends StatelessWidget {
  const ShowToast({Key? key, required this.msg}) : super(key: key);
  final String msg;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          //icon
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: const Icon(
              Icons.badge_outlined,
              color: kyellow,
            ),
          ),

          //msg
          Text(
            msg,
            style:
                Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 14),
          ),
        ]),
      ),
    );
  }
}
