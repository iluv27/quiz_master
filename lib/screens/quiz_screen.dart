import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/services/database.dart';
import 'package:quiz_master/services/quiz_service.dart';
import 'package:quiz_master/theme/provider.dart';
import 'package:quiz_master/theme/theme.dart';
import 'package:quiz_master/widgets/categ_widgets.dart';
import 'package:quiz_master/widgets/home_widgets.dart';
import 'package:quiz_master/widgets/shimmer_widgets.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int selIndex = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final databaseProvider =
        Provider.of<DatabaseProvider>(context, listen: false);
    databaseProvider.fetchSubCategoriesData(
        databaseProvider.categories[databaseProvider.indexOfCategories]['id'],
        context);

    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
          child: SearchWidget(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: topNavigator(context),
        ),
        categView(context, databaseProvider),
      ],
    );
  }

  Future<Map<String, dynamic>> fetchData(
      DatabaseProvider databaseProvider) async {
    final data1 = await databaseProvider.fetchSubCategoriesData(
        databaseProvider.categories[databaseProvider.indexOfCategories]['id'],
        context);
    final data2 = await databaseProvider.fetchQuestions(databaseProvider
        .subCategories[databaseProvider.indexOfSubCategories]['id']);
    final data3 = await databaseProvider.fetchAnswers(databaseProvider
        .questions[databaseProvider.indexOfSubCategories]['id']);

    return {
      'data1': data1,
      'data2': data2,
      'data3': data3,
    };
  }

  Container categView(BuildContext context, DatabaseProvider databaseProvider) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

//List<String> imageUrls = List<String>.from(widget.houseData['images']);
    return Container(
      color: themeProvider.themeData == lightMode
          ? const Color(0xffffffff)
          : const Color(0xff111111),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: FutureBuilder(
        future: fetchData(databaseProvider),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SubCategoriesShimmer();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final data1 = snapshot.data!['data1'];
            final data2 = snapshot.data!['data2'];
            final data3 = snapshot.data!['data3'];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
              child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    selIndex = value;
                  });
                },
                scrollDirection: Axis.vertical,
                children: databaseProvider.subCategories.map((categoryData) {
                  return _buildContent(
                      context, data1, data2, data3, databaseProvider);
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, data1, data2, data3,
      DatabaseProvider databaseProvider) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategHeaderLabel(
            headerLabel:
                databaseProvider.categories[databaseProvider.indexOfCategories]
                        ['category_name'] ??
                    '',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.63,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
                itemCount: data1.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 10,
                    crossAxisCount:
                        2, // You can adjust the number of columns here

                    childAspectRatio: 0.85),
                itemBuilder: (context, index) {
                  // Get the subCategoryTitles from the DatabaseProvider
                  return SubcategModel(
                    assetName: databaseProvider.subCategories[index]
                        ['sub_category_image'],
                    subCategLabel: databaseProvider.subCategories[index]
                        ['sub_category_title'],
                    categColor: colors[index % colors.length],
                    questionTotal: (data2).length,
                    questionAnswerPage: () {
                      databaseProvider.indexOfSubCategories = index;
                      data2;
                      data3;

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Wrap(
                          children: databaseProvider.answers.map((answer) {
                            //   debugPrint('ANSWERS ARE ${answer['options']}');

                            return SizedBox(
                              height: MediaQuery.sizeOf(context).height,
                              child: QuizScreen222(
                                questionTitle:
                                    data1[index]['sub_category_title'] ?? '',
                                questionQuestion: data2,
                                selectedAnswers:
                                    databaseProvider.selectedAnswersList,
                              ),
                            );
                          }).toList(),
                        );
                      }));
                    },
                  );
                }),
          )
        ],
      ),
    );
  }

  SizedBox topNavigator(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final databaseProvider =
        Provider.of<DatabaseProvider>(context, listen: false);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.09,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: databaseProvider.categories.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selIndex = index;
                  databaseProvider.indexOfCategories = index;
                });

                databaseProvider.fetchSubCategoriesData(
                    databaseProvider
                        .categories[databaseProvider.indexOfCategories]['id'],
                    context);

                // debugPrint('ORIGINAL INDEX: $index');

                // debugPrint(
                //     'INDEX OF CATEGORIES: ${databaseProvider.indexOfCategories}');

                // debugPrint(
                //     'SUBCATEGORY TITLE: ${databaseProvider.categories[databaseProvider.indexOfCategories]['category_name']}');

                // debugPrint('SUBCATEGORY: ${databaseProvider.subCategories}');
                pageController.jumpToPage(index);
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.elliptical(30, 30),
                        topRight: Radius.elliptical(30, 30)),
                    color: themeProvider.themeData == lightMode
                        ? index == selIndex
                            ? Colors.white
                            : Colors.transparent
                        : index == selIndex
                            ? const Color(0xff111111)
                            : Colors.transparent,
                  ),
                  child: CategoryAvatars(
                    image: databaseProvider.categories[index]
                            ['category_image'] ??
                        '',
                    label: databaseProvider.categories[index]
                            ['category_name'] ??
                        '',
                    size: 35,
                  ),
                ),
              ),
            );
          }),
    );
  }
}

List<Color> colors = const [
  Color.fromARGB(255, 227, 255, 242),
  Color.fromARGB(255, 232, 217, 255),
  Color.fromARGB(255, 255, 244, 231),
  Color.fromARGB(255, 252, 227, 246),
  Color.fromARGB(255, 255, 240, 221),
  Color(0xffffefff),
  Color(0xffafffff),
  Color(0xffffcfff),
  Color(0xffffcfff),
  Color.fromARGB(255, 207, 214, 255),
  Color.fromARGB(255, 255, 240, 221),
  Color(0xffffefff),
  Color(0xffafffff),
  Color(0xffffcfff),
  Color(0xffffcfff),
  Color.fromARGB(255, 207, 214, 255),
  Color(0xffafffff),
];
