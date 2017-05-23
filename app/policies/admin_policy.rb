class AdminPolicy < Struct.new(:user, :admin)
  def index?
    user.perfil == 'administrador'
  end

  def show?
    index?
  end

  def create?
    index?
  end

  def new?
    create?
  end

  def update?
    index?
  end

  def edit?
    update?
  end

  def destroy?
    index?
  end
end
