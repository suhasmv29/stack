json.extract! question, :id, :title, :body, :answered, :user_id, :created_at, :updated_at
json.url question_url(question, format: :json)
