part of '../view.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 217.h,
      decoration: BoxDecoration(
        color: Color(0xff4C8613),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.r),
          bottomRight: Radius.circular(40.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
          ),
          Text(
            'حسابي',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: AppImage(
              image: CacheHelper.getImage(),
              height: 71.h,
              width: 76.w,
            ),
          ),
          Text(
            CacheHelper.getUserName(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            CacheHelper.getphoneNumber(),
            style: TextStyle(
              color: Color(0xffA2D273),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
