import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/screens/product/filter.dart';

class SearchBarCustom extends StatefulWidget {
  const SearchBarCustom({super.key});

  @override
  State<SearchBarCustom> createState() => _SearchBarCustomState();
}

class _SearchBarCustomState extends State<SearchBarCustom> {
  late final List<String> _suggestions;

  @override
  void initState() {
    super.initState();
    _suggestions = [
      'Afeganistan',
      'Albania',
      'Algeria',
      'Australia',
      'Brazil',
      'German',
      'Madagascar',
      'Mozambique',
      'Portugal',
      'Zambia'
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 20.0),
        Expanded(
          flex: 6,
          child: SearchAnchor(
              viewBackgroundColor: AppColor.primary,
              isFullScreen: false,
              viewConstraints: const BoxConstraints(
                maxHeight: 400.0,
              ),
              builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  controller: controller,
                  padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0)),
                  onTap: () {
                    controller.openView();
                  },
                  onChanged: (_) {
                    controller.openView();
                  },
                  leading: const Icon(
                    Icons.search_rounded,
                    color: Colors.black54,
                  ),
                  hintText: 'Tìm kiếm theo tên sản phẩm hoặc cửa hàng',
                  hintStyle: MaterialStateProperty.all(
                      const TextStyle(color: Colors.grey)),
                  overlayColor: MaterialStateProperty.all(AppColor.primary),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  shape:
                      MaterialStateProperty.all(const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )),
                  side: MaterialStateProperty.all(
                      const BorderSide(color: Colors.grey, width: 1.0)),
                );
              },
              suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
                final keyword = controller.value.text;
                return _suggestions
                    .where((element) =>
                        element.toLowerCase().contains(keyword.toLowerCase()))
                    .map((item) {
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      setState(() {
                        controller.closeView(item);
                        FocusScope.of(context).unfocus();
                      });
                    },
                  );
                }).toList();
              }),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.05),
                  blurRadius: 5.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                )
              ],
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Filter()));
              },
              icon: const Icon(Icons.filter_list_sharp),
              color: AppColor.primaryDark,
              iconSize: 32.0,
            ),
          ),
        ),
        const SizedBox(width: 10.0),
      ],
    );
  }
}
