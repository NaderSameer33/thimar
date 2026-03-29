part of '../view.dart';
class _Header extends StatelessWidget {
  const _Header(
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppBack(),
    
        Spacer(),
        Text(
          'السلة',
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
