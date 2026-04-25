part of '../view.dart';

class _AccountBody extends StatefulWidget {
  const _AccountBody();

  @override
  State<_AccountBody> createState() => _AccountBodyState();
}

class _AccountBodyState extends State<_AccountBody> {
  final list = [
    _Model(
      image: 'user.png',
      onTap: () => goTo(
        UserInfoView(),
      ),
      title: 'البيانات الشخصية',
    ),
    _Model(
      image: 'wallet.png',
      onTap: () => goTo(
        WalletView(),
      ),
      title: 'المحفظة',
    ),
    _Model(
      image: 'location.png',
      onTap: () => goTo(
        AddressView(),
      ),
      title: 'العناوين',
    ),
    _Model(
      image: 'question.png',
      onTap: () => goTo(
        QuestionView(),
      ),
      title: 'أسئلة متكررة',
    ),
    _Model(
      image: 'privacy.png',
      onTap: () => goTo(
        PrivacyView(),
      ),
      title: 'سياسة الخصوصية',
    ),
    _Model(
      image: 'calling.png',
      onTap: () => goTo(
        ContactUsView(),
      ),
      title: 'تواصل معنا',
    ),
    _Model(
      image: 'issues.png',
      onTap: () => goTo(
        IssuesView(),
      ),
      title: 'الشكاوي والأقتراحات',
    ),
    _Model(
      image: 'share_app.png',
      onTap: () {},
      title: 'مشاركة التطبيق',
    ),
    _Model(
      image: 'about_us.png',
      onTap: () => goTo(
        AboutUsView(),
      ),
      title: 'عن التطبيق',
    ),
    _Model(
      image: 'localization.png',
      onTap: () {},
      title: 'تغيير اللغة',
    ),
    _Model(
      image: 'term.png',
      onTap: () {},
      title: 'الشروط والأحكام',
    ),
    _Model(
      image: 'rating.png',
      onTap: () {},
      title: 'تقييم التطبيق',
    ),
    _Model(
      image: '',
      onTap: () async {
        goTo(LoginView());
        await CacheHelper.clear();
      },
      title: 'تسجيل الخروج',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 17.r),
        itemCount: list.length,
        itemBuilder: (context, index) {
          bool isLogout = index == list.length - 1;

          return ListTile(
            onTap: list[index].onTap,
            title: Text(
              list[index].title,
              style: TextStyle(
                color: Color(0xff4C8613),
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
              ),
            ),

            leading: isLogout
                ? null
                : AppImage(
                    image: list[index].image,
                    height: 18.h,
                    width: 14.w,
                    color: Color.fromRGBO(76, 134, 19, 1),
                  ),
            trailing: AppImage(
              image: isLogout ? 'log_out.png' : 'arrow_left.png',
              height: 18.h,
              width: 18.w,
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(
          height: 0,
          color: Color(0xffF6F6F6),
        ),
      ),
    );
  }
}

class _Model {
  final String title, image;
  final VoidCallback onTap;

  _Model({required this.onTap, required this.title, required this.image});
}
