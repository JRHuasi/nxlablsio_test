defmodule NxlablsioTest do
  # Requerimos Jason para poder usar sus funciones de decodificación.
  require Jason

  # Definimos una cadena de texto que representa el JSON con el que trabajaremos.
  @json """
  {
    "firstName": "Sonoo",
    "lastName": "Jaiswal",
    "age": 27,
    "address" : {
        "streetAddress": "Plot-6, Mohan Nagar",
        "city": "Ghaziabad",
        "state": "UP",
        "postalCode": "201007"
    }
  }
  """

  # Función que maneja las solicitudes basadas en la clave dada (:name, :address, :birth).
  def mostrar(:name) do
    # Decodificamos el JSON y extraemos el nombre y apellido si es posible.
    with {:ok, %{"firstName" => first_name, "lastName" => last_name}} <- Jason.decode(@json) do
      "#{first_name} #{last_name}"
    else
      _ -> "Error al decodificar JSON"
    end
  end

  def mostrar(:address) do
    # Decodificamos el JSON y extraemos la dirección completa si es posible.
    with {:ok, %{"address" => %{"streetAddress" => street, "city" => city, "state" => state, "postalCode" => postalCode}}} <- Jason.decode(@json) do
      "#{street} #{city} #{state} #{postalCode}"
    else
      _ -> "Error al decodificar JSON"
    end
  end

  def mostrar(:birth) do
    # Decodificamos el JSON y calculamos el año de nacimiento basado en la edad.
    with {:ok, %{"age" => age}} <- Jason.decode(@json),
         {:ok, current_year} <- Date.utc_today() |> Date.to_iso8601() |> String.split("-") |> hd() |> Integer.parse() do
      birth_year = current_year - age
      "#{birth_year}"
    else
      _ -> "Error al decodificar JSON"
    end
  end
end
