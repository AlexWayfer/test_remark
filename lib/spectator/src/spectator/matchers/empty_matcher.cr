require "./matcher"

module Spectator::Matchers
  # Matcher that tests whether a collection is empty.
  # The values are checked with the `empty?` method.
  struct EmptyMatcher < StandardMatcher
    # Short text about the matcher's purpose.
    # This explains what condition satisfies the matcher.
    # The description is used when the one-liner syntax is used.
    def description : String
      "is empty"
    end

    # Checks whether the matcher is satisifed with the expression given to it.
    private def match?(actual : TestExpression(T)) : Bool forall T
      actual.value.empty?
    end

    # Message displayed when the matcher isn't satisifed.
    #
    # This is only called when `#match?` returns false.
    #
    # The message should typically only contain the test expression labels.
    # Actual values should be returned by `#values`.
    private def failure_message(actual) : String
      "#{actual.label} is not empty"
    end

    # Message displayed when the matcher isn't satisifed and is negated.
    # This is essentially what would satisfy the matcher if it wasn't negated.
    #
    # This is only called when `#does_not_match?` returns false.
    #
    # The message should typically only contain the test expression labels.
    # Actual values should be returned by `#values`.
    private def failure_message_when_negated(actual) : String
      "#{actual.label} is empty"
    end
  end
end
