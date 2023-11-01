import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/screens/widget/decorate_top.dart';

class BodySetLocation extends StatelessWidget {
  const BodySetLocation({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const DecorateTop(),
          Padding(
              padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 20 * fem),
              child: Text(
                'Tìm vị trí',
                style: TextStyle(
                  fontFamily: 'Solway',
                  fontSize: 25 * ffem,
                  color: Colors.black,
                ),
              )),
          Padding(
            padding: EdgeInsets.only(
                left: 20 * fem, right: 20 * fem, bottom: 20 * fem),
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Tìm vị trí của bạn',
                  prefixIcon: Icon(Icons.search),
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
          Center(
            child: Container(
                margin:
                    EdgeInsets.fromLTRB(30 * fem, 0 * fem, 30 * fem, 0 * fem),
                width: double.infinity,
                height: 350 * fem,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10 * fem),
                    border: Border.all(
                        color: const Color.fromARGB(255, 206, 206, 206))),
                child: GoogleMap(
                  myLocationButtonEnabled: true,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(
                        10,
                        10,
                      ),
                      zoom: 5 * fem),
                )),
          ),
          Center(
            child: Container(
              margin:
                  EdgeInsets.fromLTRB(30 * fem, 20 * fem, 30 * fem, 0 * fem),
              width: double.infinity,
              height: 150 * fem,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10 * fem),
                  border: Border.all(
                      color: const Color.fromARGB(255, 206, 206, 206))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Vị trí của bạn'),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape: MaterialStateProperty.resolveWith<
                                RoundedRectangleBorder?>(
                            (Set<MaterialState> states) {
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
                        backgroundColor: MaterialStateProperty.all<Color?>(
                            AppColor.primary)),
                    child: Text(
                      'THIẾT LẬP ĐỊA ĐIỂM',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
