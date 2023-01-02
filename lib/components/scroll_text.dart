import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textSliderIndex = StateProvider<int>((ref) => 0);


class ScrollText extends ConsumerWidget {
  const ScrollText({Key? key}) : super(key: key);

  final sampleText = const [
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "It is a long established fact that a reader will be distracted by the readable content.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor."
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: PageView.builder(
                itemCount: sampleText.length,
                onPageChanged: (count){
                  ref.read(textSliderIndex.notifier).state = count;
                },
                itemBuilder: (context, count){
                  return Center(child: Text(sampleText[count],
                    style: Theme.of(context).textTheme.headline4,));
                }),
          ),

          Consumer(
              builder: (context, ref, _){
                final selectedIndex = ref.watch(textSliderIndex);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(sampleText.length, (index) =>
                        IndicatorBar(active: index == selectedIndex))
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


