part of '../view.dart';

class _UserInfoImage extends StatefulWidget {
  const _UserInfoImage();

  @override
  State<_UserInfoImage> createState() => _UserInfoImageState();
}

class _UserInfoImageState extends State<_UserInfoImage> {
  XFile? image;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      this.image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: pickImage,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),

            child: image == null
                ? AppImage(
                    image: CacheHelper.getImage(),
                    height: 88.h,
                    width: 83.w,
                  )
                : Image.file(
                    File(image!.path),
                    height: 88.h,
                    width: 83.w,
                    fit: BoxFit.fill,
                  ),
          ),
        ),
        Positioned(
          child: AppImage(
            height: 18.h,
            width: 18.w,
            image: 'camera.png',
          ),
        ),
      ],
    );
  }
}
