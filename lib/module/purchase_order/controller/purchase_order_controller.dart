import 'package:flutter/material.dart';
import 'package:food/core.dart';
import 'package:food/module/service/purchase_order_service.dart';
import 'package:food/shared/widget/show_info_dialog.dart';

class PurchaseOrderController extends State<PurchaseOrderView> {
  static late PurchaseOrderController instance;
  late PurchaseOrderView view;

  @override
  void initState() {
    instance = this;
    ProductService.clearQty();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  doCheckout() async {
    var productList =
        ProductService.productList.where((p) => p["qty"] > 0).toList();
    await PurchaseOrderService.checkout(
      productList: productList,
    );
    Get.back();
    showInfoDialog("Your order is success!");
  }
}
