import 'package:poem_generator/domain/repositories/abstract/poem_repository.dart';

class PoemRepositoryImpl implements PoemRepository{
  PoemRepositoryImpl();


  @override
  Future<String> getPoems(String productName) async{
    return "";
  }

}