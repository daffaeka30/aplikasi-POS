import 'package:food/core.dart';

class PurchaseOrderService {
  static List purchaseOrderList = [];
  static saveToLocalStorage() async {
    await mainStorage.put("purchase_order", purchaseOrderList);
  }

  static loadDataFromDB() async {
    purchaseOrderList = await mainStorage.get("purchase_order") ?? [];
  }

  static checkout({
    required List productList,
  }) async {
    //menyimpan data ke db Purchase
    purchaseOrderList.add({
      "created_at": DateTime.now().toString(),
      "items": productList,
      "total": ProductService.total,
    });
    saveToLocalStorage();

    //mengupdate stock
    for (var product in productList) {
      ProductService.addStock(
        id: product["id"],
        qty: product["qty"],
      );
    }
  }
}
