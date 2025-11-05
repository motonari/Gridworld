// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct Gridworld {
    static func main() {
        let discount = 0.9
        let grid = Grid()
        var agent = Agent(grid: grid, discount: discount)

        for _ in 0..<1_000 {
            for y in 0..<grid.height {
                for x in 0..<grid.width {
                    let state = State(x: x, y: y)

                    var stateValue = 0.0
                    for action in Action.allCases {
                        let (nextState, reward) = grid.reward(state: state, action: action)
                        stateValue += reward + discount * agent.value(of: nextState)
                    }
                    agent.update(
                        state: state,
                        value: stateValue / Double(Action.allCases.count))
                }
            }
        }

        agent.dumpStateValues()
    }
}
