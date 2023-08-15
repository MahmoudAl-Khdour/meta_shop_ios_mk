import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:meta_shop/model/main_department_model.dart';
import 'package:meta_shop/model/main_department_sections_model.dart';
import 'package:meta_shop/services/helper/cache_utils.dart';
import 'package:meta_shop/services/repository/http_repository.dart';
import 'package:meta_shop/view/pages/cart/model/departmant_model.dart';
import 'package:meta_shop/view/pages/store/model/all_product_model.dart';

class ProductsInsideMainCategoryController extends GetxController {
  final HttpRepository httpRepository;
  final CacheUtils cacheUtils;
  ProductsInsideMainCategoryController(this.httpRepository, this.cacheUtils);

  final mainDepartmentModel = Rx<MainDepartmentModel?>(null);
  final allProductModel = Rx<AllProductModel?>(null);
  final getAllProductUsingCategoryModel = Rx<AllProductModel?>(null);
   Rx<ScrollController> catScrollController = Rx<ScrollController>(ScrollController());
  // final ScrollController _catScrollController = ScrollController();
  // ScrollController get catScrollController =>  _catScrollController;
  // final List<GlobalKey> itemKeys = [];
  final getAllProductUsingBrandModel = Rx<AllProductModel?>(null);

  final departmentModel = Rx<DepartmentModel?>(null);

  final mainDepartmentSections = Rx<MainDepartmentSectionsModel?>(null);

  RxList<DataAllProduct> products = RxList();
  RxList<DataAllProduct> newProducts = RxList();
  final ScrollController scrollController = ScrollController();
  final ScrollController subCatScrollController = ScrollController();

  RxBool loading = RxBool(false);
  RxBool allLoaded = RxBool(false);
  Rx clickedMainDep = RxBool(false);
  Rx haveSub = RxBool(false);
  RxInt index = RxInt(0);
  int counter = 1;

  RxInt selectedIndex = RxInt(-1);
  // int catIndex = -1;
  RxInt selectedSubIndex = RxInt(-1);

  RxString categoryId = RxString('');

  @override
  Future<void> onInit() async {
    categoryId.value = Get.arguments[0];
    selectedIndex.value = Get.arguments[1];

    catScrollController.value = ScrollController(initialScrollOffset: 160*selectedIndex.value.toDouble());
    await getDepartment();
    await mockFilter();
    scrollController.addListener(() async {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          !loading.value) {
        counter += 10;
        await mockFilter();
      }
    });
    haveSubFun(selectedIndex.value);


    // await getAllProductUsingCategory(categoryId.value);
    super.onInit();
    // for (int i = 0; i < departmentModel.value!.data!.department!.length; i++) {
    //   itemKeys.add(GlobalKey());
    // }
  }

  // void animateToSelectedIndex(BuildContext context) {
  //   final RenderObject? renderObject = itemKeys[catIndex].currentContext?.findRenderObject();
  //   if (renderObject != null) {
  //     final RenderAbstractViewport viewport = RenderAbstractViewport.of(renderObject);
  //     if (viewport != null) {
  //       final ScrollableState scrollableState = Scrollable.of(context)!;
  //       final RevealedOffset targetOffset = viewport.getOffsetToReveal(renderObject, 0.0);
  //       scrollableState.position.ensureVisible(
  //         renderObject,
  //         alignment: 0.5,
  //         duration: Duration(milliseconds: 500),
  //         curve: Curves.easeInOut,
  //       );
  //     }
  //   }
  // }
void animateToSelectedIndex(index){
    if(selectedIndex.value <= (departmentModel.value!.data!.department!.length -1)/ 2 )
      {
        catScrollController.value.animateTo(

          catScrollController.value.offset+(160),
          duration:const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }else {
      catScrollController.value.animateTo(

        catScrollController.value.offset-(160),
        duration:const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }


}

  void animateToSelectedSubIndex(index){

      subCatScrollController.animateTo(

        catScrollController.value.offset+(160),
        duration:const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );




  }



  mockFilter() async {
    loading.value = true;
    await getAllProduct(counter);
    if (newProducts.isNotEmpty) {
      products.addAll(newProducts);
      products.refresh();
    }
    loading.value = false;
    allLoaded.value = newProducts.isEmpty;
  }

  getAllProduct(int from) async {
    try {
      var response = await httpRepository.getAllProduct(
        language: 'en',
        uId: cacheUtils.getUID(),
        from: from.toString(),
        numberItem: '10',
      );
      allProductModel.value = response;
      products.addAll(response!.data!);
      products.refresh();
    } catch (e) {
      Get.snackbar('Get all products', allProductModel.value!.msg!.message!);
      e.printError();
    }
  }

  getAllProductUsingCategory(String category) async {
    try {
      var response = await httpRepository.getAllProduct(
        language: 'en',
        uId: cacheUtils.getUID(),
        from: '1',
        numberItem: '1000000000',
        category: category,
      );
      getAllProductUsingCategoryModel.value = response;
      getAllProductUsingCategoryModel.refresh();
    } catch (e) {
      Get.snackbar('Get all products', allProductModel.value!.msg!.message!);
      e.printError();
    }
  }

  getAllProductUsingBrand(String brand) async {
    try {
      var response = await httpRepository.getAllProduct(
        language: 'en',
        uId: cacheUtils.getUID(),
        from: '1',
        numberItem: '1000000000',
        category: brand,
      );
      getAllProductUsingBrandModel.value = response;
      getAllProductUsingBrandModel.refresh();
    } catch (e) {
      Get.snackbar('Get all products',
          getAllProductUsingBrandModel.value!.msg!.message!);
      e.printError();
    }
  }

  getDepartment() async {
    try {
      var response = await httpRepository.getDepartment();
      departmentModel.value = response;
    } catch (e) {
      Get.snackbar('Get department', 'error');
      e.printError();
    }
  }

  haveSubFun(int index) async {
    if (departmentModel
        .value!.data!.department![index].subDepartment!.isNotEmpty) {
      haveSub.value = true;
      this.index.value = index;
      clickedMainDep.value = true;
      await getAllProductUsingCategory(
          departmentModel.value!.data!.department![index].id!);
    } else {
      haveSub.value = false;
      clickedMainDep.value = true;

      await getAllProductUsingCategory(
          departmentModel.value!.data!.department![index].id!);
    }
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}
