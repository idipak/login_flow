import 'package:flutter/material.dart';


class PriceCard extends StatefulWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  const PriceCard({Key? key, required this.text1, required this.text2, required this.text3, required this.text4}) : super(key: key);

  @override
  State<PriceCard> createState() => _PriceCardState();
}

class _PriceCardState extends State<PriceCard> {
  bool isSelected = false;

  tapHandle(){
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
      child: AnimatedPhysicalModel(
        color: Colors.white,
        duration: const Duration(milliseconds: 500),
        elevation: isSelected ? 8.0 : 0.0,
        shadowColor: Colors.black45,
        shape: BoxShape.rectangle,
        child: GestureDetector(
          onTap: tapHandle,
          child: Container(
            padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8)
            ),
            child: SizedBox(
              height: 120,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(widget.text1, style: Theme.of(context).textTheme.headline5,),
                  const SizedBox(height: 4,),
                  Text(widget.text2, style: Theme.of(context).textTheme.caption,),
                  const Spacer(),
                  Text(widget.text3, style: Theme.of(context).textTheme.caption,),
                  const SizedBox(height: 4,),
                  Text(widget.text4, style: Theme.of(context).textTheme.headline5,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

