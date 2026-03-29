part of '../view.dart';

class _ProductDetailsDescrption extends StatelessWidget {
  const _ProductDetailsDescrption({
    required this.model,
  });

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 22.r, left: 10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 12.h,
          ),
          Divider(
            thickness: 0,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                'كود المنتج',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.sp,
                  color: Color(0xff4C8613),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                ((model.amount).toInt()).toString(),
                style: TextStyle(
                  color: Color(0xff808080),
                  fontWeight: FontWeight.w300,
                  fontSize: 19.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 0,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'تفاصيل المنتج',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.sp,
              color: Color(0xff4C8613),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            model.descrption,
            style: TextStyle(
              color: Color(0xff757575),
              fontSize: 14.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
