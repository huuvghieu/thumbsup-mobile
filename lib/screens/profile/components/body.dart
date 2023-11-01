import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/model/customer.dart';
import 'package:my_app/model/jwt.dart';
import 'package:my_app/model/store.dart';
import 'package:my_app/model/store_extra.dart';
import 'package:my_app/screens/profile/components/button_history_transaction.dart';
import 'package:my_app/screens/profile/components/button_logout.dart';
import 'package:my_app/screens/profile/components/button_order.dart';
import 'package:my_app/screens/profile/components/button_wallet.dart';
import 'package:my_app/services/customer_service.dart';
import 'package:my_app/services/shared_pref%20_service.dart';
import 'package:my_app/services/store_service.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Jwt jwt = Jwt();
  bool isStore = true;
  bool isLoading = true;
  SharedPref sharedPref = SharedPref();

  @override
  void initState() {
    super.initState();
    loadUserInfo();
  }

  Future refresh() async {
    loadUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(color: AppColor.primaryDark))
        : RefreshIndicator(
            onRefresh: refresh,
            color: AppColor.primaryDark,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50 * fem,
                ),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(35 * fem, 0 * fem, 0 * fem, 30 * fem),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        child: SizedBox(
                          width: 54 * fem,
                          height: 55 * fem,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100 * fem),
                            child: Image.network(
                                isStore
                                    ? (jwt.user as StoreExtra).logo.toString()
                                    : (jwt.user as Customer).avatar.toString(),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),

                      //
                      SizedBox(
                        width: 20 * fem,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                isStore
                                    ? (jwt.user as StoreExtra)
                                        .storeName
                                        .toString()
                                    : (jwt.user as Customer)
                                        .fullName
                                        .toString(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: 'Solway',
                                    fontSize: 18 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2 * ffem / fem,
                                    color: Colors.black),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: EdgeInsets.only(right: 30 * fem),
                                  child: SvgPicture.asset(
                                    'assets/icons/pencil-icon.svg',
                                    width: 18 * fem,
                                    height: 18 * fem,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 20 * fem, 0 * fem),
                            child: Text(
                              isStore
                                  ? (jwt.user as StoreExtra).email.toString()
                                  : (jwt.user as Customer).email.toString(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'Solway',
                                fontSize: 14 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2 * ffem / fem,
                                color: AppColor.kTextColor,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(40 * fem, 0 * fem, 30 * fem, 0 * fem),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/number-of-following-icon.svg',
                            width: 30 * fem,
                            height: 30 * fem,
                          ),
                          SizedBox(
                            width: 15 * fem,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5 * fem),
                            child: Text(
                              '15',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Solway',
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2 * ffem / fem,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 100 * fem,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/number-of-rating-icon.svg',
                            width: 30 * fem,
                            height: 30 * fem,
                          ),
                          SizedBox(
                            width: 15 * fem,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5 * fem),
                            child: Text(
                              '15',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Solway',
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2 * ffem / fem,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20 * fem,
                ),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(40 * fem, 0 * fem, 30 * fem, 40 * fem),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 30 * fem,
                          ),
                          SizedBox(
                            width: 15 * fem,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5 * fem),
                            child: Text(
                              '15',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Solway',
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2 * ffem / fem,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/cash-coins-icon.svg',
                            width: 30 * fem,
                            height: 30 * fem,
                          ),
                          SizedBox(
                            width: 15 * fem,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5 * fem),
                            child: Text(
                              '100.000 VND',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Solway',
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2 * ffem / fem,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(20 * fem, 0 * fem, 20 * fem, 0 * fem),
                  child: Column(
                    children: [
                      ButtonWallet(fem: fem, ffem: ffem),
                      ButtonOrder(fem: fem, ffem: ffem, customerId: (jwt.user as Customer).id),
                      ButtonHistoryTransaction(fem: fem, ffem: ffem),
                      SizedBox(
                        height: 50 * fem,
                      ),
                      const ButtonLogout(),
                    ],
                  ),
                )
              ],
            ));
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
                      })
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
