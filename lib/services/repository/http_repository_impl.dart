import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_shop/model/brand_model.dart';
import 'package:meta_shop/model/categories_model.dart';
import 'package:meta_shop/model/countries_model.dart';
import 'package:meta_shop/model/main_department_model.dart';
import 'package:meta_shop/model/main_department_sections_model.dart';
import 'package:meta_shop/model/msg_model.dart';
import 'package:meta_shop/model/page_slider_model.dart';
import 'package:meta_shop/model/product_details_model.dart';
import 'package:meta_shop/services/urls/api_url.dart';
import 'package:meta_shop/view/components/component/productPage/model/product_detail.dart';
import 'package:meta_shop/view/components/constants/style/colors/color.dart';
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

import 'http_repository.dart';

class HttpRepositoryImpl extends GetConnect implements HttpRepository {
  @override
  void onInit() {
    // httpClient.defaultDecoder = (data) => MSGModel.fromJson(data);
    httpClient.timeout = const Duration(minutes: 1);
    super.onInit();
  }

  @override
  Future<MSGModel?> addAddress({
    String? uId,
    String? locality,
    String? addressLine1,
    String? givenName,
    String? familyName,
  }) async {
    final formData = FormData({
      "uid": uId,
      "locality": locality,
      "address_line1": addressLine1,
      "given_name": givenName,
      "family_name": familyName,
    });
    var response = await post(UrlAPI.addAddress, formData);
    if (response.hasError) {
      throw Exception(response.statusText);
    }

    return MSGModel.fromJson(response.body);
  }

  @override
  Future<MSGModel?> addToCart({
    String? uId,
    String? vId,
    String? quantity,
    String? price,
  }) async {
    final formData = FormData({
      "uid": uId,
      "vid": vId,
      "quantity": quantity,
      "price": price,
    });
    var response = await post(UrlAPI.addToCart, formData);
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return MSGModel.fromJson(response.body);
  }

  @override
  Future<MSGModel?> addToFavorite({
    String? uId,
    String? productId,
  }) async {
    final formData = FormData({
      "uid": uId,
      "product_id": productId,
    });
    var response = await post(UrlAPI.addToFavorite, formData);
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return MSGModel.fromJson(response.body);
  }

  @override
  Future<MSGModel?> checkOut({
    String? uId,
    String? orderId,
    required String countryId,
  }) async {
    final formData = FormData({
      "uid": uId,
      "order_id": orderId,
      "country": countryId,
    });
    var response = await post(UrlAPI.checkout, formData);
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return MSGModel.fromJson(response.body);
  }

  @override
  Future<MSGModel?> contactUS({
    String? uId,
    String? name,
    String? email,
    String? phone,
    String? subject,
    String? message,
  }) async {
    final formData = FormData({
      "uid": uId,
      "name": name,
      "email": email,
      "phone": phone,
      "subject": subject,
      "message": message,
    });
    var response = await post(UrlAPI.contactUS, formData);
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return MSGModel.fromJson(response.body);
  }

  @override
  Future<MSGModel?> deleteAddress({
    String? uId,
    String? profileId,
    String? flag,
  }) async {
    final formData = FormData({
      "uid": uId,
      "profile_id": profileId,
      "flag": flag,
    });
    var response = await post(UrlAPI.deleteAddress, formData);
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return MSGModel.fromJson(response.body);
  }

  @override
  Future<AboutUsModel?> getAboutUS() async {
    var response = await get(
      UrlAPI.aboutUS,
      decoder: (data) => AboutUsModel.fromJson(data),
    );
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return response.body;
  }

  @override
  Future<AddressModel?> getAddress({
    String? uId,
  }) async {
    final formData = FormData({
      "uid": uId,
    });
    var response = await post(UrlAPI.getAddress, formData,
        decoder: (data) => AddressModel.fromJson(data));
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return response.body;
  }

  @override
  Future<ViewAllOrderModel?> getAllOrder({
    String? uId,
    String? language,
  }) async {
    final formData = FormData({
      "uid": uId,
      "lang": language,
    });
    var response = await post(UrlAPI.getAllOrder, formData,
        decoder: (data) => ViewAllOrderModel.fromJson(data));
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return response.body;
  }

  @override
  Future<MainDepartmentSectionsModel?> getMainDepartmentSections({
    String? language,
    String? uId,
    String? parent,
  }) async {
    final formData = FormData({
      "uid": uId,
      "lang": language,
      "parent": parent,
    });
    var response = await post(UrlAPI.getMainDepartmentSections, formData,
        decoder: (data) => MainDepartmentSectionsModel.fromJson(data));
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return response.body;
  }

  @override
  Future<ContactInformationModel?> getContactInformation() async {
    var response = await get(
      UrlAPI.contactInfo,
      decoder: (data) => ContactInformationModel.fromJson(data),
    );
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return response.body;
  }

  @override
  Future<FavoriteModel?> getFavoriteProducts({
    String? uId,
    String? language,
  }) async {
    final formData = FormData({
      "uid": uId,
      "lang": language,
    });
    var response = await post(UrlAPI.getFavoriteProducts, formData,
        decoder: (data) => FavoriteModel.fromJson(data));
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return response.body;
  }

