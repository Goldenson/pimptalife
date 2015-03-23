json.array!(@pimps) do |pimp|
  json.extract! pimp, :id, :user, :name, :image_id
  json.url pimp_url(pimp, format: :json)
end
