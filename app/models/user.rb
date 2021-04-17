class User < ApplicationRecord
  validates_presence_of :uid
  validates_presence_of :token
end
