json.array!(@banco_ideia) do |banco_ideium|
  json.extract! banco_ideium, :id, :nome, :email, :estado, :cidade, :telefone, :lista_tipo, :titulo, :texto_ideia
  json.url banco_ideium_url(banco_ideium, format: :json)
end
