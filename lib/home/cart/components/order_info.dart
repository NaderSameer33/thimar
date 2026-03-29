part of '../view.dart';
class _OrderInfo extends StatelessWidget {
  const _OrderInfo({
    required this.title,
    required this.value,
    this.isTotal = false,
  });
  final String title, value;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
              color: Color(0xff4C8613),
            ),
          ),
          Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
              color: Color(0xff4C8613),
            ),
          ),
        ],
      ),
    );
  }
}
