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
            child: SingleChildScrollView(
              child: Container(
                padding:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 1 * fem),
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          11 * fem, 40 * fem, 17 * fem, 137 * fem),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 6 * fem, 2 * fem),
                            width: 341 * fem,
                            height: 157 * fem,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 64 * fem,
                                  top: 15 * fem,
                                  child: SizedBox(
                                    width: 277 * fem,
                                    height: 139 * fem,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.fromLTRB(40 * fem,
                                              0 * fem, 0 * fem, 25 * fem),
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0 * fem,
                                                    0 * fem,
                                                    5 * fem,
                                                    4 * fem),
                                                width: double.infinity,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                0 * fem,
                                                                0 * fem,
                                                                5 * fem,
                                                                0 * fem),
                                                        child: Text(
                                                          isStore
                                                              ? (jwt.user
                                                                      as StoreExtra)
                                                                  .storeName
                                                                  .toString()
                                                              : (jwt.user
                                                                      as Customer)
                                                                  .fullName
                                                                  .toString(),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Solway',
                                                              fontSize:
                                                                  18 * ffem,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              height: 1.2 *
                                                                  ffem /
                                                                  fem,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 18 * fem,
                                                      height: 19 * fem,
                                                      child: SvgPicture.asset(
                                                          'assets/icons/pencil-icon.svg'),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      5 * fem,
                                                      0 * fem),
                                                  width: double.infinity,
                                                  child: Text(
                                                    isStore
                                                        ? (jwt.user
                                                                as StoreExtra)
                                                            .email
                                                            .toString()
                                                        : (jwt.user as Customer)
                                                            .email
                                                            .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontFamily: 'Solway',
                                                      fontSize: 14 * ffem,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.2 * ffem / fem,
                                                      color:
                                                          AppColor.kTextColor,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 0 * fem, 21 * fem),
                                          width: double.infinity,
                                          child: Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0 * fem,
                                                    0 * fem,
                                                    108 * fem,
                                                    0 * fem),
                                                child: Text(
                                                  'Bạc',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Solway',
                                                    fontSize: 15 * ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.2 * ffem / fem,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0 * fem,
                                                    0 * fem,
                                                    19 * fem,
                                                    4 * fem),
                                                width: 27 * fem,
                                                height: 24 * fem,
                                                child: SvgPicture.asset(
                                                    'assets/icons/wallet-icon.svg'),
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0 * fem,
                                                    0 * fem,
                                                    0 * fem,
                                                    1 * fem),
                                                child: Text(
                                                  '100.000VND',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Solway',
                                                    fontSize: 15 * ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.2 * ffem / fem,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(180 * fem,
                                              0 * fem, 0 * fem, 1 * fem),
                                          width: double.infinity,
                                          child: Text(
                                            '100.000VND',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Solway',
                                              fontSize: 15 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.2 * ffem / fem,
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 19 * fem,
                                  top: 9 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 54 * fem,
                                      height: 55 * fem,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100 * fem),
                                        child: Image.network(
                                            isStore
                                                ? (jwt.user as StoreExtra)
                                                    .logo
                                                    .toString()
                                                : (jwt.user as Customer)
                                                    .avatar
                                                    .toString(),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 26 * fem,
                                  top: 87 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 28 * fem,
                                      height: 27 * fem,
                                      child: SvgPicture.asset(
                                          'assets/icons/ranking-rank-silver-icon.svg'),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 200 * fem,
                                  top: 127 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 30 * fem,
                                      height: 30 * fem,
                                      child: SvgPicture.asset(
                                          'assets/icons/cash-coins-icon.svg'),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 26 * fem,
                                  top: 130 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 105 * fem,
                                      height: 25 * fem,
                                      child: Image.asset(
                                        'assets/images/profile_percent.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 17 * fem,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                4 * fem, 0 * fem, 0 * fem, 59 * fem),
                            child: Column(
                              children: [
                                ButtonWallet(fem: fem, ffem: ffem),
                                ButtonOrder(fem: fem, ffem: ffem),
                                ButtonHistoryTransaction(fem: fem, ffem: ffem),
                                SizedBox(
                                  height: 50 * fem,
                                ),
                                const ButtonLogout(),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
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
