import Foundation
import SourceKittenFramework

public struct ExplicitReturnRule: ConfigurationProviderRule, SubstitutionCorrectableRule, OptInRule {
    public var configuration = ExplicitReturnConfiguration()

    public init() {}

    public static let description = RuleDescription(
        identifier: "explicit_return",
        name: "Explicit Return",
        description: "Prefer explicit returns in closures, functions and getters.",
        kind: .style,
        nonTriggeringExamples: ExplicitReturnRuleExamples.nonTriggeringExamples,
        triggeringExamples: ExplicitReturnRuleExamples.triggeringExamples,
        corrections: ExplicitReturnRuleExamples.corrections
    )

    public func validate(file: SwiftLintFile) -> [StyleViolation] {
        return violationRanges(in: file).compactMap {
            StyleViolation(ruleDescription: type(of: self).description,
                           severity: configuration.severityConfiguration.severity,
                           location: Location(file: file, characterOffset: $0.location))
        }
    }

    public func substitution(for violationRange: NSRange, in file: SwiftLintFile) -> (NSRange, String)? {
        return (violationRange, "")
    }

    public func violationRanges(in file: SwiftLintFile) -> [NSRange] {
        return []
    }
}
