import 'package:flutter/material.dart';
import 'package:news_app/core/controllers/main_controller.dart';
import 'package:news_app/Features/Home/Widgets/categories_widget.dart';
import 'package:news_app/Features/Home/Widgets/trendy_news_widget.dart';
import 'package:news_app/Features/Home/Screens/category_screen.dart';
import 'package:news_app/core/Components/daily_nes_sliver.dart';
import 'package:news_app/core/Components/view_all.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<MainController>(
      builder:
          (BuildContext context, MainController controller, Widget? child) {
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
                DailyNewsSliver(allNews: controller.dailyNews),
              ],
            );
          },
    );
  }
}
