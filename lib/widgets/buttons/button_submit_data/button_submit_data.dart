import 'package:flutter/material.dart';
import 'package:shop/constant.dart';
import 'package:shop/main.dart';

class ButtonSubmitData extends StatelessWidget {
  const ButtonSubmitData({Key? key, required this.ontap}) : super(key: key);

  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(Constans.padding),
      child: InkWell(
        borderRadius: BorderRadius.circular(Constans.bigBorderRadios),
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
              color: appProvider.brighness
                  ? Colors.grey.shade700
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(Constans.bigBorderRadios)),
          width: double.infinity,
          height: 55,
          child: Center(
            child: Text('Submit !',
                style: textTheme.subtitle1?.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w400, color: kyellow)),
          ),
        ),
      ),
    );
  }
}
