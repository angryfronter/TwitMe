require 'rails_helper'

RSpec.describe 'Routes', type: :routing do

  it 'routes to sessions#new' do
    expect(get: '/session/new').to route_to('sessions#new')
  end

  it 'routes to sessions#create' do
    expect(post: '/session').to route_to('sessions#create')
  end

  it 'routes to sessions#destroy' do
    expect(delete: '/session').to route_to('sessions#destroy')
  end

  it 'routes to users#new' do
    expect(get: '/users/new').to route_to('users#new')
  end

  it 'routes to users#create' do
    expect(post: '/users').to route_to('users#create')
  end

  it 'routes to users#edit' do
    expect(get: '/users/1/edit').to route_to('users#edit', id: '1')
  end

  it 'routes to users#update' do
    expect(put: '/users/1').to route_to('users#update', id: '1')
    expect(patch: '/users/1').to route_to('users#update', id: '1')
  end

  it 'routes to users#show' do
    expect(get: '/users/1').to route_to('users#show', id: '1')
  end

  it 'routes to advertisements#index' do
    expect(get: '/advertisements').to route_to('advertisements#index')
  end

  it 'routes to advertisements#show' do
    expect(get: '/advertisements/1').to route_to('advertisements#show', id: '1')
  end

  it 'routes to advertisements#new' do
    expect(get: '/advertisements/new').to route_to('advertisements#new')
  end

  it 'routes to advertisements#create' do
    expect(post: '/advertisements').to route_to('advertisements#create')
  end

  it 'routes to advertisements#edit' do
    expect(get: '/advertisements/1/edit').to route_to('advertisements#edit', id: '1')
  end

  it 'routes to advertisements#update' do
    expect(put: '/advertisements/1').to route_to('advertisements#update', id: '1')
    expect(patch: '/advertisements/1').to route_to('advertisements#update', id: '1')
  end

  it 'routes to advertisements#destroy' do
    expect(delete: '/advertisements/1').to route_to('advertisements#destroy', id: '1')
  end

  it 'routes to advertisements/comments#create' do
    expect(post: '/advertisements/1/comments').to route_to('comments#create', advertisement_id: '1')
  end

  it 'routes to advertisements/comments#edit' do
    expect(get: '/advertisements/1/comments/2/edit').to route_to('comments#edit', advertisement_id: '1', id: '2')
  end

  it 'routes to password_resets#new' do
    expect(get: '/password_reset/new').to route_to('password_resets#new')
  end

  it 'routes to password_resets#edit' do
    expect(get: '/password_reset/edit').to route_to('password_resets#edit')
  end

  it 'routes to password_resets#update' do
    expect(put: '/password_reset').to route_to('password_resets#update')
    expect(patch: '/password_reset').to route_to('password_resets#update')
  end

  it 'routes to all_users' do
    expect(get: '/all_users').to route_to('users#all_users')
  end

  it 'routes to admin/users#index' do
    expect(get: '/admin/users').to route_to('admin/users#index')
  end

  it 'routes to admin/users#create' do
    expect(post: '/admin/users').to route_to('admin/users#create')
  end

  it 'routes to admin/users#edit' do
    expect(get: '/admin/users/1/edit').to route_to('admin/users#edit', id: '1')
  end

  it 'routes to admin/users#update' do
    expect(put: '/admin/users/1').to route_to('admin/users#update', id: '1')
    expect(patch: '/admin/users/1').to route_to('admin/users#update', id: '1')
  end

  it 'routes to admin/users#destroy' do
    expect(delete: '/admin/users/1').to route_to('admin/users#destroy', id: '1')
  end

  it 'routes to root' do
    expect(get: '/').to route_to('pages#index')
  end
end
