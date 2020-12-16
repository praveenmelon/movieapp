import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/screenutil/screenutil.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_backdrop/movie_backdrop_event.dart';
import 'package:movieapp/presentation/journeys/home/movie_carousel/animated_movie_card_widget.dart';
import 'package:movieapp/presentation/journeys/home/movie_carousel/movie_card_widget.dart';
import 'package:movieapp/common/extensions/size_extensions.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;

  const MoviePageView({
    Key key,
    @required this.movies,
    @required this.initialPage,
  })  : assert(initialPage >= 0, 'initialPage cannot be less than 0'),
        super(key: key);

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  PageController _pageController;
  var movie_image = ["https://latestnews.fresherslive.com/images/articles/width-500/2020/11/11/what-channel-is-housos-on-and-when-is-housos-on-tv-5fab65e2275cc-1605068258.jpg","https://latestnews.fresherslive.com//images//articles//width-500//2020//11//11//lost-in-the-woods-lyrics-jonathan-groff-5fab7236c5e3a-1605071414.jpg","https://latestnews.fresherslive.com//images//articles//ians//width-500//2020//11//11//pooja-bedi-invited-to-next-kumbh-by-mahant-giri-5fab75eaeb3e1-1605072362.jpg","https://latestnews.fresherslive.com//images//articles//width-500//2020//11//11//i-got-5-on-it-lyrics-luniz-5fab6f2c750f8-1605070636.jpg","https://latestnews.fresherslive.com//images//articles//ians//width-500//2020//11//11//bravo-youre-behind-now-says-pollard-as-mi-win-5th-ipl-title-5fab748c47f7c-1605072012.jpg","https://latestnews.fresherslive.com//images//articles//width-500//2020//11//10//ableton-11-release-date-5faa8d4c7b7ba-1605012812.jpg","https://latestnews.fresherslive.com//images//articles//ians//width-500//2020//11//11//knives-out-in-cong-after-party-fares-badly-in-bihar-analysis-5fab7501f0d84-1605072129.jpg","https://latestnews.fresherslive.com//images//articles//ians//width-500//2020//11//11//sensex-at-new-high-crosses-43-700-auto-healthcare-stocks-surge-5fab757240490-1605072242.jpg","https://latestnews.fresherslive.com//images//articles//width-500//2020//11//11//lollipop-simulator-codes-5fab620f9a135-1605067279.jpg","https://latestnews.fresherslive.com//images//articles//width-500//2020//11//10//oppo-a93-specification-5faa71b359c1c-1605005747.jpg","https://latestnews.fresherslive.com//images//articles//ians//width-500//2020//11//11//oct-domestic-passenger-vehicles-sales-rises-over-14-5fab76db87dbe-1605072603.jpg","https://latestnews.fresherslive.com//images//articles//width-500//2020//11//11//francis-vs-boogie-epic-rap-battle-lyrics-boogie2988-5fab6cc8aec67-1605070024.jpg"];
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      height: ScreenUtil.screenHeight * 0.35,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final MovieEntity movie = widget.movies[index];
          return AnimatedMovieCardWidget(
            index: index,
            pageController: _pageController,
            movieId: movie.id,
            posterPath: movie.posterPath,
            //posterPath: movie_image[index],
          );
        },
        pageSnapping: true,
        itemCount: widget.movies?.length ?? 0,
        onPageChanged: (index) {
          BlocProvider.of<MovieBackdropBloc>(context)
              .add(MovieBackdropChangedEvent(widget.movies[index]));
        },
      ),
    );
  }
}
