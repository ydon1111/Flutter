import 'package:flutter/material.dart';
import 'package:poem_generator/controller/poem_controller.dart';
import 'package:poem_generator/controller/product_controller.dart';
import 'package:poem_generator/widgets/shimmer_loading_anim.dart';

import 'domain/models/product.dart';

class PoemPage extends StatefulWidget {
  const PoemPage({super.key, required this.title});

  final String title;

  @override
  State<PoemPage> createState() => PoemPageState();
}

class PoemPageState extends State<PoemPage> {
  List<Product> listProduct = [];
  final ProductController productController = ProductController();
  final PoemController poemController = PoemController();

  String poemText = '';
  String productName = '플루터 공부';

  String subTitle = '시 주제를 선택하세요';

  Future getProductData() async {
    var productData = await productController.getProducts();
    setState(() {
      listProduct = productData;
    });
  }

  Future getPoemTextData(String productName) async {
    var poemData = await poemController.getPoem(productName);
    setState(() {
      poemText = poemData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                buildTopView(),
                const SizedBox(
                  height: 10.0,
                ),
                buildBottomView()
              ],
            )),
      ),
    );
  }

  Column buildTopView() {
    return Column(
      children: <Widget>[
        Text(
          subTitle,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: 150.0,
          child: DropdownButton<Product>(
            items: listProduct.map((Product value) {
              return DropdownMenuItem<Product>(
                value: value,
                child: Text(value.productName),
              );
            }).toList(),
            hint: Text(productName.toString(),
                style: const TextStyle(color: Colors.deepPurpleAccent)),
            underline: Container(
              height: 1,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (value) {
              setState(() {
                productName = value!.productName;
                poemText = '';
              });
            },
            isExpanded: true,
          ),
        ),
        GestureDetector(
          onTap: () => getPoemTextData(productName.toString()),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.blue,
            ),
            child: const Text(
              "시 생성",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
      ],
    );
  }

  Expanded buildBottomView() {
    return Expanded(
        child: poemText.isNotEmpty
            ? Container(
                decoration: BoxDecoration(
                  color: Colors.amberAccent.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      poemText,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              )
            : ShimmerLoadingAnim(
                isLoading: true,
                child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: const Color(0xFFE5E5E5),
                      borderRadius: BorderRadius.circular(8)),
                ),
              ));
  }
}
