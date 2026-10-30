class Movie {
  final String title;
  final String genre;
  final int year;
  final double rating;
  final String image;

  const Movie({
    required this.title,
    required this.genre,
    required this.year,
    required this.rating,
    required this.image,
  });
}

const List<Movie> movies = [
  Movie(
    title: 'Inception',
    genre: 'Sci-Fi',
    year: 2010,
    rating: 8.8,
    image: 'assets/posters/inception.png',
  ),
  Movie(
    title: 'The Dark Knight',
    genre: 'Action',
    year: 2008,
    rating: 9.0,
    image: 'assets/posters/the_dark_knight.png',
  ),
  Movie(
    title: 'Interstellar',
    genre: 'Sci-Fi',
    year: 2014,
    rating: 8.7,
    image: 'assets/posters/interstellar.png',
  ),
  Movie(
    title: 'Toy Story',
    genre: 'Animation',
    year: 1995,
    rating: 8.3,
    image: 'assets/posters/toy_story.png',
  ),
  Movie(
    title: 'The Godfather',
    genre: 'Crime',
    year: 1972,
    rating: 9.2,
    image: 'assets/posters/the_godfather.png',
  ),
  Movie(
    title: 'Spirited Away',
    genre: 'Animation',
    year: 2001,
    rating: 8.6,
    image: 'assets/posters/spirited_away.png',
  ),
  Movie(
    title: 'Mad Max: Fury Road',
    genre: 'Action',
    year: 2015,
    rating: 8.1,
    image: 'assets/posters/mad_max_fury_road.png',
  ),
  Movie(
    title: 'La La Land',
    genre: 'Romance',
    year: 2016,
    rating: 8.0,
    image: 'assets/posters/la_la_land.png',
  ),
  Movie(
    title: 'Gladiator',
    genre: 'Action',
    year: 2000,
    rating: 8.5,
    image: 'assets/posters/gladiator.png',
  ),
  Movie(
    title: 'Parasite',
    genre: 'Thriller',
    year: 2019,
    rating: 8.5,
    image: 'assets/posters/parasite.png',
  ),
];
