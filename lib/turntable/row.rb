#
# row.rb
#

require 'turntable/tableheader'

module Turntable

  # A Turntable::Row represents one row in a Turntable::Table, according to the
  # table's Turntable::TableHeader.
  #
  class Row

    include Comparable

    # A Row is ``less than'' another if its position is smaller. Likewise, a Row
    # is ``greater than'' another if its position is larger.
    #
    def <=>(another)
      (self.position > another.position) ? (1) : (-1)
    end

    attr_reader :data, :position

    # This method is not meant to be used directly. Refer to Turntable::Table.
    #
    def initialize(header, position, data_array)
      @header   = header  # FIXME This makes IRB really ugly
      @position = position
      @data     = data_array
    end

    # Returns the data found at a specific column.
    # TODO @data should have this close by...
    #
    def [](column_name)
      i = @header.detect { |column| column.name == column_name }.position
      @data[i]
    end

  end
end
