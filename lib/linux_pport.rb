# Copyright(c) 2010 Al Scott
# License details can be found in the LICENSE file.

module Pport

    # Class representing a parallel port on a linux operating system.
    #
    # Uses the file <i>/dev/port</i> to interact with the parallel port.
    class LinuxPport

        # Opens the file <i>/dev/port</i> for reading and writing.
        def initialize(address)

            @address = address
            @file = File.open('/dev/port', 'r+')
        end

        # Seeks the port's address and reads the value there.
        def read()
            @file.seek(@address)
            @file.getc
        end

        # Seeks the port's address and writes <i>val</i> to that location.
        def write(val)
            @file.seek(@address)
            @file.putc(val)
            @file.flush
        end
    end
end