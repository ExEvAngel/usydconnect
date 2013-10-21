module StaticPagesHelper

  def author(u_id)
    user = User.where(id: u_id)
	by = user[0].username
  end

end
