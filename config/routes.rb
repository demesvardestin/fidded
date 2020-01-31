Rails.application.routes.draw do
  get 'delivery_verifications/new'

  get 'delivery_verifications/create'

    devise_for :partners,
                :controllers => {
                                    :registrations => "authentication/partners/registrations",
                                    :sessions => "authentication/partners/sessions" }
    devise_scope :partner do
        get '/partner/login', to: 'devise/sessions#new'
        get '/partner/register', to: 'devise/registrations#new'
        get '/password/settings', to: 'authentication/partners/registrations#edit'
        get '/partner/retrieve/password', to: 'devise/passwords#new'
    end
    authenticated :partner do
        root 'partners#bids', as: :authenticated_partner_root
    end

    devise_for :customers,
                :controllers => {
                                    :registrations => "authentication/customers/registrations",
                                    :sessions => "authentication/customers/sessions" }
    devise_scope :customer do
        get '/login', to: 'devise/sessions#new'
        get '/register', to: 'devise/registrations#new'
        get '/password/settings', to: 'authentication/customers/registrations#edit'
        get '/retrieve/password', to: 'devise/passwords#new'
    end
    authenticated :customer do
        root 'customers#dashboard', as: :authenticated_customer_root
    end
    
    resources :conversations, only: [:create, :show] do
        resources :messages, only: :create
    end
    resources :fit_pics, only: [:create]
    resources :flags, only: [:create]
    resources :delivery_verifications, only: :create
    resources :item_requests do
        resources :bids, only: [:new, :create, :index, :show, :edit, :update]
        
        get '/bid-submitted', to: 'item_requests#bid_submitted'
        post '/accept_bid', to: 'bids#accept'
        get '/confirmation', to: 'bids#confirmation'
    end
    
    
    get '/authenticate_partner_before_saving', to: 'item_requests#authenticate_partner_before_saving'
    get '/auth', to: 'pages#authentication'
    get '/report-listing', to: 'flags#new'
    get '/report-submitted', to: 'flags#report_submitted'
    get '/item_details', to: 'item_requests#new'
    get '/l/:uid', to: 'item_requests#find_by_uid'
    get '/browse', to: 'item_requests#index'
    get '/bid-history', to: 'bids#bid_history'
    get '/saved', to: 'item_requests#saved'
    get '/notifications', to: 'notifications#index'
    get '/next_steps', to: 'item_requests#next_steps'
    get '/request-history', to: 'item_requests#request_history'
    get '/filter_request_history', to: 'item_requests#filter_request_history'
    get '/track/:confirmation', to: 'bids#track'
    get '/delivery-verification', to: 'delivery_verifications#new'
    get '/delivery-verification/thank-you', to: 'delivery_verifications#thank_you'
    
    ## inbox access
    get '/inbox/:conversation_id', to: 'conversations#show'
    get '/inbox', to: 'conversations#inbox'
    get '/refresh_conversation', to: 'conversations#refresh_conversation'
    get '/mark_all_as_read', to: 'conversations#mark_all_as_read'
    
    get '/dashboard', to: 'partners#dashboard'
    get '/new-request', to: 'fit_pics#new'
    
    post '/save', to: 'item_requests#save'
    post '/initialize_conversation', to: 'conversations#initialize_conversation'
    post '/clear_all_notifications', to: 'notifications#clear_all'
    
    patch '/decline', to: 'bids#decline'
    
    root 'pages#index'
end
