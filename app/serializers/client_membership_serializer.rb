class ClientMembershipSerializer < ActiveModel::Serializer
  attributes :total_amount_for_all_membership

  def total_amount_for_all_membership
    byebug
    "#{object.memberships.pluck(:charge).sum}"
  end

end
