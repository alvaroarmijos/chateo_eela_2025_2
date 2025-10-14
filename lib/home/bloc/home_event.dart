part of 'home_bloc.dart';

sealed class HomeEvent {}

// Disparar la lectura de la base de datos de los contactos
final class GetContactsEvent extends HomeEvent {}

// Actualizar la información del usuario en los contactos
final class UpdateUserStatusEvent extends HomeEvent {
  final bool status;

  UpdateUserStatusEvent({required this.status});
}
