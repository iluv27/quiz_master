import 'package:flutter/material.dart';

// Categoties
class CategoryAvatars extends StatelessWidget {
  const CategoryAvatars(
      {super.key,
      required this.image,
      required this.label,
      required this.size,
      this.onTapped});

  final String image;
  final String label;
  final Function()? onTapped;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Column(
        children: [
          Container(
            height: size,
            width: size,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.scrim,
                borderRadius: BorderRadius.circular(100000),
                image: DecorationImage(
                  image: NetworkImage(image, scale: 4),
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
