part of '../view.dart';

class _ProductsView extends StatelessWidget {
  const _ProductsView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProdcutLoadingState) {
          return ProductSkeletonView();
        } else if (state is ProdcutSuccessState) {
          return ProductView(list: state.list);
        }
        return SizedBox();
      },
    );
  }
}

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.list, this.isScrolle = false});
  final List<ProductModel> list;
  final bool isScrolle;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: isScrolle
          ? BouncingScrollPhysics()
          : NeverScrollableScrollPhysics(),
      itemCount: list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 170 / 250,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return ProductItem(
          model: list[index],
        );
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.model, this.isSimilar = false});
  final ProductModel model;
  final bool isSimilar;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 9.r, left: 9.r, bottom: 9.r),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 5.5,
            spreadRadius: 0,
            color: Colors.black.withValues(alpha: .50),
          ),
        ],

        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () => goTo(
                  ProductDetailsView(
                    model: model,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(11.r),
                  child: Hero(
                    tag: isSimilar ? "similar${model.id}" : model.id,
                    child: AppImage(
                      image: model.image,
                      height: 170.h,

                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                child: Container(
                  alignment: Alignment.center,
                  height: 19.h,
                  width: 54.w,
                  decoration: BoxDecoration(
                    color: Color(0xff4C8613),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(11.r),
                      bottomLeft: Radius.circular(7.r),
                    ),
                  ),
                  child: Text(
                    '${model.discount}%',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            model.title,
            style: TextStyle(
              color: Color(0xff4C8613),
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
          Text(
            'السعر / 1كجم',
            style: TextStyle(
              color: Color(0xff808080),
              fontWeight: FontWeight.w300,
              fontSize: 12.sp,
            ),
          ),
          Flexible(
            child: Row(
              children: [
                Text(
                  '${model.price}ر.س',
                  style: TextStyle(
                    color: Color(0xff4C8613),
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  width: 10,
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
                Spacer(),
                BlocConsumer<AddCartCubit, AddCartState>(
                  listener: (context, state) {
                    if (state is AddCartSuccessState &&
                        state.id == model.id &&
                        !isSimilar) {
                      showMsg(state.succesMessage);
                    } else if (state is AddCartFailureState) {
                      showMsg(state.errorMessage, isError: true);
                    }
                  },
                  builder: (context, state) {
                    return Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        color: Color(0xff61B80C),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: IconButton(
                        alignment: Alignment.center,
                        onPressed: () async {
                          await context.read<AddCartCubit>().addCartProduct(
                            productId: model.id,
                          );
                        },
                        icon:
                            state is AddCartLoadingState &&
                                state.id == model.id &&
                                !isSimilar
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : AppImage(
                                image: 'add.svg',
                              ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
