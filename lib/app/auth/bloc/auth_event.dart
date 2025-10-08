part of 'auth_bloc.dart';

sealed class AuthEvent {}

// Evento para empezar a escuchar si tenemos un usuario logueado
final class CheckUserEvent extends AuthEvent {}
