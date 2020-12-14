Rails.application.routes.draw do
  root to: 'xml_or_xslt#input'
  get 'xml_or_xslt/input'
  get 'xml_or_xslt/view'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
