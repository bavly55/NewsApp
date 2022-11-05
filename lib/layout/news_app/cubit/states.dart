abstract class NewsStates {}
class NewsInitialState extends NewsStates {}
class NewsBottomNavBarState extends NewsStates{}
class NewsModeState extends NewsStates{}
class NewsBusinessLoadingState extends NewsStates{}
class NewsBusinessSuccessState extends NewsStates{}
class NewsBusinessErrorState extends NewsStates{
final String error;

  NewsBusinessErrorState(this.error);
}
class NewsSportsLoadingState extends NewsStates{}
class NewsSportsSuccessState extends NewsStates{}
class NewsSportsErrorState extends NewsStates{
final String error;

  NewsSportsErrorState(this.error);
}
class NewsScienceLoadingState extends NewsStates{}
class NewsScienceSuccessState extends NewsStates{}
class NewsScienceErrorState extends NewsStates{
final String error;

  NewsScienceErrorState(this.error);
}
class NewsSearchLoadingState extends NewsStates{}
class NewsSearchSuccessState extends NewsStates{}
class NewsSearchErrorState extends NewsStates{
final String error;

  NewsSearchErrorState(this.error);
}
class NewsSearchGetSelectedState extends NewsStates{}
class NewsSetDesktopState extends NewsStates{}
class NewsIconAppBarState extends NewsStates{}
class NewsChangeModeState extends NewsStates{}
class AppBottomNavBarChange extends  NewsStates {}