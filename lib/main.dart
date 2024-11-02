import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MovieItem {
  final String title;
  final String imageUrl;
  final List<String> tags;

  MovieItem({
    required this.title,
    required this.imageUrl,
    required this.tags,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streaming App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const StreamingHomeScreen(),
    );
  }
}

class StreamingHomeScreen extends StatelessWidget {
  const StreamingHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Película destacada
    final featuredMovie = MovieItem(
      title: 'The Matrix',
      imageUrl: 'https://i0.wp.com/glenn.zucman.com/i2va/wp-content/uploads/2016/09/The-Matrix-Poster.jpg', // URL de ejemplo
      tags: ['Acción', 'Ciencia Ficción', 'Drama'],
    );

    // Películas populares
    final popularMovies = [
      MovieItem(
        title: 'future',
        imageUrl: 'https://static1.cbrimages.com/wordpress/wp-content/uploads/2021/03/80s-Posters-Back.jpg',
        tags: [],
      ),
      MovieItem(
        title: 'Oppenheimer',
        imageUrl: 'https://static1.colliderimages.com/wordpress/wp-content/uploads/2022/12/oppenheimer-poster.jpg',
        tags: [],
      ),
      MovieItem(
        title: 'dracula',
        imageUrl: 'https://c8.alamy.com/compes/2hcf0r3/pelicula-de-terror-poster-art-dracula-protagonizada-por-bela-lugosi-como-el-conde-dracula-2hcf0r3.jpg',
        tags: [],
      ),
      MovieItem(
        title: 'John Wick 4',
        imageUrl: 'https://cdnb.artstation.com/p/assets/images/images/059/874/373/large/im-cj-john-wick-4-poster.jpg?1677329007',
        tags: [],
      ),
    ];

    // Series Anime
    final animeList = [
      MovieItem(
        title: 'Attack on Titan',
        imageUrl: 'https://m.media-amazon.com/images/M/MV5BNDFjYTIxMjctYTQ2ZC00OGQ4LWE3OGYtNDdiMzNiNDZlMDAwXkEyXkFqcGdeQXVyNzI3NjY3NjQ@._V1_FMjpg_UX1000_.jpg',
        tags: [],
      ),
      MovieItem(
        title: 'Demon Slayer',
        imageUrl: 'https://sportshub.cbsistatic.com/i/2023/03/01/2172fd1a-552e-4c09-81ff-2cade2cf7f2f/fqimna-waautyas.jpg?auto=webp&width=849&height=1200&crop=0.708:1,smart',
        tags: [],
      ),
      MovieItem(
        title: 'Jujutsu Kaisen',
        imageUrl: 'https://i1.wp.com/posterycuadros.com/wp-content/uploads/2021/05/jujutsu_7_rgb.png?w=879&ssl=1',
        tags: [],
      ),
      MovieItem(
        title: 'One Piece',
        imageUrl: 'https://tse2.mm.bing.net/th?id=OIP.mv70v0pnSkivB8sRZaOKBQHaLH&pid=Api&P=0&h=180',
        tags: [],
      ),
    ];

    // Series de Crimen
    final crimeShows = [
      MovieItem(
        title: 'True Detective',
        imageUrl: 'https://i.ebayimg.com/images/g/E7wAAOSwJ1xkry7M/s-l1200.webp',
        tags: [],
      ),
      MovieItem(
        title: 'Better Call Saul',
        imageUrl: 'https://tse1.mm.bing.net/th?id=OIP.ejDZICjfvwLiYu5glZ21ZgHaLH&pid=Api&P=0&h=180',
        tags: [],
      ),
      MovieItem(
        title: 'Fargo',
        imageUrl: 'https://tse2.mm.bing.net/th?id=OIP.rTRcSE9HkCVOhDVZlRvOuwHaKq&pid=Api&P=0&h=180',
        tags: [],
      ),
      MovieItem(
        title: 'Narcos',
        imageUrl: 'https://tse2.mm.bing.net/th?id=OIP.404Lm118k_SzpcIa0nkNAgHaKY&pid=Api&P=0&h=180',
        tags: [],
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sección de película destacada
            Stack(
              children: [
                SizedBox(
                  height: 500,
                  width: double.infinity,
                  child: _buildImageWithFallback(
                    featuredMovie.imageUrl,
                    featuredMovie.title,
                    BoxFit.cover,
                  ),
                ),
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                        Colors.black,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        featuredMovie.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: featuredMovie.tags.map((tag) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            tag,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        )).toList(),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Info',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            // Sección de películas populares
            _buildSection('Películas Populares'),
            _buildMovieList(popularMovies),
            
            // Sección de anime
            _buildSection('Series Anime'),
            _buildMovieList(animeList),
            
            // Sección de series de crímenes
            _buildSection('Series de Crimen'),
            _buildMovieList(crimeShows),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildMovieList(List<MovieItem> movies) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Container(
            width: 130,
            margin: EdgeInsets.only(
              left: index == 0 ? 16 : 8,
              right: index == movies.length - 1 ? 16 : 8,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: _buildImageWithFallback(
                movies[index].imageUrl,
                movies[index].title,
                BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildImageWithFallback(String imageUrl, String title, BoxFit fit) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          imageUrl,
          fit: fit,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (frame == null) {
              return Container(
                color: Colors.grey[900],
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white54,
                  ),
                ),
              );
            }
            return child;
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[900],
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.white54,
                      size: 24,
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}