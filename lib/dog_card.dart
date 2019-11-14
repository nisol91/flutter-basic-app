import 'package:flutter/material.dart';

import 'dog_model.dart';
import 'dog_detail_page.dart';

class DogCard extends StatefulWidget {
  final Dog dog;

  DogCard(this.dog);

  @override
  _DogCardState createState() => _DogCardState(dog);
}

class _DogCardState extends State<DogCard> {
  Dog dog;

  _DogCardState(this.dog);

  //con il metodo build unisco tutti i widget,
  // assemblandoli dentro a un container principale, che in questo caso è la dog card
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: showDogDetailPage,
      child: Container(
        height: 115.0,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Stack(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[dogImage, dogCard],
              )
              // Positioned(
              //   child: dogCard,
              // ),
              // Positioned(
              //   left: 20,
              //   top: 7.5,
              //   child: dogImage,
              // )
            ],
          ),
        ),
      ),
    );
  }

  showDogDetailPage() {
    print('tapped ${dog.name}');
    Navigator.of(context).push(
      MaterialPageRoute(
        // builder methods always take context!
        builder: (context) {
          return DogDetailPage(dog);
        },
      ),
    );
  }

  //metodi vari
  void initState() {
    super.initState();
    renderDogPic();
  }

  renderDogPic() async {
    await dog.getImageUrl();
    print(dog.imageUrl);
    if (mounted) {
      setState(() {
        renderUrl = dog.imageUrl;
      });
    }
  }

  // qui costruisco tutti i widget con il metodo get

  //dogCard
  Widget get dogCard {
    return Container(
        width: 300,
        height: 115.0,
        child: Card(
          color: Colors.blueGrey,
          child: Padding(
            padding: const EdgeInsets.only(
              // top: 10,
              // bottom: 10,
              left: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(widget.dog.name),
                Text(widget.dog.description),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                    ),
                    Text(': ${widget.dog.rating} / 10')
                  ],
                )
              ],
            ),
          ),
        ));
  }

  //dogImage
  String renderUrl;

  Widget get dogImage {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(renderUrl ?? ''))),
    );
  }
}
