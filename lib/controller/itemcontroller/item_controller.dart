import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:task/model/datamodel.dart';
import 'package:task/service/data_service/data_service.dart';

class ItemController extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  ItemService productservice = ItemService();
  bool isLoading = false;
  List<DataModel> allproducts = [];
  List<DataModel> searchlist = [];
  Reference? reference;

  String? selectedCategory;
  List<File> productImages = [];

  changecatogery(value) {
    selectedCategory = value;
    notifyListeners();
  }

  addProduct(DataModel data) async {
    await productservice.addItem(data);
    clearControllers();
    getItem();
  }

  getItem() async {
    allproducts = await productservice.getAllItems();
    notifyListeners();
  }

  clearControllers() {
    nameController.clear();
    descriptionController.clear();
    notifyListeners();
  }

  startLoading(value) {
    isLoading = value;
    notifyListeners();
  }

  deleteProduct(productid) async {
    await productservice.deleteProduct(productid);
    notifyListeners();
    getItem();
  }

  updateProduct(productid, DataModel data) async {
    await productservice.updateproduct(productid, data);
    clearControllers();
    notifyListeners();
  }

  loadDataForUpdate(DataModel product) {
    nameController = TextEditingController(text: product.dataname);
    descriptionController = TextEditingController(text: product.description);
  }

  setDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  setTime(TimeOfDay time) {
    selectedTime = time;
    notifyListeners();
  }
}
