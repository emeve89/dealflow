json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :duedate, :description
  json.url task_url(task, format: :json)
end
