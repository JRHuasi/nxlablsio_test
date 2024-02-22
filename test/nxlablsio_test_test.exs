defmodule NxlablsioTestTest do

  use ExUnit.Case

  # doctest permite generar tests automáticos a partir de la documentación.
  doctest NxlablsioTest

  # Test para verificar que la función retorna el nombre completo correctamente.
  test "mostrar with :name returns full name" do
    assert NxlablsioTest.mostrar(:name) == "Sonoo Jaiswal"
  end

  # Test para verificar que la función retorna la dirección completa correctamente.
  test "mostrar with :address returns full address" do
    expected_address = "Plot-6, Mohan Nagar Ghaziabad UP 201007"
    assert NxlablsioTest.mostrar(:address) == expected_address
  end

  # Test para verificar que la función calcula el año de nacimiento correctamente.
  test "mostrar with :birth returns birth year" do
    current_year = Date.utc_today().year
    expected_birth_year = Integer.to_string(current_year - 27) # Usamos la edad directamente desde el JSON.
    assert NxlablsioTest.mostrar(:birth) == expected_birth_year
  end
end
