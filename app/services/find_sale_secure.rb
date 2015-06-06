class FindSaleSecure

  def initialize(hasher)
    @hasher = hasher
  end

  def find(id, password)
    Sale.where(id: id, hashed_password: @hasher.hash(password)).first
  end

end
