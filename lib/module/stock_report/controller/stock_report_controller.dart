import 'package:flutter/material.dart';
import 'package:food/core.dart';
import '../view/stock_report_view.dart';

class StockReportController extends State<StockReportView> {
  static late StockReportController instance;
  late StockReportView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
