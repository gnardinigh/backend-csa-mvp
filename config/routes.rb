Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users,:quizzes,:characters,:quiz_chars,:quiz_results
    end
  end
end