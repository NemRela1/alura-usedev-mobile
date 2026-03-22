import 'package:app/pages/home/widgets/categories_section.dart';
import 'package:app/shared/widgets/footer.dart';
import 'package:app/pages/home/widgets/hero_section.dart';
import 'package:app/shared/widgets/navbar.dart';
import 'package:app/shared/widgets/searchbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Navbar(),
            Searchbar(),
            HeroSection(),
            CategoriesSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
