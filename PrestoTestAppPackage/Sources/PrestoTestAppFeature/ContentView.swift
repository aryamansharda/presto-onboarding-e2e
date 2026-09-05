import SwiftUI

public struct ContentView: View {
    @AppStorage("presto.fixture.count") private var count = 0

    private let fixtureVersion: String

    public init(bundle: Bundle = .main) {
        self.fixtureVersion = bundle.object(forInfoDictionaryKey: "PrestoFixtureVersion") as? String ?? "UNKNOWN"
    }

    public var body: some View {
        VStack(spacing: 16) {
            Text("Presto E2E")
                .font(.title.bold())

            Text("Version: \(fixtureVersion)")
                .font(.headline.monospaced())
                .accessibilityIdentifier("fixture-version")

            Text("Count: \(count)")
                .font(.body.monospacedDigit())
                .contentTransition(.numericText())
                .animation(.snappy, value: count)
                .accessibilityIdentifier("fixture-count")

            Button("Increment") {
                count += 1
            }
            .buttonStyle(.borderedProminent)
            .frame(minWidth: 44, minHeight: 44)
            .accessibilityIdentifier("increment-button")
        }
        .padding(24)
    }
}
