//Product 객체를 직렬화하고 역질렬화 하기위해 사용, JSON 형식으로 변환
class Product {
  final String productName;

  Product(this.productName);

  // dart에서 map 은 다른 언어의 객체 Key-value 쌍객체
  // python에서 map(적용시킬 함수, 적용할 값들)
  Product.fromMap(Map<String, dynamic> json)
      : productName = json['productName'];

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
    };
  }
}
