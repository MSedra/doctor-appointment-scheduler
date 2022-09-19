json.extract! doctor, :id, :name, :speciality, :city, :price_per_visit, :created_at, :updated_at
json.url doctor_url(doctor, format: :json)
