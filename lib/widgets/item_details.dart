import 'package:flutter/material.dart';

import 'package:flufin/models/models.dart';
import 'package:flufin/widgets/widgets.dart';

class ItemDetails extends StatelessWidget {
  final void Function() onTap;
  final bool? backdrop;
  final Item item;
  final double height;
  final double width;
  final bool? year;

  const ItemDetails({
    Key? key,
    required this.item,
    required this.height,
    required this.width,
    required this.onTap,
    this.backdrop,
    this.year = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Stack(
        children: [
          _Body(
            item: item,
            height: height,
            width: width,
            backdrop: backdrop,
            onTap: onTap,
            year: year,
          ),
          if (item.userData?.playedPercentage != null)
            _ProgressTime(item: item),
        ],
      ),
    );
  }
}

class _ProgressTime extends StatelessWidget {
  const _ProgressTime({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: LinearProgressIndicator(
          minHeight: 8,
          value: item.userData!.playedPercentage! / 100,
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final void Function() onTap;
  final double height;
  final double width;
  final Item item;
  final bool? backdrop;
  final bool? year;

  const _Body({
    Key? key,
    required this.item,
    required this.height,
    required this.width,
    required this.onTap,
    this.backdrop,
    this.year = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ItemImage(
                item: item,
                height: height * 0.75,
                width: width,
                backdrop: backdrop,
              ),
              if (year == true && item.productionYear != null)
                _Year(item: item),
            ],
          ),
          ItemTitle(
            item: item,
          ),
        ],
      ),
    );
  }
}

class _Year extends StatelessWidget {
  const _Year({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              item.productionYear!.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
