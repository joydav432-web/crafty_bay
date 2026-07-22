import 'package:crafty_bay/features/auth/presentation/screens/signin_screen.dart';
import 'package:crafty_bay/features/shered/presentation/widgets/incre_decre_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/providers/auth_controller.dart';
import '../../../cart/data/model/add_to_cart_pharms.dart';
import '../../../cart/provider/add_to_card_provider.dart';
import '../../../reviews/screen/review_screen.dart';
import '../../../shered/presentation/widgets/show_snackbar_message.dart';
import '../../provider/products_details_provider.dart';
import '../widget/color_picker.dart';
import '../widget/image_carosule_slider.dart';
import '../widget/size_picker.dart';
import '../widget/totalprize_cart_section.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final String productId;

  static const String name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsProvider _productDetailsProvider =
      ProductDetailsProvider();

  final AddToCartProvider _addToCartProvider = AddToCartProvider();

  String? _selectedColor;
  String? _selectedSize;
  int _quantity = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productDetailsProvider.getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _productDetailsProvider,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product Details'),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),

        body: Consumer<ProductDetailsProvider>(
          builder: (context, _, _) {
            if (_productDetailsProvider.getProductDetailsInProgress) {
              return Center(child: CircularProgressIndicator());
            }
            if (_productDetailsProvider.errorMessage != null) {
              return Center(child: Text(_productDetailsProvider.errorMessage!));
            }

            final productDetailsModel =
                _productDetailsProvider.productDetailsModel!;

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ImageCarosuleSlider(photos: productDetailsModel.photos,),

                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      productDetailsModel.title,

                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontSize: 28,
                                            color: Colors.black54,
                                          ),
                                    ),
                                  ),

                                  SizedBox(
                                    width: 80,
                                    child: IncreDecreButton(
                                      maxCount: productDetailsModel.quantity,
                                      minCount: 1,
                                      initialValue: _quantity,
                                      onChange: (newValue) {},
                                    ),
                                  ),
                                ],
                              ),

                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 4,
                                children: [
                                  Wrap(
                                    spacing: 4,
                                    children: [
                                      Icon(Icons.star, color: Colors.amber),

                                      Text(
                                        '${productDetailsModel.rating}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),

                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        ReviewScreen.name,
                                      );
                                    },
                                    child: Text('Reviews'),
                                  ),

                                  Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: AppColors.themeColor.withAlpha(80),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Icon(
                                      Icons.favorite_outline,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),

                              Visibility(
                                visible: productDetailsModel.colors.isNotEmpty,

                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),

                                    Text(
                                      'Color',
                                      style: Theme.of(context).textTheme.titleMedium
                                          ?.copyWith(
                                            fontSize: 20,
                                            color: Colors.black54,
                                          ),
                                    ),

                                    ColorPicker(
                                      colors: productDetailsModel.colors,
                                      onChanges: (String selectedColor) {
                                        print(selectedColor);

                                        _selectedColor = selectedColor;
                                      },
                                    ),

                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: productDetailsModel.size.isNotEmpty,

                                child: Column(
                                  children: [
                                    Text(
                                      'Size',
                                      style: Theme.of(context).textTheme.titleMedium
                                          ?.copyWith(
                                            fontSize: 20,
                                            color: Colors.black54,
                                          ),
                                    ),

                                    SizePicker(
                                      size: productDetailsModel.size,
                                      onChanges: (String selectedSize) {
                                        print(selectedSize);
                                        _selectedSize = selectedSize;
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),

                              Text(
                                productDetailsModel.description,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      fontSize: 20,
                                      color: Colors.black54,
                                    ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                ChangeNotifierProvider.value(
                    value: _addToCartProvider,
                child: TotalPrizeAddToCartSection(
                  onTapAddToCart: _onTapAddToCart,


                )),

                const SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _onTapAddToCart() async {
    if (await AuthController.isLoggedIn() == false) {
      Navigator.pushNamed(context, SigninScreen.name);
      return;
    }

    AddToCartParams params = AddToCartParams(
      productId: widget.productId,
      color: _selectedColor,
      size: _selectedSize,
      quantity: _quantity,
    );

    final isSuccess = await _addToCartProvider.addToCart(params);
    if (isSuccess) {
      showSnackBarMessage(context, 'Added to cart');
    } else {
      showSnackBarMessage(context, _addToCartProvider.errorMessage!);
    }
  }}
