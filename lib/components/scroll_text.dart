import 'package:flutter/material.dart';


class ScrollText extends StatefulWidget {
  const ScrollText({Key? key}) : super(key: key);

  @override
  State<ScrollText> createState() => _ScrollTextState();
}

class _ScrollTextState extends State<ScrollText> {
  final _currentPage = ValueNotifier(0);

  final sampleText = [
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "It is a long established fact that a reader will be distracted by the readable content.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor."
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: PageView.builder(
                itemCount: sampleText.length,
                onPageChanged: (count){
                  _currentPage.value = count;
                },
                itemBuilder: (context, count){
                  return Center(child: Text(sampleText[count],
                    style: Theme.of(context).textTheme.headline4,));
                }),
          ),

          ValueListenableBuilder(
              valueListenable: _currentPage,
              builder: (_, value, child){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(sampleText.length, (index) =>
                        IndicatorBar(active: index == value))
                        .toList()
                  ],
                );
              })


        ],
      ),
    );
  }
}

class IndicatorBar extends StatelessWidget {
  final bool active;
  const IndicatorBar({Key? key, required this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      height: 4,
      width: 26,
      decoration: BoxDecoration(
          color: active ? Colors.black87 : Colors.black26,
          borderRadius: BorderRadius.circular(10)),);
  }
}


