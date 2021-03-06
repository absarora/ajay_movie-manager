class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
    user.present?
  end

  def new?
    create?
  end

  def update?
    false
    user.present? && record.user == user
  end

  def edit?
    update?
  end

  def destroy?
    false
    update?
  end

  def scope
    record.class
  end
end

