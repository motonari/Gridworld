// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct Gridworld {
    static func main() {
        let discount = 0.9
        var state = State(x: 2, y: 2)
        let grid = Grid()
        var agent = Agent(grid: grid, discount: discount)

        for _ in 0..<5_000 {

            var stateValue = 0.0
            for action in Action.allCases {
                let (nextState, reward) = grid.reward(state: state, action: action)
                stateValue += reward + discount * agent.value(of: nextState)
            }
            agent.update(
                state: state,
                value: stateValue / Double(Action.allCases.count))

            let action = Action.allCases.randomElement()!
            let (nextState, _) = grid.reward(state: state, action: action)
            state = nextState
        }

        agent.dumpStateValues()
    }
}
