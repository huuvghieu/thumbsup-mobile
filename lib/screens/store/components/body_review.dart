import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/common/image.dart';

class BodyReview extends StatelessWidget {
  const BodyReview({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(25 * fem, 0 * fem, 25 * fem, 0 * fem),
          width: double.infinity,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Viết đánh giá...',
              hintStyle: TextStyle(
                  fontFamily: 'Solway',
                  fontSize: 16 * ffem,
                  color: Colors.black),
              contentPadding:
                  EdgeInsets.fromLTRB(15 * fem, 0 * fem, 0 * fem, 0 * fem),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15 * fem),
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 229, 228, 228))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15 * fem),
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 229, 228, 228))),
              prefixIcon: Padding(
                padding:
                    EdgeInsets.fromLTRB(10 * fem, 5 * fem, 10 * fem, 5 * fem),
                child: Image.asset(
                  logoImage,
                  width: 30 * fem,
                  height: 30 * fem,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            // children: [
            //   Container(
            //     margin:
            //         EdgeInsets.fromLTRB(10 * fem, 0 * fem, 10 * fem, 10 * fem),
            //     child: Stack(
            //       children: [
            //         Positioned(
            //           // rectangle4109Hxc (200:1321)
            //           left: 0 * fem,
            //           top: 0 * fem,
            //           child: Align(
            //             child: SizedBox(
            //               width: 49 * fem,
            //               height: 48 * fem,
            //               child: ClipRRect(
            //                 borderRadius:
            //                     BorderRadius.circular(113.9493560791 * fem),
            //                 child: Image.asset(
            //                   logoImage,
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   )
            // ],
          ),
        )
      ],
    );
  }
}
