class Bill < ApplicationRecord

  def paid?
    paid_date.present? && paid_amount == due_amount
  end

  def due_amount
    (self[:due_amount].to_f / 100.0).round(2)
  end

  def paid_amount
    (self[:paid_amount].to_f / 100.0).round(2)
  end

end
