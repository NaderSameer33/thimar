part of '../view.dart' ;
class _NOtificationItem extends StatelessWidget {
  const _NOtificationItem();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 32.h,

          width: 32.w,
          decoration: BoxDecoration(
            color: Colors.blueGrey[50],
            borderRadius: BorderRadius.circular(9.r),
          ),
          child: AppImage(image: 'note.svg'),
        ),
        SizedBox(
          width: 10.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'تم قبول طلبك وجاري تحضيره الأن',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم \n توليد هذا النص من مولد النص العربى',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
              ),
            ),
            Text(
              'منذ ساعتان',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
