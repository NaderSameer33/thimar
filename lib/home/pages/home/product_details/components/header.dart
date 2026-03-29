part of '../view.dart';

class _ProductDetailsHeader extends StatefulWidget {
  const _ProductDetailsHeader({required this.model});
  final ProductModel model;
  @override
  State<_ProductDetailsHeader> createState() => _ProductDetailsHeaderState();
}

class _ProductDetailsHeaderState extends State<_ProductDetailsHeader> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: widget.model.id,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40.r),
              bottomRight: Radius.circular(40.r),
            ),
            child: AppImage(
              height: 322.h,
              fit: BoxFit.fill,
              width: double.infinity,
              image: widget.model.image,
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.r,
              vertical: 46.r,
            ),
            height: 147.h,
            width: 375.w,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppBack(),
                FavoriteButton(
                  isFavourite: widget.model.isFavourite,
                  productId: widget.model.id,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    super.key,
    required this.productId,
    required this.isFavourite,
  });
  final int productId;
  final bool isFavourite;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late bool favouriteItem;

  @override
  void initState() {
    super.initState();
    favouriteItem = widget.isFavourite;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavouriteCubit, FavouriteState>(
      listener: (context, state) {
        if (state is FavouriteSuccessState) {
          setState(() {
            favouriteItem = !favouriteItem;
          });
          showMsg(state.succesMessage);
        } else if (state is FavouriteFailureState) {
          showMsg(state.errorMessage, isError: true);
        }
      },
      child: Container(
        height: 30.h,
        width: 30.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11.r),
          color: Color(0xff4C8613),
        ),
        child: IconButton(
          onPressed: () async {
            if (!favouriteItem) {
              await context.read<FavouriteCubit>().addFavouriteProduct(
                productId: widget.productId,
              );
            } else {
              await context.read<FavouriteCubit>().removeFavouriteProduct(
                productId: widget.productId,
              );
            }
          },
          icon: Icon(
            Icons.favorite,
            color: favouriteItem ? Colors.red : Colors.white,
            size: 17,
          ),
        ),
      ),
    );
  }
}
