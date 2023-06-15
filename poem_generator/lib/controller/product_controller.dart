import 'package:poem_generator/data/repositories/product_repository_impl.dart';
import 'package:poem_generator/domain/models/product.dart';
import 'package:poem_generator/domain/repositories/abstract/product_repository.dart';

class ProductController {
  final ProductRepository productRepository = ProductRepositoryImpl();

  Future<List<Product>> getProducts() {
    return productRepository.getAllProducts();
  }
}
