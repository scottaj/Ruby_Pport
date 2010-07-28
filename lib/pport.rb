# Copyright(c) 2010 Al Scott
# License details can be found in the LICENSE file.

require 'win_pport'
require 'linux_pport'

module Pport

    # Class representing a generic parallel port, calls the platform appropriate
    # class to actually interact with the port.
    class GenPport

        # Creates a platform appropriate parallel port object.
        def initialize(address)

            @port = nil

            if RUBY_PLATFORM.match(/linux/i)
                @port = LinuxPport.new(address)
            elsif RUBY_PLATFORM.match(/mingw/i) or RUBY_PLATFORM.match(/mswin/i)
                @port = WinPport.new(address)
            end
        end

        # Reads the value of the port.
        def read()
            return @port.read
        end

        # Writes a value to the port.
        #
        # The value must be an integer from 0 to 255.
        # Invalid values will raise a RuntimeError.
        def write(val)
            val = val.to_i
            raise if val > 255 or val < 0
            @port.write(val)
        end

        def to_s
            return @address
        end
    end
end