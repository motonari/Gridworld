// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct Gridworld {
    static func main() {
        let discount = 0.9
        let grid = Grid()
        var agent = Agent(grid: grid, discount: discount)

        var delta: Double = 0
        repeat {
            delta = 0
            for y in 0..<grid.height {
                for x in 0..<grid.width {
                    let state = State(x: x, y: y)

                    var newStateValue = 0.0
                    for action in Action.allCases {
                        let (nextState, reward) = grid.reward(state: state, action: action)
                        newStateValue +=
                            (reward + discount * agent.value(of: nextState))
                            / Double(Action.allCases.count)
                    }

                    delta = max(delta, abs(agent.value(of: state) - newStateValue))
                    agent.update(
                        state: state,
                        value: newStateValue)

                }
            }
        } while delta > 0

        agent.dumpStateValues()
    }
}
