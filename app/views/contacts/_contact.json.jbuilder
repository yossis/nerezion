json.extract! contact, :id, :full_name, :email, :phone_number, :body, :created_at, :updated_at
json.url contact_url(contact, format: :json)