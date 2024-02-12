import 'package:flutter/material.dart';
import 'package:themoviedb_app/domain/data_providers/session_data_provider.dart';
import 'package:themoviedb_app/domain/library/Inherited/provider.dart';
import 'package:themoviedb_app/ui/widgets/movie_lis/movie_list_model.dart';
import 'package:themoviedb_app/ui/widgets/movie_lis/movie_list_widget.dart';
import 'package:themoviedb_app/ui/widgets/news/new_widget.dart';
import 'package:themoviedb_app/ui/widgets/tv_show_list/tv_show_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;
  final movieListModel = MovieListModel();

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    movieListModel.setupLocale(context);
  }

  @override
  Widget build(BuildContext context) {
    // final model = NotifierProvider.read<MainScreenModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TMDB',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => SessionDataProvider().setSessionId(null),
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          const NewsWidget(),
          NotifierProvider(
            create: () => movieListModel,
            isManagingModel: false,
            child: const MovieListWidget(),
          ),
          TWShowListWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Новости',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_filter),
            label: 'Фильмы',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Сериалы',
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
