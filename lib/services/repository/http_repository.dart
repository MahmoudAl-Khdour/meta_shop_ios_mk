import 'package:get/get_connect/connect.dart';
import 'package:meta_shop/model/brand_model.dart';
import 'package:meta_shop/model/categories_model.dart';
import 'package:meta_shop/model/countries_model.dart';
import 'package:meta_shop/model/main_department_model.dart';
import 'package:meta_shop/model/main_department_sections_model.dart';
import 'package:meta_shop/model/msg_model.dart';
import 'package:meta_shop/model/page_slider_model.dart';
import 'package:meta_shop/model/product_details_model.dart';
import 'package:meta_shop/view/components/component/productPage/model/product_detail.dart';
import 'package:meta_shop/view/pages/address/model/address_model.dart';
import 'package:meta_shop/view/pages/cart/current_cart_model.dart';
import 'package:meta_shop/view/pages/cart/model/departmant_model.dart';
import 'package:meta_shop/view/pages/detailedOrders/model/my_default_address.dart';
import 'package:meta_shop/view/pages/login/model/login_model.dart';
import 'package:meta_shop/view/pages/new/model/new_products_model.dart';
import 'package:meta_shop/view/pages/offer/model/offer_model.dart';
import 'package:meta_shop/view/pages/profile/about/model/about_us_model.dart';
import 'package:meta_shop/view/pages/profile/contact/model/contact_information.dart';
import 'package:meta_shop/view/pages/profile/favorite/model/FavoriteModel.dart';
import 'package:meta_shop/view/pages/profile/model/profile_model.dart';
import 'package:meta_shop/view/pages/profile/order/model/view_all_order_model.dart';
import 'package:meta_shop/view/pages/signup/model/registration_model.dart';
import 'package:meta_shop/view/pages/store/model/all_product_model.dart';

abstract class HttpRepository {
  Future<RegistrationModel?> signUp({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? password,
    String? social,
    String? playerId,
  });

  Future<Response?> flagApi();

  Future<LoginModel?> login({
    required String? email,
    required String? password,
    required String? playerId,
    required String? social,
  });

  Future<ProfileModel?> viewProfile({
    String? uId,
  });

  Future<MSGModel?> contactUS({
    String? uId,
    String? name,
    String? email,
    String? phone,
    String? subject,
    String? message,
  });
  Future<OfferModel?> getProductOffer({
    String? uId,
    String? type,
  });

  Future<NewProductsModel?> getNewProduct({
    String? uId,
    String? type,
    String? language,
  });

  Future<CountriesModel?> getCountries();

  Future<MSGModel?> updateCart({
    String? uId,
    String? orderItemId,
    String? quantity,
    String? orderId,
  });

  Future<MSGModel?> subscribeSimplenews({
    required String? email,
  });

  Future<ContactInformationModel?> getContactInformation();

  Future<AboutUsModel?> getAboutUS();

  Future<MSGModel?> updateUserInformation({
    String? uId,
    String? name,
    String? email,
    // File? image,
    String? phone,
    String? password,
    String? currentPassword,
    // String? locality,
    // String? addressLine1,
    // String? givenName,
    // String? familyName,
  });

  Future<MainDepartmentSectionsModel?> getMainDepartmentSections({
    String? language,
    String? uId,
    String? parent,
  });

  Future<CategoriesModel?> getCategories();

  Future<MainDepartmentModel?> getMainDepartment({
    String? language,
  });

  Future<AllProductModel?> getAllProduct({
    String? language,
    required String? uId,
    String? mainId,
    String? key,
    String? category,
    String? from,
    required String? numberItem,
  });

  Future<ProductDetailsModel?> getProduct({
    String? uId,
    String? pId,
  });

  Future<CurrentCartModel?> getCurrentCart({
    String? language,
    String? uId,
  });

  Future<ProductDetailModel?> getProductDetail({
    String? uId,
    String? pId,
  });

  Future<ViewAllOrderModel?> getAllOrder({
    String? uId,
    String? language,
  });

  Future<MSGModel?> addToCart({
    String? uId,
    String? vId,
    String? quantity,
    String? price,
  });

  Future<MSGModel?> removeFromCart({
    String? uId,
    String? orderId,
  });

  Future<MSGModel?> addToFavorite({
    String? uId,
    String? productId,
  });

  Future<FavoriteModel?> getFavoriteProducts({
    String? uId,
    String? language,
  });

  Future<MSGModel?> checkOut({
    String? uId,
    String? orderId,
    required String countryId,
  });

  Future<AddressModel?> getAddress({
    String? uId,
  });

  Future<MSGModel?> addAddress({
    String? uId,
    String? locality,
    String? addressLine1,
    String? givenName,
    String? familyName,
  });

  Future<MSGModel?> deleteAddress({
    String? uId,
    String? profileId,
    String? flag,
  });

  Future<MSGModel?> updateAddress({
    String? uId,
    String? locality,
    String? profileId,
    String? addressLine1,
    String? givenName,
    String? familyName,
  });

  Future<MSGModel?> deleteCart({
    String? uId,
    String? orderId,
    String? orderItemId,
  });

  Future<MSGModel?> addressASDefault({
    String? uId,
    String? flag,
    String? profileId,
  });

  Future<MyDefaultAddressModel?> getMyDefaultAddress({
    String? uId,
  });

  Future<DepartmentModel?> getDepartment();

  Future<PageSliderModel?> getPageSlider();

  Future<BrandModel?> getBrand();

  Future<MSGModel?> addRatingAndComment({
    String? uId,
    String? pId,
    String? name,
    String? comment,
    String? rate,
  });

  Future<MSGModel?> applyCoupon({
    String? uId,
    String? code,
    String? orderId,
  });
  Future<MSGModel?> removeCoupon({
    String? uId,
    String? orderId,
    String? couponId,
  });
}
