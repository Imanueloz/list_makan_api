import 'package:flutter/material.dart';
import 'package:list_makan/styles.dart';
import 'package:list_makan/http_helper.dart';
import 'package:list_makan/makanan.dart';

class DetailPage extends StatelessWidget {
  final Makanan makanan;
  HttpHelper api = HttpHelper();

  DetailPage({super.key, required this.makanan, required this.api});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Image.network(api.url + makanan.gambar, scale: 0.5),
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [BackButton(), FavouriteButton()],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({super.key});

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavourite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
        size: 40,
      ),
      onPressed: () {
        setState(() {
          isFavourite = !isFavourite;
        });
      },
    );
  }
}
