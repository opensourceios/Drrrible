//
//  ShotViewReactionButtonViewReactor.swift
//  Drrrible
//
//  Created by Suyeol Jeon on 12/03/2017.
//  Copyright © 2017 Suyeol Jeon. All rights reserved.
//

import ReactorKit
import RxSwift

class ShotViewReactionButtonViewReactor: Reactor {
  enum Action {
    case toggleReaction
  }

  enum Mutation {
    case setReacted(Bool)
  }

  struct State {
    var isReacted: Bool
    var canToggleReaction: Bool
    var text: String
  }

  let initialState: State

  init(initialState: State) {
    self.initialState = initialState
  }

  func mutate(action: Action) -> Observable<Mutation> {
    return .empty()
  }

  func transform(mutation: Observable<Mutation>) -> Observable<Mutation> {
    let fromShotEvent = Shot.event.flatMap { [weak self] event in
      self?.mutation(from: event) ?? .empty()
    }
    return Observable.of(mutation, fromShotEvent).merge()
  }

  func mutation(from event: Shot.Event) -> Observable<Mutation> {
    return .empty()
  }

  func reduce(state: State, mutation: Mutation) -> State {
    var state = state
    switch mutation {
    case let .setReacted(isReacted):
      state.isReacted = isReacted
      return state
    }
  }
}