  @override
  Future<ProductDetailsModel?> getProduct({
    String? uId,
    String? pId,
  }) async {
    final formData = FormData({
      "pid": pId,
      "uid": uId,
    });
    var response = await post(UrlAPI.getProduct, formData,
        decoder: (data) => ProductDetailsModel.fromJson(data));
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return response.body;
  }

  @override
  Future<LoginModel?> login({
    required String? email,
    required String? password,
    required String? playerId,
    required String? social,
  }) async {
    final formData = FormData({
      "user": email,
      "password": password,
      "player_id": playerId,
      "social": social
    });
    var response = await post(UrlAPI.loginUrl, formData);

    if (response.body['msg']['status'] == 0) {
      Get.snackbar(
        'login'.tr,
        response.body['msg']['message'],
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColor.globalDefaultColor.withOpacity(0.9),
        borderRadius: 15,
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        dismissDirection: DismissDirection.vertical,
        forwardAnimationCurve: Curves.easeOutBack,
      );
      return null;
    } else if (response.body['msg']['status'] == 1) {
      return LoginModel.fromJson(response.body);
    } else if (response.body['msg']['status'] == 2) {
      Get.snackbar(
        'login'.tr,
        response.body['msg']['message'],
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColor.globalDefaultColor.withOpacity(0.9),
        borderRadius: 15,
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        dismissDirection: DismissDirection.vertical,
        forwardAnimationCurve: Curves.easeOutBack,
      );
      return null;
    }
    return null;
  }

  @override
  Future<MSGModel?> removeFromCart({
    String? uId,
    String? orderId,
  }) async {
    final formData = FormData({
      "uid": uId,
      "order_id": orderId,
    });
    var response = await post(UrlAPI.removeFromCart, formData);
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return MSGModel.fromJson(response.body);
  }

  @override
  Future<RegistrationModel?> signUp({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? password,
    String? social,
    String? playerId,
  }) async {
    final formData = FormData({
      "name": fullName,
      "mail": email,
      "pass": password,
      "phone": phoneNumber,
      "social": social,
      "player_id": playerId,
    });
    var response = await post(UrlAPI.signUpUrl, formData,
        decoder: (data) => RegistrationModel.fromJson(data));
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return response.body;
  }

  @override
  Future<MSGModel?> updateAddress({
    String? uId,
    String? locality,
    String? profileId,
    String? addressLine1,
    String? givenName,
    String? familyName,
  }) async {
    final formData = FormData({
      "uid": uId,
      "locality": locality,
      "address_line1": addressLine1,
      "given_name": givenName,
      "family_name": familyName,
      "profile_id": profileId,
    });
    var response = await post(UrlAPI.updateAddress, formData);
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return MSGModel.fromJson(response.body);
  }

  @override
  Future<ProfileModel?> viewProfile({String? uId}) async {
    final formData = FormData({
      "uid": uId,
    });
    var response = await post(UrlAPI.viewProfile, formData,
        decoder: (data) => ProfileModel.fromJson(data));
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return response.body;
  }

  @override
  Future<MSGModel?> updateUserInformation({
    String? uId,
    String? name,
    String? email,
    // File? image,
    String? phone,
    String? password,
    String? currentPassword,
  }) async {
    // final multiPartFile = MultipartFile(await image!.readAsBytes(),
    //     filename: image.path.split('/').last);
    final formData = FormData({
      "uid": uId,
      "name": name,
      "mail": email,
      // "image": multiPartFile,
      "phone": phone,
      "pass": password,
      "current_pass": currentPassword,
      // "locality": locality,
      // "given_name": givenName,
      // "family_name": familyName,
    });
    var response = await post(UrlAPI.updateUserInfo, formData);
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return MSGModel.fromJson(response.body);
  }

  @override
  Future<CategoriesModel?> getCategories() async {
    var response = await get(
      UrlAPI.getCatagory,
      decoder: (data) => CategoriesModel.fromJson(data),
    );
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return response.body;
  }

  @override
  Future<MSGModel?> updateCart({
    String? uId,
    String? orderItemId,
    String? quantity,
    String? orderId,
  }) async {
    final formData = FormData({
      "uid": uId,
      "order_item_id": orderItemId,
      "quantity": quantity,
      "order_id": orderId,
    });
    var response = await post(UrlAPI.updateCart, formData);
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return MSGModel.fromJson(response.body);
  }

  @override
  Future<MSGModel?> deleteCart({
    String? uId,
    String? orderId,
    String? orderItemId,
  }) async {
    final formData = FormData({
      "uid": uId,
      "order_id": orderId,
      "order_item_id": orderItemId,
    });
    var response = await post(UrlAPI.deleteCart, formData);
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return MSGModel.fromJson(response.body);
  }

  @override
  Future<CurrentCartModel?> getCurrentCart({
    String? language,
    String? uId,
  }) async {
    final formData = FormData({
      "uid": uId,
      "lang": language,
    });
    var response = await post(UrlAPI.getCurrentCart, formData,
        decoder: (data) => CurrentCartModel.fromJson(data));
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return response.body!;
  }

