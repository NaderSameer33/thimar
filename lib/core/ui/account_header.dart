import 'package:flutter/widgets.dart';
import 'package:thimar/core/ui/app_back.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppBack(),

        Spacer(),
        Text(
          title,
          style: TextStyle(
            color: Color(0xff4C8613),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
