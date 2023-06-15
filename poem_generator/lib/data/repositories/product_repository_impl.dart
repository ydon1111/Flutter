import 'package:poem_generator/domain/models/product.dart';
import 'package:poem_generator/domain/repositories/abstract/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl();

  @override
  Future<List<Product>> getAllProducts() async {
    var dummyData = [
      {'생성키워드': '플루터 개발'},
    ];
    return dummyData.map((item) => Product.fromMap(item)).toList();
  }
}
