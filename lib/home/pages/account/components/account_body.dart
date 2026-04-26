part of '../view.dart';

class _AccountBody extends StatefulWidget {
  const _AccountBody();

  @override
  State<_AccountBody> createState() => _AccountBodyState();
}

class _AccountBodyState extends State<_AccountBody> {
  late List<_Model> list;

  @override
  void initState() {
    super.initState();
    _initializeList();
  }

  void _initializeList() {
    list = [
      _Model(
        image: 'user.png',
        onTap: () async {
          // الذهاب إلى صفحة التعديل والتحديث عند الرجوع
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UserInfoView()),
          );
          // تحديث البيانات بعد الرجوع
          if (mounted) {
            context.read<UserInfoCubit>().getUserInfo();
          }
        },
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
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          showMsg(state.message);
          CacheHelper.clear();
          goTo(LoginView(), canPop: false);
        } else if (state is LogoutFailure) {
          showMsg(state.message, isError: true);
        }
      },
      child: Expanded(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 17.r),
          itemCount: list.length,
          itemBuilder: (context, index) {
            bool isLogout = index == list.length - 1;

            return ListTile(
              onTap: isLogout
                  ? () {
                      showDialog(
                        context: context,
                        builder: (dialogContext) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          title: Text(
                            "تسجيل الخروج",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff4C8613),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: Text(
                            "هل أنت متأكد من تسجيل الخروج؟",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                          actionsAlignment: MainAxisAlignment.spaceEvenly,
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(dialogContext);
                              },
                              child: Text(
                                "إلغاء",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff4C8613),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(dialogContext);
                                context.read<LogoutCubit>().logout();
                              },
                              child: Text(
                                "خروج",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  : list[index].onTap,
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
              trailing: BlocBuilder<LogoutCubit, LogoutState>(
                builder: (context, state) {
                  if (isLogout && state is LogoutLoading) {
                    return SizedBox(
                      height: 18.h,
                      width: 18.w,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Color(0xff4C8613),
                      ),
                    );
                  }
                  return AppImage(
                    image: isLogout ? 'log_out.png' : 'arrow_left.png',
                    height: 18.h,
                    width: 18.w,
                  );
                },
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(
            height: 0,
            color: Color(0xffF6F6F6),
          ),
        ),
      ),
    );
  }

}

class _Model {
  final String title, image;
  final VoidCallback? onTap;

  _Model({this.onTap, required this.title, required this.image});
}
