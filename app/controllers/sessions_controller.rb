class SessionsController < DeviseTokenAuth::SessionsController
  def render_create_success
    render json: {data: {user: @resource, adress: Adress.find_by(id: @resource.adress_id) }, status: 'success'}
  end
end
