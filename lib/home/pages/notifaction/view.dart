import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/ui/app_image.dart';
part 'components/item.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              textAlign: TextAlign.center,
              'الإشعارات',
              style: TextStyle(
                color: Color(0xff4C8613),
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    onDismissed: (dirction) {
                      setState(() {
                        list.removeAt(index);
                      });
                    },
                    key: ValueKey(list[index]),
                    background: Container(
                      color: Colors.red,
                      child: AppImage(
                        image: 'trash.svg',
                        color: Colors.white,
                      ),
                    ),

                    direction: DismissDirection.startToEnd,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: _NOtificationItem(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
