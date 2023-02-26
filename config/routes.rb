ActionController::Routing::Routes.draw do |map|

  map.root :controller => "frontend"
  
  map.connect '/ymere', :controller => "ymere_changes", :action => 'index'
	
	map.connect '/contact',      :controller => "contact_messages_frontend", :action => "new"
	map.connect '/contact/save', :controller => "contact_messages_frontend", :action => "create"
	
	map.connect '/tutorials',     :controller => "tutorials_frontend", :action => "index"
	map.connect '/tutorials/:id', :controller => "tutorials_frontend", :action => "show"

  map.connect '/news',     :controller => "news_items_frontend", :action => "index"
  map.connect '/news/:id', :controller => "news_items_frontend", :action => "show"
  
	map.connect '/backend',              :controller => 'backend', :action => 'index'
	map.connect '/backend/sign_in',      :controller => 'backend', :action => 'sign_in'
	map.connect '/backend/sign_out',     :controller => 'backend', :action => 'sign_out'
	map.connect '/backend/authenticate', :controller => 'backend', :action => 'authenticate'
	
	map.connect '/backend/contact_messages',             :controller => 'contact_messages_backend', :action => 'index'
	map.connect '/backend/contact_messages/:id/destroy', :controller => 'contact_messages_backend', :action => 'destroy'
	map.connect '/backend/contact_messages/:id',         :controller => 'contact_messages_backend', :action => 'show'
		
  map.connect '/backend/news_items',             :controller => 'news_items_backend', :action => 'index'
	map.connect '/backend/news_items/new',         :controller => 'news_items_backend', :action => 'new'
	map.connect '/backend/news_items/create',      :controller => 'news_items_backend', :action => 'create'
	map.connect '/backend/news_items/:id/destroy', :controller => 'news_items_backend', :action => 'destroy'
	map.connect '/backend/news_items/:id/edit',    :controller => 'news_items_backend', :action => 'edit'
	map.connect '/backend/news_items/:id/update',  :controller => 'news_items_backend', :action => 'update'
  
	map.connect '/backend/categories',             :controller => 'categories_backend', :action => 'index'
	map.connect '/backend/categories/new',         :controller => 'categories_backend', :action => 'new'
	map.connect '/backend/categories/create',      :controller => 'categories_backend', :action => 'create'
	map.connect '/backend/categories/:id/destroy', :controller => 'categories_backend', :action => 'destroy'
	map.connect '/backend/categories/:id/edit',    :controller => 'categories_backend', :action => 'edit'
	map.connect '/backend/categories/:id/update',  :controller => 'categories_backend', :action => 'update'
	
	map.connect '/backend/administrators',                     :controller => 'administrators_backend', :action => 'index'
	map.connect '/backend/administrators/new',                 :controller => 'administrators_backend', :action => 'new'
	map.connect '/backend/administrators/create',              :controller => 'administrators_backend', :action => 'create'
	map.connect '/backend/administrators/:id/destroy',         :controller => 'administrators_backend', :action => 'destroy'
	map.connect '/backend/administrators/:id/edit',            :controller => 'administrators_backend', :action => 'edit'
	map.connect '/backend/administrators/:id/update',          :controller => 'administrators_backend', :action => 'update'
	map.connect '/backend/administrators/:id/change_password', :controller => 'administrators_backend', :action => 'change_password'
	map.connect '/backend/administrators/:id/update_password', :controller => 'administrators_backend', :action => 'update_password'
	
	map.connect '/backend/tutorials',             :controller => 'tutorials_backend', :action => 'index'
	map.connect '/backend/tutorials/new',         :controller => 'tutorials_backend', :action => 'new'
	map.connect '/backend/tutorials/create',      :controller => 'tutorials_backend', :action => 'create'
	map.connect '/backend/tutorials/:id/update',  :controller => 'tutorials_backend', :action => 'update'
	map.connect '/backend/tutorials/:id/edit',    :controller => 'tutorials_backend', :action => 'edit'
	map.connect '/backend/tutorials/:id/destroy', :controller => 'tutorials_backend', :action => 'destroy'
	
end