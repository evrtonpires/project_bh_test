import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_bh_test/app/modules/shared/models/product_model.dart';
import 'package:sembast/sembast.dart';

import '../sambest.dart';

class ProductSembast {
  static const String folderNameLogin = "Product";
  final _nameFolder = stringMapStoreFactory.store(folderNameLogin);

  AppDatabase _appDatabase = Modular.get();

  Future<Database> get _db async => await _appDatabase.database;

  Future insert(ProductModel product) async {
    Database db = await _db;
    db.transaction((transaction) async {
      await _nameFolder
          .record(product.id.toString())
          .put(transaction, json.decode(jsonEncode(product)));
    });
  }

  Future delete(ProductModel product) async {
    Database db = await _db;
    db.transaction((transaction) async {
      await _nameFolder.record(product.id.toString()).delete(transaction);
    });
  }

  Future<ProductModel?> get(ProductModel product) async {
    final recordSnapshot =
        await _nameFolder.record(product.id.toString()).get(await _db);
    if (recordSnapshot != null) {
      final faz = ProductModel.fromJson(recordSnapshot);

      return faz;
    } else {
      return null;
    }
  }

  Future<ProductModel?> getFilter({filter, dataSearch}) async {
    var finder =
        Finder(filter: Filter.equals(filter, dataSearch, anyInList: false));
    final recordSnapshot =
        await _nameFolder.findFirst(await _db, finder: finder);
    if (recordSnapshot != null) {
      return ProductModel.fromJson(
          json.decode(json.encode(recordSnapshot.value)));
    } else {
      return null;
    }
  }

  Future<List<ProductModel>> getAll() async {
    final recordSnapshot = await _nameFolder.find(await _db);
    return recordSnapshot.map((snapshot) {
      final product = ProductModel.fromJson(snapshot.value);
      return product;
    }).toList();
  }
}
