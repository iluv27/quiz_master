import 'package:flutter/material.dart';

// Categoties
class CategoryAvatars extends StatelessWidget {
  const CategoryAvatars(
      {super.key, required this.image, required this.label, this.onTapped});

  final String image;
  final String label;
  final Function()? onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.scrim,
                borderRadius: BorderRadius.circular(100000),
                image: DecorationImage(
                  image: AssetImage(image),
                )),
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}

class CategoryAvatars2 extends StatelessWidget {
  const CategoryAvatars2(
      {super.key, required this.image, required this.label, this.onTapped});

  final String image;
  final String label;

  final Function()? onTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 35,
          width: 35,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.scrim,
              borderRadius: BorderRadius.circular(100000),
              image: DecorationImage(
                image: AssetImage(image),
              )),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }
}

// SEARCH WIDGET
class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SearchBar(
      hintText: 'Search quiz?',
      leading: Icon(Icons.search),
      padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
          EdgeInsets.only(left: 25)),
    );
  }
}
