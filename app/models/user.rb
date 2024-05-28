class User < ApplicationRecord
  def to_json
    {id: id, email: email, username: username}
  end
end
