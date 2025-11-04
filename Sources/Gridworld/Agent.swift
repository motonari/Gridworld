import Foundation

struct Agent {
    let discount: Double
    var v: [[Double]]
    init(grid: Grid, discount: Double) {
        let row = [Double](repeating: 0.0, count: grid.width)
        self.v = [[Double]](repeating: row, count: grid.height)
        self.discount = discount
    }

    mutating func update(state: State, value: Double) {
        v[state.y][state.x] = value
    }

    func dumpStateValues() {
        for row in v {
            let rowString = row.map { element in
                return String(format: "% 5.1f", element)
            }.joined(separator: " ")

            print(rowString)
        }
    }

    func value(of state: State) -> Double {
        v[state.y][state.x]
    }
}
