class ValuationFormObject
  include Virtus.model
  include ActiveModel::Model

  attribute :description,       String
  attribute :quantity,          Array
  attribute :part_ids,          Array

  validates :description, :quantity, :part_ids, presence: true

  def persisted?; false; end

  def save
    valid? ? persist! : false
  end

private

  def persist!
    part_ids.zip(quantity).to_h.map do |k, v|
      valuation.valuation_lines << new_valuation_line(k, v)
    end
  end

  def new_valuation_line(part_id, quantity)
    ValuationLine.new(part_id: part_id, quantity: quantity)
  end

  def valuation
    @valuation ||= Valuation.create(description: description)
  end

end