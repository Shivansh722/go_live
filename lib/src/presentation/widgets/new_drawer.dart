import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime currentDateTime = DateTime.now();
    const String accountName =
        'User Name'; // You can replace this with a dynamic value.

    return SidebarX(
      controller: SidebarXController(selectedIndex: 0, extended: true),
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: Theme.of(context).colorScheme.secondaryContainer,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        hoverTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).colorScheme.onTertiary.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [Colors.blue, Colors.green],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
      ),
      footerDivider: Divider(color: Colors.white.withOpacity(0.37)),
      headerBuilder: (context, extended) {
        return SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset('assets/user1.jpg',)
          )
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Home',
          onTap: () {

          },
        ),
        SidebarXItem(
          icon: Icons.radio,
          label: 'Radio',
          onTap: () {

          },
        ),
        SidebarXItem(
          icon: Icons.event,
          label: 'Events',
          onTap: () {

          },
        ),
        SidebarXItem(
          icon: Icons.settings,
          label: 'Settings',
          onTap: () {

          },
        ),
        SidebarXItem(
          icon: Icons.logout,
          label: 'Logout',
          onTap: () {

          },
        ),
      ],
    );
  }
}
