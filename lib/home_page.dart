import 'package:flutter/material.dart';

import 'movie.dart';
import 'movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isGrid = false;
  String _query = '';

  // Bonus: the shared value lives in HomePage, the parent of every card.
  // When it changes, setState rebuilds HomePage and every card gets the new
  // value at the same time.
  int _discount = 20;

  void _decreaseDiscount() {
    setState(() {
      if (_discount > 0) {
        _discount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final query = _query.trim().toLowerCase();
    final filteredMovies = movies
        .where((movie) =>
            movie.title.toLowerCase().contains(query) ||
            movie.genre.toLowerCase().contains(query))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Library'),
        actions: [
          IconButton(
            tooltip: _isGrid ? 'Show as list' : 'Show as grid',
            icon: Icon(_isGrid ? Icons.view_list : Icons.grid_view),
            onPressed: () {
              setState(() {
                _isGrid = !_isGrid;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _query = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Search movies...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: filteredMovies.isEmpty
                ? const Center(child: Text('No movies found'))
                : _isGrid
                    ? _buildGrid(filteredMovies)
                    : _buildList(filteredMovies),
          ),
        ],
      ),
    );
  }

  Widget _buildList(List<Movie> list) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: SizedBox(
            height: 380,
            child: MovieCard(
              movie: list[index],
              discount: _discount,
              onDiscountTap: _decreaseDiscount,
            ),
          ),
        );
      },
    );
  }

  Widget _buildGrid(List<Movie> list) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: list.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, index) {
        return MovieCard(
          movie: list[index],
          discount: _discount,
          onDiscountTap: _decreaseDiscount,
        );
      },
    );
  }
}
