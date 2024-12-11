abstract class FetchUserEvent {}

class LoadUserEvent extends FetchUserEvent {}

class SearchStarted extends FetchUserEvent {
 final String query;
  SearchStarted(this.query);
}
