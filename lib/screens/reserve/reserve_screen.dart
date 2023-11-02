import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/screens/profile_reserve_order/components/item_card.dart';
import 'package:my_app/services/product_service.dart';

class ReserveScreen extends StatelessWidget {
  const ReserveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: buildAppBar(context),
        backgroundColor: Colors.white,
        body: Column(children: [
          Column(
            children: [
              Container(
                margin:
                    EdgeInsets.fromLTRB(18 * fem, 30 * fem, 10 * fem, 20 * fem),
                height: 50 * fem,
                decoration: BoxDecoration(
                    color: AppColor.primaryDark,
                    border: Border.all(
                      width: 5 * fem,
                    )),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20 * fem),
                      child: Text(
                        'Mã đặt trước: ABCXYZGHY19281',
                        style: TextStyle(
                          fontFamily: 'Solway',
                          fontSize: 15 * ffem,
                          fontWeight: FontWeight.bold,
                          height: 1.2 * ffem / fem,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20 * fem),
                      child: const Icon(Icons.copy),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.fromLTRB(18 * fem, 0 * fem, 10 * fem, 20 * fem),
                width: 380 * fem,
                height: 100 * fem,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(5 * fem),
                  border: Border.all(color: Colors.grey, width: 1 * fem),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          5 * fem, 5 * fem, 0 * fem, 5 * fem),
                      child: Text(
                        'Chú ý:',
                        style: TextStyle(
                          fontFamily: 'Solway',
                          fontSize: 13 * ffem,
                          fontWeight: FontWeight.bold,
                          height: 1.2 * ffem / fem,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          10 * fem, 0 * fem, 5 * fem, 0 * fem),
                      child: Text(
                        '- Mã đặt trước chỉ có hiệu lực trong 30 phút kể từ thời điểm đặt hàng.',
                        style: TextStyle(
                          fontFamily: 'Solway',
                          fontSize: 14 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.2 * ffem / fem,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          10 * fem, 0 * fem, 5 * fem, 0 * fem),
                      child: Text(
                        '- Đến cửa hàng, quét mã đặt trước, nhân viên sẽ soạn đơn hàng cho bạn.',
                        style: TextStyle(
                          fontFamily: 'Solway',
                          fontSize: 14 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.2 * ffem / fem,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        20 * fem, 30 * fem, 0 * fem, 0 * fem),
                    width: 200 * fem,
                    child: Text(
                      'Địa chỉ 606/59 đường 3 Tháng 2, F14, Q10, HCM',
                      style: TextStyle(
                        fontFamily: 'Solway',
                        fontSize: 13 * ffem,
                        fontWeight: FontWeight.bold,
                        height: 1.2 * ffem / fem,
                        color: Colors.black,
                      ),
                      softWrap: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0 * fem, 17 * fem, 20 * fem, 50 * fem * fem),
                    child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10 * fem),
                                    side: BorderSide(
                                        color: Colors.black, width: 2 * fem)))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Tìm vị trí',
                              style: TextStyle(
                                fontFamily: 'Solway',
                                fontSize: 13 * ffem,
                                fontWeight: FontWeight.bold,
                                height: 1.2 * ffem / fem,
                                color: Colors.black,
                              ),
                            ),
                            const Icon(
                              Icons.place,
                              color: Colors.purple,
                            )
                          ],
                        )),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Tên sản phẩm',
                    style: TextStyle(
                      fontFamily: 'Solway',
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.bold,
                      height: 1.2 * ffem / fem,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Số lượng',
                    style: TextStyle(
                      fontFamily: 'Solway',
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.bold,
                      height: 1.2 * ffem / fem,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Đơn giá',
                    style: TextStyle(
                      fontFamily: 'Solway',
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.bold,
                      height: 1.2 * ffem / fem,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ItemCard(
                      fem: fem,
                      ffem: ffem,
                      product: ProductService.productLists[index]);
                }),
          ),
          Container(
            height: 50 * fem,
            margin: EdgeInsets.fromLTRB(10 * fem, 10 * fem, 10 * fem, 0 * fem),
            child: Padding(
              padding:
                  EdgeInsets.fromLTRB(10 * fem, 0 * fem, 10 * fem, 0 * fem),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tổng tiền',
                    style: TextStyle(
                      fontFamily: 'Solway',
                      fontSize: 17 * ffem,
                      fontWeight: FontWeight.bold,
                      height: 1.2 * ffem / fem,
                      color: AppColor.primary,
                    ),
                  ),
                  Text(
                    '18000000VND',
                    style: TextStyle(
                      fontFamily: 'Solway',
                      fontSize: 17 * ffem,
                      fontWeight: FontWeight.bold,
                      height: 1.2 * ffem / fem,
                      color: AppColor.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50 * fem,
            child: Text(
              'Mã đặt trước có hiệu lực trong \n 29 phút 59 giây',
              style: TextStyle(
                fontFamily: 'Solway',
                fontSize: 17 * ffem,
                fontWeight: FontWeight.bold,
                height: 1.2 * ffem / fem,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 20*fem),
            width: 250*fem,
            height: 50*fem,
            child: ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10 * fem)),
                  shadowColor: Colors.black,
                  backgroundColor: AppColor.primary),
              child: Padding(
                padding:
                    EdgeInsets.fromLTRB(20 * fem, 0 * fem, 20 * fem, 0 * fem),
                child: Text(
                  'Hoàn thành',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20 * ffem,
                      fontFamily: 'Solway'),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return AppBar(
      toolbarHeight: 100 * fem,
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      leadingWidth: 70.0,
      leading: Builder(builder: (BuildContext context) {
        return Container(
          height: 60 * fem,
          margin: EdgeInsets.fromLTRB(20 * fem, 5 * fem, 0 * fem, 5 * fem),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  blurRadius: 5 * fem,
                  color: Colors.black12,
                  spreadRadius: 1 * fem)
            ],
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              color: Colors.greenAccent,
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
                size: 20 * fem,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        );
      }),
      title: const Center(
        child: Text(
          'Đặt trước thành công',
          style: TextStyle(
            fontFamily: 'Solway',
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
