import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/logic/helper_methods.dart';
import 'package:thimar/home/pages/notifaction/cubit/notification_cubit.dart';
import 'package:thimar/home/pages/notifaction/cubit/notification_state.dart';
import 'package:thimar/home/pages/notifaction/model/notification_model.dart';
import '../../../core/ui/app_image.dart';
import '../../../core/ui/app_back.dart';
part 'components/item.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit()..getNotifications(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'الإشعارات',
            style: TextStyle(
              color: Color(0xff4C8613),
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
          actions: [
            Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  context.read<NotificationCubit>().clearAllNotifications();
                },
                icon: AppImage(
                  image: 'trash.svg',
                  color: Colors.red,
                ),
              );
            }),
          ],
        ),
        body: SafeArea(
          child: BlocConsumer<NotificationCubit, NotificationState>(
            listener: (context, state) {
              if (state is NotificationActionSuccess) {
                showMsg(state.message);
              } else if (state is NotificationActionFailure) {
                showMsg(state.errorMessage, isError: true);
              }
            },
            buildWhen: (previous, current) =>
                current is NotificationSuccessState ||
                current is NotificationLoadingState ||
                current is NotificationFailureState,
            builder: (context, state) {
              if (state is NotificationLoadingState) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Color(0xff4C8613),
                  ),
                );
              } else if (state is NotificationSuccessState) {
                final list = state.data.notifications;
                if (list.isEmpty) {
                  return Center(
                    child: AppImage(image: 'not_found.json'),
                  );
                }
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final item = list[index];
                    return Dismissible(
                      onDismissed: (direction) {
                        context
                            .read<NotificationCubit>()
                            .deleteNotification(item.id);
                      },
                      key: ValueKey(item.id),
                      background: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 20),
                        child: AppImage(
                          image: 'trash.svg',
                          color: Colors.white,
                        ),
                      ),
                      direction: DismissDirection.startToEnd,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: _NOtificationItem(model: item),
                      ),
                    );
                  },
                );
              } else if (state is NotificationFailureState) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

