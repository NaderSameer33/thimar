part of '../view.dart';

class _Heder extends StatefulWidget {
  const _Heder();

  @override
  State<_Heder> createState() => _HederState();
}

class _HederState extends State<_Heder> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppImage(
              image: 'app_logo.png',
              height: 24.h,
              width: 24.w,
            ),
            Text(
              'سلة ثمار',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: Color(0xff4C8613),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 13.w,
        ),
        Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            text: 'التوصيل إلى\n',
            style: TextStyle(
              color: Color(0xff4C8613),
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
            children: [
              TextSpan(
                text: 'شارع الملك فهد - جدة',
                style: TextStyle(
                  color: Color(0xff4C8613),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              alignment: Alignment.center,
              height: 33.h,
              width: 33.w,
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                borderRadius: BorderRadius.circular(9.r),
              ),
              child: IconButton(
                onPressed: () => goTo(
                  CartView(
                    cartCount: (count) {
                      this.count = count;
                    },
                  ),
                ),
                icon: AppImage(
                  image: 'bag.svg',
                  height: 20.h,
                  width: 20.w,
                ),
              ),
            ),
            if (count > 0)
              Positioned(
                top: -5,
                right: -5,
                child: Container(
                  alignment: Alignment.center,
                  height: 15.h,
                  width: 15.w,
                  decoration: BoxDecoration(
                    color: Color(0xff4C8613),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      count.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
