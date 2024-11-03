# frozen_string_literal: true

require "test_helper"

class ExampleComponentTest < ViewComponent::TestCase
  def test_component_renders_something_useful
    render_inline(ExampleComponent.new(title: "Example Title")) { "Hello, components!" }

    assert_selector("span[title='Example Title']", text: "Hello, components!")
  end
end
