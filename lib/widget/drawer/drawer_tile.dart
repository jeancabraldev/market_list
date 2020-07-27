import 'package:flutter/material.dart';
import 'package:market_list/models/page/page_manager.dart';
import 'package:provider/provider.dart';

class DrawerTileWidget extends StatelessWidget {
  const DrawerTileWidget({this.icon, this.title, this.page});

  final IconData icon;
  final String title;
  final int page;

  @override
  Widget build(BuildContext context) {
    final int currentPage = context.watch<PageManager>().page;
    return Material(
      child: InkWell(
        onTap: () {
          context.read<PageManager>().setPage(page);
        },
        child: SizedBox(
          height: 50,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  icon,
                  color: currentPage == page
                      ? Colors.deepOrange
                      : Colors.grey[600],
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  color: currentPage == page
                      ? Colors.deepOrange
                      : Colors.grey[600],
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
