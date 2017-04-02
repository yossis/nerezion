json.extract! pupil, :id, :first_name, :last_name, :madien_name, :class_name, :email, :phone, :is_coming, :is_registered, :created_at, :updated_at
json.url pupil_url(pupil, format: :json)