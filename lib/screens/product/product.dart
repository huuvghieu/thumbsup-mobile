import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/common/string.dart';
import 'package:my_app/data/models/ads_store_model.dart';
import 'package:my_app/model/customer.dart';
import 'package:my_app/model/jwt.dart';
import 'package:my_app/model/store.dart';
import 'package:my_app/model/store_extra.dart';
import 'package:my_app/screens/product/menu.dart';
import 'package:my_app/screens/product/product_screen.dart';
import 'package:my_app/screens/product/search/search.dart';
import 'package:my_app/screens/product/store/store_carousel.dart';
import 'package:my_app/services/customer_service.dart';
import 'package:my_app/services/shared_pref%20_service.dart';
import 'package:my_app/services/store_service.dart';

class Product extends StatefulWidget {
  const Product({Key? key, required this.onItemTapped}) : super(key: key);

  final ValueChanged<int> onItemTapped;

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  late List<AdsStoreModel> ads = [];
  Jwt jwt = Jwt();
  bool isStore = true;
  bool isLoading = true;
  SharedPref sharedPref = SharedPref();
  String? fullName = '';
  String? avatar = '';

  @override
  void initState() {
    super.initState();
    loadUserInfo();
  }

  Future refresh() async {
    setState(() {});
    loadUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        drawer: Menu(onItemTapped: widget.onItemTapped),
        appBar: AppBar(
          toolbarHeight: 90.0,
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          leadingWidth: 70.0,
          leading: Builder(builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 5.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5, color: Colors.black12, spreadRadius: 1)
                ],
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  color: Colors.greenAccent,
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),
            );
          }),
          title: Center(
              child: RichText(
                  text: TextSpan(children: <TextSpan>[
            const TextSpan(
                text: "Chào mừng, ",
                style: TextStyle(
                    color: AppColor.lowText,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600)),
            TextSpan(
              text: '$fullName',
              style: const TextStyle(
                  color: AppColor.primaryDark,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w800),
            )
          ]))),
          actions: [
            Container(
              color: Colors.white,
              margin: const EdgeInsets.fromLTRB(5.0, 25.0, 10.0, 25.0),
              child: CircleAvatar(
                backgroundColor: AppColor.primary,
                radius: 25.0,
                child: AppString.isAvatar 
                ? Align(
                        child: SizedBox(
                          // width: 54,
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Image.network(
                                // isStore
                                //     ? (jwt.user as StoreExtra).logo.toString()
                                //     : avatar.toString(),
                                '$avatar',
                                fit: BoxFit.cover),
                          ),
                        ),
                      )
                :  CircleAvatar(
                backgroundColor: AppColor.primary,
                radius: 25.0,
                child: Image.network('${AppString.avatar}',width: 30),
              ),     
              ),
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: refresh,
          color: AppColor.primaryDark,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10.0),
            child: const CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Bạn tìm gì nè?",
                          style: TextStyle(
                            color: AppColor.lowText,
                            fontSize: 35.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      SearchBarCustom(),
                      SizedBox(height: 20.0),
                      // Categories(),
                      CarouselStore(),
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          "Sản phẩm nổi bật",
                          style: TextStyle(
                            color: AppColor.lowText,
                            fontSize: 22.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),
                ProductScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loadUserInfo() {
    sharedPref.read("jwt").then((value) => {
          jwt = Jwt.fromJsonString(value),
          if (jwt.role == "Customer")
            {
              isStore = false,
              CustomerService.getCustomerById(
                      jwt.token.toString(), (jwt.user as Customer).id!)
                  .then((value) => {
                        setState(() {
                          isLoading = false;
                          jwt.user = value as Customer;
                        })
                      }),
              fullName = (jwt.user as Customer).fullName,
              if ((jwt.user as Customer).avatar != '')
                {avatar = (jwt.user as Customer).avatar!,
                AppString.ava = avatar,
                AppString.isAvatar = true}
              else
                {avatar = AppString.avatar,
                AppString.ava = AppString.ava
                },
              AppString.customerId = (jwt.user as Customer).id,
            }
          else if (jwt.role == "Store")
            {
              isStore = true,
              StoreService.getStoreById(
                      jwt.token.toString(), (jwt.user as Store).id!)
                  .then((value) => {
                        setState(() {
                          isLoading = false;
                          jwt.user = value as StoreExtra;
                        })
                      })
            }
        });
  }
}
