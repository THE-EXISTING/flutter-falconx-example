part of 'app_migration_bloc.dart';

abstract class AppMigrationState extends Equatable {
  const AppMigrationState();
}

class AppMigrationInitial extends AppMigrationState {
  @override
  List<Object> get props => [];
}

class AppMigrationLoading extends AppMigrationState {
  @override
  List<Object> get props => [];
}

class AppMigrationFinished extends AppMigrationState {
  @override
  List<Object> get props => [];
}
