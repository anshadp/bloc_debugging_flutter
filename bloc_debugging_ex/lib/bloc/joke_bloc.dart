import 'package:bloc/bloc.dart';
import 'package:bloc_debugging_ex/data/model/joke_model.dart';
import 'package:bloc_debugging_ex/data/repository/joke_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  final JokeRepository _jokeRepository;

  JokeBloc(this._jokeRepository) : super(JokeLoadingState()) {
    on<LoadJokeEvent>(
      (event, emit) async {
        emit(JokeLoadingState());
        try {
          final joke = await _jokeRepository.getJoke();
          emit(JokeLoadedState(joke));
        } catch (e) {
          addError(Exception(e.toString()), StackTrace.current);
          emit(JokeErrorState(e.toString()));
        }
      },
    );
  }

  @override
  void onTransition(Transition<JokeEvent, JokeState> transition) {
    super.onTransition(transition);
    debugPrint(transition.toString());
  }

  @override
  void onChange(Change<JokeState> change) {
    super.onChange(change);
    debugPrint(change.toString());
    debugPrint(change.currentState.toString());
    debugPrint(change.nextState.toString());
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    debugPrint(error.toString());
  }

  @override
  void onEvent(JokeEvent event) {
    super.onEvent(event);
    debugPrint(event.toString());
  }
}
