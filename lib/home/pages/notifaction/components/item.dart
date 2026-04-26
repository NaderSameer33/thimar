part of '../view.dart' ;
class _NOtificationItem extends StatelessWidget {
  const _NOtificationItem({required this.model});
  final NotificationModel model;

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
          child: AppImage(
            image: model.image.isNotEmpty ? model.image : 'note.svg',
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                model.body,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                model.createdAt,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

