module PagesHelper

  def sortable_blocks_helper
    "MOVE THESE BLOCKS AROUND".scan /\w/
    # color = ""
  end

  def card_body_helper
    randomColor()
  end

end
