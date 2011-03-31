#
# columndefinition.rb
#

module Turntable

  # A Turntable::ColumnDefinition consists of a name, its position within a
  # Turntable::TableHeader, and, optionally, its associated type. 
  #
  # ColumnDefinitions are meant to be created and manipulated by a TableHeader.
  # ColumnDefinition and its methods are not intended to be used directly by the
  # end user.
  #
  class ColumnDefinition

    include Comparable

    # A ColumnDefinition is ``less than'' another if its position is smaller.
    # Likewise, a ColumnDefinition is ``greater than'' another if its position
    # is greater.
    #
    def <=>(another)
      (self.position > another.position) ? (1) : (-1)
    end

    attr_accessor :name
    attr_reader :position, :type

    # Creates a new ColumnDefinition. This method should not be used directly.
    # Instead, create a new Turntable::TableHeader.
    #
    def initialize(name, position, type=nil)
      @name     = name
      @position = position
      @type     = type
    end
  end

end
