module PagesHelper
  class Block
    cattr_accessor :letter
    def initialize(id, letter)
      @block_id = id
      @block_letter = letter
    end
    def alphabet
      puts "MOVE THESE"
    end
  end

  block1 = Block.new("1", "M")
  puts block1
  @block = block1

  def sortable_blocks_helper
    "MOVE THESE BLOCKS AROUND TO SEND ME A MESSAGE.".scan /\w/
  end

  def color_randomizer
    colour = "%06x" % (rand * 0xffffff)
  end

end
