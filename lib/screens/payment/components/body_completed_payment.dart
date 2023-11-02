import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/logic/blocs/review/review_bloc.dart';
import 'package:my_app/screens/home/home.dart';
import 'package:my_app/screens/widget/decorate_top.dart';

class BodyCompletedPayment extends StatelessWidget {
  const BodyCompletedPayment({super.key});

  @override
  Widget build(BuildContext context) {
    final commentController = TextEditingController();
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return BlocBuilder<ReviewBloc, ReviewState>(
      builder: (context, state) {
        if (state is ReviewLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColor.primary,
            ),
          );
        }
        if (state is ReviewLoadedState) {
          return Container(
            color: Colors.white,
            child: Column(
              children: [
                const DecorateTop(),
                Padding(
                    padding:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
                    child: Text(
                      'Hoàn tất đơn hàng',
                      style: TextStyle(
                        fontFamily: 'Solway',
                        fontSize: 25 * ffem,
                        color: Colors.black,
                      ),
                    )),
                SizedBox(
                  height: 30 * fem,
                ),
                Padding(
                    padding:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
                    child: Text(
                      'Bạn đánh giá như thế nào?',
                      style: TextStyle(
                        fontFamily: 'Solway',
                        fontSize: 18 * ffem,
                        color: Colors.black,
                      ),
                    )),
                SizedBox(
                  height: 30 * fem,
                ),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SizedBox(
                  height: 30 * fem,
                ),
                Padding(
                    padding:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
                    child: Text(
                      'Hãy cho chúng tôi biết cảm nhận \nvề dịch vụ nhé',
                      style: TextStyle(
                        fontFamily: 'Solway',
                        fontSize: 18 * ffem,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    )),
                SizedBox(
                  height: 30 * fem,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20 * fem, right: 20 * fem),
                  child: TextField(
                    controller: commentController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Nhận xét của bạn!',
                        contentPadding: EdgeInsets.only(
                            left: 20 * fem, bottom: 5 * fem, right: 5 * fem),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30 * fem),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 197, 197, 197)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30 * fem),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 197, 197, 197)),
                        )),
                  ),
                ),
                SizedBox(
                  height: 30 * fem,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(index: 0),
                        ));
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.resolveWith<
                          RoundedRectangleBorder?>((Set<MaterialState> states) {
                        if (states.contains(MaterialState.focused)) {
                          return RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5 * fem),
                              side: const BorderSide(
                                color: AppColor.primary,
                              ));
                        }
                        return RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5 * fem),
                            side: const BorderSide(
                              color: Colors.white,
                            ));
                      }),
                      backgroundColor:
                          MaterialStateProperty.all<Color?>(AppColor.primary)),
                  child: Text(
                    'Gửi đánh giá',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 20 * fem,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(index: 0),
                        ));
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.resolveWith<
                          RoundedRectangleBorder?>((Set<MaterialState> states) {
                        if (states.contains(MaterialState.focused)) {
                          return RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5 * fem),
                              side: const BorderSide(
                                color: AppColor.primary,
                              ));
                        }
                        return RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5 * fem),
                            side: const BorderSide(
                              color: Colors.white,
                            ));
                      }),
                      backgroundColor:
                          MaterialStateProperty.all<Color?>(AppColor.primary)),
                  child: Text(
                    'Về trang chủ',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
          );
        }

        return Container();
      },
    );
  }
}

// class RatingBar extends StatelessWidget {
//   final double rating;
//   final double size;
//   final int? ratingCount;
//   const RatingBar(
//       {required this.rating, this.ratingCount, this.size = 18, super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> _startList = [];
//     final realNumber = rating.floor();
//     final partNumber = ((rating - realNumber) * 10).ceil();

//     for (int i = 0; i < 6; i++) {
//       if (i < realNumber) {
//         _startList.add(Icon(
//           Icons.star,
//           color: AppColor.primary,
//           size: size,
//         ));
//       } else if (i == realNumber) {
//       } else {
//         _startList.add(Icon(
//           Icons.star,
//           color: Colors.grey,
//           size: size,
//         ));
//       }
//     }
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: _startList,
//     );
//   }
// }
