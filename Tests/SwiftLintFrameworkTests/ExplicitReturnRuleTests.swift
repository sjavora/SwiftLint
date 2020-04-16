@testable import SwiftLintFramework
import XCTest

class ExplicitReturnRuleTests: XCTestCase {
    func testWithDefaultConfiguration() {
        verifyRule(ExplicitReturnRule.description)
    }

    func testOnlyClosureKindIncluded() {
        let nonTriggeringExamples = ExplicitReturnRuleExamples.GenericExamples.nonTriggeringExamples +
            ExplicitReturnRuleExamples.ClosureExamples.nonTriggeringExamples +
            ExplicitReturnRuleExamples.FunctionExamples.nonTriggeringExamples +
            ExplicitReturnRuleExamples.FunctionExamples.triggeringExamples +
            ExplicitReturnRuleExamples.GetterExamples.nonTriggeringExamples +
            ExplicitReturnRuleExamples.GetterExamples.triggeringExamples
        let triggeringExamples = ExplicitReturnRuleExamples.ClosureExamples.triggeringExamples
        let corrections = ExplicitReturnRuleExamples.ClosureExamples.corrections

        let description = ExplicitReturnRule.description
            .with(nonTriggeringExamples: nonTriggeringExamples)
            .with(triggeringExamples: triggeringExamples)
            .with(corrections: corrections)

        self.verifyRule(description, returnKind: .closure)
    }

    func testOnlyFunctionKindIncluded() {
        let nonTriggeringExamples = ExplicitReturnRuleExamples.GenericExamples.nonTriggeringExamples +
            ExplicitReturnRuleExamples.ClosureExamples.nonTriggeringExamples +
            ExplicitReturnRuleExamples.ClosureExamples.triggeringExamples +
            ExplicitReturnRuleExamples.FunctionExamples.nonTriggeringExamples +
            ExplicitReturnRuleExamples.GetterExamples.nonTriggeringExamples +
            ExplicitReturnRuleExamples.GetterExamples.triggeringExamples
        let triggeringExamples = ExplicitReturnRuleExamples.FunctionExamples.triggeringExamples
        let corrections = ExplicitReturnRuleExamples.FunctionExamples.corrections

        let description = ExplicitReturnRule.description
            .with(nonTriggeringExamples: nonTriggeringExamples)
            .with(triggeringExamples: triggeringExamples)
            .with(corrections: corrections)

        self.verifyRule(description, returnKind: .function)
    }

    func testOnlyGetterKindIncluded() {
        let nonTriggeringExamples = ExplicitReturnRuleExamples.GenericExamples.nonTriggeringExamples +
            ExplicitReturnRuleExamples.ClosureExamples.nonTriggeringExamples +
            ExplicitReturnRuleExamples.ClosureExamples.triggeringExamples +
            ExplicitReturnRuleExamples.FunctionExamples.nonTriggeringExamples +
            ExplicitReturnRuleExamples.FunctionExamples.triggeringExamples +
            ExplicitReturnRuleExamples.GetterExamples.nonTriggeringExamples
        let triggeringExamples = ExplicitReturnRuleExamples.GetterExamples.triggeringExamples
        let corrections = ExplicitReturnRuleExamples.GetterExamples.corrections

        let description = ExplicitReturnRule.description
            .with(nonTriggeringExamples: nonTriggeringExamples)
            .with(triggeringExamples: triggeringExamples)
            .with(corrections: corrections)

        self.verifyRule(description, returnKind: .getter)
    }

    private func verifyRule(_ ruleDescription: RuleDescription, returnKind: ExplicitReturnConfiguration.ReturnKind) {
        self.verifyRule(ruleDescription, ruleConfiguration: ["included": [returnKind.rawValue]])
    }
}
