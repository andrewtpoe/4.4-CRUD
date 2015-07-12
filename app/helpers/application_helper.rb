module ApplicationHelper

  def row_or_alt_row(i)
    if i % 2 == 0
      return "albums__tableRow"
    else
      return "albums__tableRowAlt"
    end
  end

end
