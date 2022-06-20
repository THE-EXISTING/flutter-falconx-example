part of 'app_migration_bloc.dart';

abstract class AppMigrationEvent extends Equatable {
  const AppMigrationEvent();
}

class AppMigrationVersionChecked extends AppMigrationEvent {
  @override
  List<Object?> get props => [];
}
