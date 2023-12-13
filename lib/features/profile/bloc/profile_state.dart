part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileErrorState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {}
