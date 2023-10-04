import 'package:flutter/material.dart';
import 'package:my_app/common/image.dart';
import 'package:my_app/model/category.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              color: Colors.white,
              width:1000,
              height: 130,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(Category.categories.length, (index) => 
                  CategoryCard(
                    text: Category.categories[index].name,
                    image: headPhone,
                    press:(){} ))
                ],
              ),
            ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key, required this.text, required this.image, required this.press,
  });

  final String text, image;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: 80,
        height: 125,
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: const Color.fromARGB(255, 244, 240, 240)
                  ),
                  // boxShadow: const [
                  //   BoxShadow(
                  //     offset: Offset(0, 10),
                  //     blurRadius: 25,
                  //   )
                  // ]
                  ),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Image.asset(
                        image,
                        width: 55,
                        height: 55,
                      )),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Solway',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                      ),
                    ),
                  )
                ],
              )),
        ),
    );
  }
}
