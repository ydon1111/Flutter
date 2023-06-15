//Future 비동기 작업의 결과를 나타냄, 미완료 또는 완료의 두 가지 상태를 가짐 1

abstract class PoemRepository{
  Future<String> getPoems(String productName);
}