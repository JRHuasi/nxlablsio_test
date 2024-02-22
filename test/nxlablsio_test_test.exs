defmodule NxlablsioTestTest do

  use ExUnit.Case
	
  # doctest permite generar tests automáticos a partir de la documentación.
  doctest JsonHandler

  # Test para verificar que la función retorna el nombre completo correctamente.
  test "nombre_funcion with :name returns full name" do
    assert JsonHandler.nombre_funcion(:name) == "Sonoo Jaiswal"
  end

  # Test para verificar que la función retorna la dirección completa correctamente.
  test "nombre_funcion with :address returns full address" do
    expected_address = "Plot-6, Mohan Nagar Ghaziabad UP 201007"
    assert JsonHandler.nombre_funcion(:address) == expected_address
  end

  # Test para verificar que la función calcula el año de nacimiento correctamente.
  # Nota: Este test puede necesitar ajustes para mantenerse actualizado con el paso del tiempo.
  test "nombre_funcion with :birth returns birth year" do
    current_year = Date.utc_today().year
    expected_birth_year = Integer.to_string(current_year - 27) # Usamos la edad directamente desde el JSON.
    assert JsonHandler.nombre_funcion(:birth) == expected_birth_year
  end
end
