part of 'bottom_navigation_cubit.dart';

@immutable
sealed class BottomNavigationState {}

final class BottomNavigationIndex extends BottomNavigationState {
  final int index;
  BottomNavigationIndex(this.index);
}
