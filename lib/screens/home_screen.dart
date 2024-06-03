import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/questions/quiz.dart';
import 'package:quiz_master/services/database.dart';
import 'package:quiz_master/theme/theme.dart';
import 'package:quiz_master/widgets/shimmer_widgets.dart';
import '../widgets/home_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final databaseProvider =
        Provider.of<DatabaseProvider>(context, listen: false);
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
          child: SearchWidget(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.75,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('images/promotional1.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.75,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('images/promotional2.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.75,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('images/promotional3.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          ),
        ),

        // Category Section
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 35, bottom: 5),
          child: Text(
            'Category',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        FutureBuilder(
          future: databaseProvider.fetchCategoriesData(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CategoriesShimmer();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SizedBox(
                      height: 80,
                      child: ListView.builder(
                        itemCount: databaseProvider.categories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryAvatars(
                            image: databaseProvider.categories[index]
                                    ['category_image'] ??
                                '',
                            label: databaseProvider.categories[index]
                                    ['category_name'] ??
                                '',
                            size: 40,
                            onTapped: () async {
                              // await databaseProvider.fetchSubCategoriesData(
                              //     databaseProvider.categories[index]['id'] ??
                              //         '',
                              //     context);

                              // debugPrint('Gotten here TWO');
                              // try {
                              //   debugPrint(
                              //       'Sub Category 22 full displayed data: ${await Provider.of<DatabaseProvider>(context, listen: false).subCategories}');
                              // } catch (e) {
                              //   debugPrint(
                              //       'There was an error with Sub Category 22: $e');
                              // }
                              // debugPrint('Gotten here THREE');
                            },
                          );
                        },
                      )));
            }
          },
        ),

        // CARD Section
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 35, bottom: 5),
          child: Text(
            'Popular Quizzes',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),

        SizedBox(
          height: 450,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.9,
                    mainAxisSpacing: 15),
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 110,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image:
                                        AssetImage('images/promotional3.jpg'),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // debugPrint(
                              //     'Categories Data1: ${categories![index]}');

                              // debugPrint(
                              //     'Categories Image1: ${category['category_image']}');
                              // debugPrint(
                              //     'Categories Name 1: ${category['category_name']}');
                              // debugPrint(
                              //     'Categories Image 2: ${category['category_image'][index]}');
                              // debugPrint(
                              //     'Categories Name 2: ${category['category_name'][index]}');
                              // debugPrint(
                              //     'Category: ${Provider.of<DatabaseProvider>(context, listen: false).category}');

                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const QuizScreen();
                              }));
                            },
                            style: ButtonStyle(
                              elevation: const MaterialStatePropertyAll(0),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor:
                                  const MaterialStatePropertyAll<Color>(
                                AppColors.primary,
                              ),
                              minimumSize: MaterialStatePropertyAll(
                                Size(MediaQuery.sizeOf(context).width * 1, 36),
                              ),
                            ),
                            child: const Text(
                              'Take Quiz',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }
}
