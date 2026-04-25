part of '../view.dart';

class _UserInfoImage extends StatefulWidget {
  const _UserInfoImage({required this.image});
  final ValueChanged<String> image;

  @override
  State<_UserInfoImage> createState() => _UserInfoImageState();
}

class _UserInfoImageState extends State<_UserInfoImage> {
  XFile? imageFile;

  Future<void> pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (pickedImage != null) {
        setState(() {
          imageFile = pickedImage;
        });
        widget.image(pickedImage.path);
      }
    } catch (e) {
      print('Error picking image: $e');
    }
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
            child: imageFile == null
                ? AppImage(
                    image: CacheHelper.getImage(),
                    height: 88.h,
                    width: 83.w,
                    fit: BoxFit.cover,
                  )
                : Image.file(
                    File(imageFile!.path),
                    height: 88.h,
                    width: 83.w,
                    fit: BoxFit.cover,
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
