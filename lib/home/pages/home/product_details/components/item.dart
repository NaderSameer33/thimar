part of '../view.dart';

class _ProductDetailsItme extends StatelessWidget {
  const _ProductDetailsItme({
    required this.model,
    required this.productCoount,
  });

  final ProductModel model;
  final ValueChanged<int> productCoount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 23.r, left: 10.r),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp,
                  color: Colors.green,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${model.discount}%',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 13.sp,
                      color: Colors.red,
                    ),
                  ),

                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${model.price}ر.س',
                    style: TextStyle(
                      color: Color(0xff4C8613),
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    ' ${model.priceBeforeDiscount}ر.س',
                    style: TextStyle(
                      color: Color(0xff808080),
                      fontWeight: FontWeight.w300,
                      fontSize: 12.sp,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'السعر / 1كجم',
                style: TextStyle(
                  color: Color(0xff808080),
                  fontWeight: FontWeight.w300,
                  fontSize: 19.sp,
                ),
              ),
              AppAddRemoveItem(
                productId: model.id,
                onChanged: productCoount,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
