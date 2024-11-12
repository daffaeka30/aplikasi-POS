import 'package:food/db_service.dart';
import 'package:food/module/service/product_service.dart';

class SalesOrderService {
  static List salesOrderList = [];
  static saveToLocalStorage() async {
    await mainStorage.put("sales_order", salesOrderList);
  }

  static loadDataFromDB() async {
    salesOrderList = await mainStorage.get("sales_order") ?? [];
  }

  static checkout({
    required List productList,
  }) async {
    //menyimpan data ke db Purchase
    salesOrderList.add({
      "created_at": DateTime.now().toString(),
      "items": productList,
      "total": ProductService.total,
    });
    saveToLocalStorage();

    //mengupdate stock
    for (var product in productList) {
      ProductService.reduceStock(
        id: product["id"],
        qty: product["qty"],
      );
    }
  }
}
