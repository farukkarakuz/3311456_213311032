import 'package:flutter/material.dart';

import 'package:fruk/services/product.dart';
import 'package:fruk/widgets/custom_textform.dart';

class productscreen extends StatefulWidget {
  const productscreen({super.key});

  @override
  State<productscreen> createState() => _productscreenState();
}

ProductService _productService = ProductService();

class _productscreenState extends State<productscreen> {
  var productname = TextEditingController();
  var productimg = TextEditingController();
  var productfiyat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Ürün Ekle'),
          backgroundColor: Color.fromARGB(255, 0, 230, 118),
        ),
        body: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
                    child: CustomTextField(
                        labelt: Text('Ürün Adını Yazınız'),
                        hintt: '',
                        icons: Icon(Icons.add),
                        controllers: productname,
                        keyboardtypes: TextInputType.name),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: CustomTextField(
                        labelt: Text('Ürün İMG URLsini Yazınız'),
                        hintt: '',
                        icons: Icon(Icons.add),
                        controllers: productimg,
                        keyboardtypes: TextInputType.name),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: CustomTextField(
                        labelt: Text('Ürünün Kilo Fiyatını Yazınız'),
                        hintt: '',
                        icons: Icon(Icons.add),
                        controllers: productfiyat,
                        keyboardtypes: TextInputType.number),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                    child: InkWell(
                      onTap: () async {
                        if (productimg.text == '') {
                          productimg.text =
                              'https://radyanci.com/urunler/yok.png';
                        }
                        await _productService
                            .addProduct(productname.text, productimg.text,
                                productfiyat.text)
                            .then((value) {
                          return Navigator.pop(context);
                        });
                      },
                      child: Container(
                        width: 200,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            
                            border:
                                Border.all(color: Color.fromARGB(255, 0, 230, 118), width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                              child: Text(
                            "Ürün Ekle",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  resetle() {
    productname.text = '';
    productimg.text = '';
    productfiyat.text = '';
  }
}
