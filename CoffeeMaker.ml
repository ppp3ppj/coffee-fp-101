(* Define the CoffeeMaker module *)
module CoffeeMaker = struct
  (* Define the functions *)
  let boil_water () =
    print_endline "Boiling water...";
    Ok "Water is boiled"

  let grind_beans () =
    print_endline "Grinding beans...";
    Ok "Beans are ground"

  let make_coffee (water_status, beans_status) =
    match (water_status, beans_status) with
    | (Ok "Water is boiled", Ok "Beans are ground") ->
        print_endline "Making coffee...";
        Ok "Coffee is ready!"
    | _ ->
        Error "Can't make coffee until water is boiled and beans are ground."
end

(* Functional pipeline *)
let () =
  let water_status = CoffeeMaker.boil_water () in
  let beans_status = CoffeeMaker.grind_beans () in
  let coffee_status = CoffeeMaker.make_coffee (water_status, beans_status) in
  match coffee_status with
  | Ok message -> print_endline message
  | Error message -> print_endline message
