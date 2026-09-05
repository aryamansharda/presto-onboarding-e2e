import Foundation
import Testing
@testable import PrestoTestAppFeature

@MainActor
@Test func contentViewCanBeCreatedWithoutFixtureMetadata() {
    let view = ContentView(bundle: Bundle(for: BundleProbe.self))
    #expect(String(describing: view).contains("ContentView"))
}

private final class BundleProbe {}
