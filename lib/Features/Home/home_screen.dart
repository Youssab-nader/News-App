import 'package:flutter/material.dart';
import 'package:news_app/Features/Home/Models/home_controller.dart';
import 'package:news_app/Features/Home/Repos/news_repo.dart';
import 'package:news_app/Features/Home/Widgets/categories_widget.dart';
import 'package:news_app/Features/Home/Widgets/trendy_news_widget.dart';
import 'package:news_app/Features/Home/category_screen.dart';
import 'package:news_app/core/Components/daily_nes_widget.dart';
import 'package:news_app/core/Components/view_all.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(NewsRepository()),
      builder: (context, child) {
        return Consumer<HomeController>(
          builder:
              (BuildContext context, HomeController controller, Widget? child) {
                return CustomScrollView(
                  slivers: [
                    TrendyNewsWidget(),
                    SliverToBoxAdapter(
                      child: ViewAllComponent(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ChangeNotifierProvider.value(
                                    value: controller,
                                    child: CategoryScreen(),
                                  ),
                            ),
                          );
                        },
                        title: 'Category',
                        textColor: Colors.black,
                      ),
                    ),
                    SliverToBoxAdapter(child: CategoriesWidget()),
                    DailyNews(),
                  ],
                );
              },
        );
      },
    );
  }
}
