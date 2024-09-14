defmodule CoffeeMakerTest do
  use ExUnit.Case
  doctest CoffeeMaker

  test "boil_water returns water status" do
    assert CoffeeMaker.boil_water() == {:ok, "Water is boiled"}
  end

  test "grind_beans returns beans status" do
    assert CoffeeMaker.grind_beans() == {:ok, "Beans are ground"}
  end

  test "make_coffee with boiled water and ground beans" do
    water_status = {:ok, "Water is boiled"}
    beans_status = {:ok, "Beans are ground"}

    assert CoffeeMaker.make_coffee(water_status, beans_status) == {:ok, "Coffee is ready!"}
  end

  test "make_coffee with incorrect water status" do
    water_status = {:error, "Water is not boiled"}
    beans_status = {:ok, "Beans are ground"}

    assert CoffeeMaker.make_coffee(water_status, beans_status) ==
             {:error, "Can't make coffee until water is boiled and beans are ground."}
  end

  test "make_coffee with incorrect beans status" do
    water_status = {:ok, "Water is boiled"}
    beans_status = {:error, "Beans are not ground"}

    assert CoffeeMaker.make_coffee(water_status, beans_status) ==
             {:error, "Can't make coffee until water is boiled and beans are ground."}
  end
end
