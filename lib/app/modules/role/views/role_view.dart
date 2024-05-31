import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../consts/global_var.dart';
import '../../../../consts/text_size.dart';
import '../../../../gen_assets/assets.gen.dart';
import '../../../../shared_widget/text/apptext.dart';
import '../controllers/role_controller.dart';

class RoleView extends GetView<RoleController> {
  const RoleView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController menuController = TextEditingController();
    // MenuItem? selectedMenu;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SizedBox(
            height: mHeight(context),
            width: mWidth(context),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  header(context),
                  const SizedBox(height: 30),
                  // CText(
                  //     width: width(context) * 0.6,
                  //     size: AppTextSize.labelLargeFont,
                  //     txt: LocaleKeys.role_select_country.tr),
                  DropdownMenu<MenuItem>(
                    initialSelection: menuItems.first,
                    controller: menuController,
                    width: MediaQuery.of(context).size.width - 16.0,
                    hintText: "Select Menu",
                    requestFocusOnTap: true,
                    enableFilter: true,
                    inputDecorationTheme: InputDecorationTheme(
                      filled: true,
                      fillColor: colorScheme(context).primary.withOpacity(0.4),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Set the radius to 12
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSelected: (MenuItem? menu) {
                      // selectedMenu = menu;
                    },
                    dropdownMenuEntries: menuItems
                        .map<DropdownMenuEntry<MenuItem>>((MenuItem menu) {
                      return DropdownMenuEntry<MenuItem>(
                        value: menu,
                        label: menu.label,
                        leadingIcon: Icon(menu.icon),

                        // tileColor: Colors.blue[100], // Change the menu background color
                      );
                    }).toList(),
                  ),
                ],
              ),
            )));
  }

  header(context) {
    return SizedBox(
      height: 140,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgGenImage(Assets.icons.icLogo.path).svg(width: 70),
          CText(
              txt: "HomeGlam",
              weight: FontWeight.bold,
              color: colorScheme(context).onSurfaceVariant,
              space: 2,
              align: TextAlign.center,
              size: AppTextSize.displayMediumFont)
        ],
      ),
    );
  }
}

class MenuItem {
  final int id;
  final String label;
  final IconData icon;

  MenuItem(this.id, this.label, this.icon);
}

List<MenuItem> menuItems = [
  MenuItem(1, 'Home', Icons.home),
  MenuItem(2, 'Profile', Icons.person),
  MenuItem(3, 'Settings', Icons.settings),
  MenuItem(4, 'Favorites', Icons.favorite),
  MenuItem(5, 'Notifications', Icons.notifications)
];
