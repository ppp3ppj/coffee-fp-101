defmodule CoffeeMakerTest do
  use ExUnit.Case
  doctest CoffeeMaker

  test "greets the world" do
    assert CoffeeMaker.hello() == :world
  end
end
