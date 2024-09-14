defmodule CoffeeMaker do
 def boil_water() do
    IO.puts("Boiling water...")
    {:ok, "Water is boiled"}
  end

  def grind_beans() do
    IO.puts("Grinding beans...")
    {:ok, "Beans are ground"}
  end

  def make_coffee({:ok, "Water is boiled"}, {:ok, "Beans are ground"}) do
    IO.puts("Making coffee...")
    {:ok, "Coffee is ready!"}
  end

  def make_coffee(_, _) do
    {:error, "Can't make coffee until water is boiled and beans are ground."}
  end
end