  @override
  Future<OfferModel?> getProductOffer({
    String? uId,
    String? type,
  }) async {
    final formData = FormData({
      "uid": uId,
      "type": type,
    });
    var response = await post(UrlAPI.getOfferProduct, formData,
        decoder: (data) => OfferModel.fromJson(data));
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return response.body!;
  }

  @override
  Future<MainDepartmentModel?> getMainDepartment({
    String? language,
  }) async {
    final formData = FormData({
      "lang": language,
    });
    var response = await post(UrlAPI.getMainDepartment, formData,
        decoder: (data) => MainDepartmentModel.fromJson(data));
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return response.body!;
  }

  @override
  Future<NewProductsModel?> getNewProduct({
    String? uId,
    String? type,
    String? language,
  }) async {
    final formData = FormData({
      "type": type,
      "uid": uId,
      // "lang": language,
    });
    var response = await post(
      UrlAPI.getOfferProduct,
      formData,
      decoder: (data) => NewProductsModel.fromJson(data),
    );
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return response.body!;
  }

  @override
  Future<AllProductModel?> getAllProduct({
    String? language,
    required String? uId,
    String? mainId,
    String? key,
    String? category,
    String? from,
    required String? numberItem,
  }) async {
    final formData = FormData({
      "uid": uId,
      "lang": language,
      "from": from,
      "to": numberItem,
      "main_id": mainId,
      "key": key,
      "catagory": category,
    });
    var response = await post(UrlAPI.getAllProduct, formData,
        decoder: (data) => AllProductModel.fromJson(data));
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return response.body!;
  }

  @override
  Future<ProductDetailModel?> getProductDetail({
    String? uId,
    String? pId,
  }) async {
    final formData = FormData({
      "uid": uId,
      "pid": pId,
    });
    var response = await post(UrlAPI.getProduct, formData,
        decoder: (data) => ProductDetailModel.fromJson(data));
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return response.body!;
  }

  @override
  Future<MSGModel?> addressASDefault({
    String? uId,
    String? flag,
    String? profileId,
  }) async {
    final formData = FormData({
      "uid": uId,
      "flag": flag,
      "profile_id": profileId,
    });
    var response = await post(UrlAPI.addressASDefault, formData);
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return MSGModel.fromJson(response.body);
  }

  @override
  Future<MyDefaultAddressModel?> getMyDefaultAddress({String? uId}) async {
    final formData = FormData({
      "uid": uId,
    });
    var response = await post(UrlAPI.getMyDefaultAddress, formData,
        decoder: (data) => MyDefaultAddressModel.fromJson(data));
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return response.body;
  }

  @override
  Future<DepartmentModel?> getDepartment() async {
    var response = await get(
      UrlAPI.getDepartment,
      decoder: (data) => DepartmentModel.fromJson(data),
    );
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return response.body;
  }

  @override
  Future<PageSliderModel?> getPageSlider() async {
    var response = await get(
      UrlAPI.getHomePageSlider,
      decoder: (data) => PageSliderModel.fromJson(data),
    );
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return response.body;
  }

  @override
  Future<BrandModel?> getBrand() async {
    var response = await get(
      UrlAPI.getBrands,
      decoder: (data) => BrandModel.fromJson(data),
    );
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return response.body;
  }

  @override
  Future<MSGModel?> addRatingAndComment({
    String? uId,
    String? pId,
    String? name,
    String? comment,
    String? rate,
  }) async {
    final formData = FormData({
      "uid": uId,
      "pid": pId,
      "name": name,
      "comment": comment,
      "rate": rate,
    });
    var response = await post(UrlAPI.addRating, formData);
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return MSGModel.fromJson(response.body);
  }

  @override
  Future<MSGModel?> applyCoupon({
    String? uId,
    String? code,
    String? orderId,
  }) async {
    final formData = FormData({
      "uid": uId,
      "order_id": orderId,
      "code": code,
    });
    var response = await post(UrlAPI.applyCoupon, formData);
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return MSGModel.fromJson(response.body);
  }

  @override
  Future<MSGModel?> removeCoupon({
    String? uId,
    String? orderId,
    String? couponId,
  }) async {
    final formData = FormData({
      "uid": uId,
      "order_id": orderId,
      "coupon_id": couponId,
    });
    var response = await post(UrlAPI.removeCoupon, formData);
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return MSGModel.fromJson(response.body);
  }

  @override
  Future<MSGModel?> subscribeSimplenews({required String? email}) async {
    final formData = FormData({
      "email": email,
      "subscribe": "1",
    });
    var response = await post(UrlAPI.subscribeSimplenews, formData);
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return MSGModel.fromJson(response.body);
  }

  @override
  Future<CountriesModel?> getCountries() async {
    var response = await get(
      UrlAPI.getCountriesUrl,
      decoder: (data) => CountriesModel.fromJson(data),
    );
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return response.body;
  }

  @override
  Future<Response?> flagApi() async {
    var response = await get(UrlAPI.flagApi);
    if (response.isOk) {
      return response;
    }
    if (response.hasError) {
      throw Exception(response.statusText);
    }
    return null;
  }
}
