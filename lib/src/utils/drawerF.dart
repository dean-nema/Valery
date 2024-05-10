import 'package:flutter/material.dart';

class DrawerF extends StatelessWidget {
  const DrawerF({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Column(
              children: [
                DrawerHeader(
                    child: Icon(
                  Icons.favorite,
                  semanticLabel: "Valery",
                  size: 64,
                  color: Theme.of(context).canvasColor,
                )),
                ListTile(
                  leading: const Icon(Icons.paste),
                  title: Text(
                    "TASKS",
                    style: TextStyle(color: Theme.of(context).canvasColor),
                  ),
                  iconColor: Theme.of(context).canvasColor,
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/task', (route) => false);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.account_balance_wallet_outlined),
                  title: Text(
                    "CREDITS",
                    style: TextStyle(color: Theme.of(context).canvasColor),
                  ),
                  iconColor: Theme.of(context).canvasColor,
                  onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/credits', (route) => false),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
