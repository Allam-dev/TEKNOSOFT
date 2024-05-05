part of 'splash_cubit.dart';

sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class SplashLoggedin extends SplashState {}

final class SplashLoggedOut extends SplashState {}
