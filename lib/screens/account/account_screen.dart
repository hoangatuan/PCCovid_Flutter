import 'package:flutter/material.dart';
import 'package:pccovid/screens/account/view_model/account_view_model.dart';

enum UtilityType { introduce, language, place, logout }

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);
  final AccountViewModel viewModel = AccountViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildHeaderView(),
          SizedBox(
            height: 200,
            child: ListView.builder(
                physics:
                    const NeverScrollableScrollPhysics(), // disable scrolling
                padding: const EdgeInsets.all(0),
                itemCount: viewModel.numberOfItems,
                itemBuilder: (context, index) {
                  return cellForItemAtIndex(index);
                }),
          )
        ],
      ),
    );
  }

  Container buildHeaderView() {
    return Container(
      height: 120,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFF3383CD), Color(0xFF11249F)])),
    );
  }

  Widget cellForItemAtIndex(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 50,
      child: Stack(
        children: [
          Center(
            child: Row(
              children: [
                Image.asset(
                  viewModel.icons[index],
                  height: 24,
                ),
                const SizedBox(width: 16),
                Text(
                  viewModel.title[index],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          if (index != viewModel.numberOfItems - 1)
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 1,
                  color: Colors.black,
                )),
        ],
      ),
    );
  }
}
