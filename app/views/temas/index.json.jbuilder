json.array!(@temas) do |tema|
  json.extract! tema, :id, :descricao
  json.url tema_url(tema, format: :json)
end
