require 'digest/sha1'

class PasswordHasher

  def self.hash(password)
    Digest::SHA1.hexdigest password
  end

end
