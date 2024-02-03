import 'package:flutter/material.dart';
import 'package:themoviedb_app/domain/api_client/api_client.dart';
import 'package:themoviedb_app/domain/library/Inherited/provider.dart';
import 'package:themoviedb_app/ui/widgets/elements/radial_percant_widget.dart';
import 'package:themoviedb_app/resources/app_images.dart';
import 'package:themoviedb_app/ui/widgets/movie_details/movie_details_model.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _TopPosterWidget(),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: _MovieNameWidget(),
        ),
        const _ScoreWidget(),
        const _SummeryWidget(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _OverviewWidget(),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: _DescriptionWidget(),
        ),
        const SizedBox(height: 30),
        const _PeopleWidgets(),
      ],
    );
  }

  Text _OverviewWidget() {
    return const Text(
      'Overview',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'An elite Navy SEAL uncovers an international conspiracy while seeking justice for the murder of his pregnant wife.',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    final backdropPath = model?.movieDetails?.backdropPath;
    final posterPath = model?.movieDetails?.posterPath;
    return AspectRatio(
      aspectRatio: 390 / 219,
      child: Stack(
        children: [
          backdropPath != null
              ? Image.network(ApiClient.imageUrl(backdropPath))
              : const SizedBox.shrink(),
          Positioned(
            top: 20,
            left: 20,
            bottom: 20,
            child: posterPath != null
                ? Image.network(ApiClient.imageUrl(posterPath))
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 3,
      textAlign: TextAlign.center,
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Tom Clancy`s Without Remorse',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: ' (2021)',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {},
          child: const Row(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: RadialPercentWidget(
                  percent: 0.72,
                  fillColor: Color.fromARGB(255, 10, 23, 25),
                  lineColor: Color.fromARGB(255, 37, 203, 103),
                  freeColor: Color.fromARGB(255, 25, 54, 31),
                  lineWidth: 3,
                  child: Text('72'),
                ),
              ),
              SizedBox(width: 10),
              Text('User Score'),
            ],
          ),
        ),
        Container(width: 1, height: 15, color: Colors.grey),
        TextButton(
          onPressed: () {},
          child: const Row(
            children: [
              Icon(Icons.play_arrow),
              Text('Play Trailer'),
            ],
          ),
        ),
      ],
    );
  }
}

class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Color.fromRGBO(22, 21, 25, 1.0),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 70),
        child: Text(
          'R, 04/29/2021 (US) 1h49m Action, Adventure, Thriller, War',
          maxLines: 3,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class _PeopleWidgets extends StatelessWidget {
  const _PeopleWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    const nameStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
    const jobTilteStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
    return const Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Stefano Sollima', style: nameStyle),
                Text('Director', style: jobTilteStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Stefano Sollima', style: nameStyle),
                Text('Director', style: jobTilteStyle),
              ],
            )
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Stefano Sollima', style: nameStyle),
                Text('Director', style: jobTilteStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Stefano Sollima', style: nameStyle),
                Text('Director', style: jobTilteStyle),
              ],
            )
          ],
        ),
      ],
    );
  }
}
