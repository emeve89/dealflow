class ValuationFormObject
  include Virtus.model
  include ActiveModel::Model

  attribute :description,       String
  attribute :quantity,          Integer
  attribute :part_ids,          Integer

  validates :description, :quantity, :part_ids, presence: true

  def persisted?; false; end

  def save
    valid? ? persist! : false
  end

private

  def persist!
    valuation.valuation_lines << new_valuation_line
  end

  def new_valuation_line
    ValuationLine.new(part_id: part_ids, quantity: quantity)
  end

  def valuation
    @valuation ||= Valuation.create(description: description)
  end

end