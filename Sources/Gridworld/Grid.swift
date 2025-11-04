struct Grid {
    let width = 5
    let height = 5

    private func movement(of action: Action) -> (Int, Int) {
        return switch action {
        case .north:
            (0, -1)
        case .south:
            (0, +1)
        case .east:
            (+1, 0)
        case .west:
            (-1, 0)
        }
    }

    func reward(
        state: State,
        action: Action
    ) -> (State, Double) {
        var newX = 0
        var newY = 0
        var reward = 0.0

        if state.x == 1 && state.y == 0 {
            // A
            newX = 1
            newY = 4
            reward = +10.0
        } else if state.x == 3 && state.y == 0 {
            // B
            newX = 3
            newY = 2
            reward = +5.0
        } else {
            let (dx, dy) = movement(of: action)
            newX = state.x + dx
            newY = state.y + dy

            if newX < 0 || width <= newX || newY < 0 || height <= newY {
                // off the grid.
                newX = state.x
                newY = state.y
                reward = -1.0
            }
        }
        return (State(x: newX, y: newY), reward)
    }
}
