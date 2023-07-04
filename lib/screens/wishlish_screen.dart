import 'dart:convert';

import 'package:flutter/material.dart';


class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  double Mrptotal = 0;
  double sellingtotal = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getCartItems();
  }

  /* List products = [];
  void getCartItems() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var nencoded = Uri.parse(getCartsAndWishlist +
        preferences.getString("userid").toString() +
        "/wishlist");

    http.get(nencoded).then((resp) {
      if (resp.statusCode == 200) {
        setState(() {
          products = json.decode(resp.body) as List;
        });
        double mrp = 0;
        double s = 0;
        for (int i = 0; i < products.length; i++) {
          mrp = mrp + double.parse(products[i]["mrp"].toString());
          s = s + double.parse(products[i]["sellingPrice"].toString());
        }
        setState(() {
          Mrptotal = mrp;
          sellingtotal = s;
        });
      }
    });
  }

  void getRemoveItem(String _id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var nencoded = Uri.parse(removeFromCart +
        _id +
        "/" +
        preferences.getString("userid").toString());
    print(removeFromCart +
        _id +
        "/" +
        preferences.getString("userid").toString());
    http.get(nencoded).then((resp) {
      print(resp.statusCode);
      if (resp.statusCode == 200) {
        getCartItems();
        showInSnackBar("Item Removed From WishList");
      }
    });
  }

  void moveToCart(String _id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var nencoded = Uri.parse(
        moveToCartU + _id + "/" + preferences.getString("userid").toString());
    print(removeFromCart +
        _id +
        "/" +
        preferences.getString("userid").toString());
    http.get(nencoded).then((resp) {
      print(resp.statusCode);
      if (resp.statusCode == 200) {
        getCartItems();
        showInSnackBar("Item Moved to Cart.");
      }
    });
  }*/

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(value.toString()),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                // double disount = double.parse(
                //         products[index]["mrp"].toString()) -
                //     double.parse(products[index]["sellingPrice"].toString());
                // double discountPercentage = (disount /
                //         double.parse(products[index]["mrp"].toString())) *
                //     100;
                return InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ProductDetailsScreen(
                    //             products[index]["productId"].toString())));
                  },
                  child: SizedBox(
                    height: 200,
                    width: 170,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/shirt.jpg'),
                                // image: NetworkImage(
                                //   clientAppUrl +
                                //       products[index]["productImages"][0]
                                //           ["image"],
                                // ),
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'sellingPrice',
                              // "₹" + products[index]["sellingPrice"].toString(),
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'mrp',
                              // "₹" + products[index]["mrp"].toString(),
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            Text(
                              "discount",
                              // discountPercentage.toStringAsFixed(2) + "% Off",
                              style: const TextStyle(color: Colors.green),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'product',
                                //  products[index]["productName"]
                              ),
                            )),
                            PopupMenuButton(
                                itemBuilder: (context) => [
                                      PopupMenuItem(
                                        child: const Text("Move to cart"),
                                        value: 1,
                                        onTap: () {
                                          // moveToCart(products[index]["cartId"]
                                          //     .toString());
                                        },
                                      ),
                                      PopupMenuItem(
                                        child:
                                            const Text("Remove from WishList"),
                                        value: 2,
                                        onTap: () {
                                          // getRemoveItem(products[index]
                                          //         ["cartId"]
                                          //     .toString());
                                        },
                                      )
                                    ])
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              //childCount: products.length,
              childCount: 4,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              mainAxisExtent: 240,
            ),
          ),
        ],
      ),
    );
  }
}
