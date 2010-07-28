# Copyright(c) 2010 Al Scott
# License details can be found in the LICENSE file.

begin
    require 'Win32API'
rescue LoadError
end

module Pport

    # Class for interacting with a parallel port in microsoft windows using the
    # inpout32 DLL.
    class WinPport

        # Creates a reader and a write function from the inpout32 library.
        def initialize(address)

            @address = address
            @reader = Win32API.new('inpout32', 'Inp32', ['i'], 'i')
            @writer = Win32API.new('inpout32', 'Out32', ['i', 'i'], 'v')
        end

        # Reads the value of the port at <em>address</em>.
        def read()
            return @reader.call(@address)
        end

        # Writes the value <em>val</em> to the port at <em>address</em>
        #
        # <em>val</em>: The value to be written, on a standard parallel port it
        # should be an integer from 0 to 255
        def write(val)
            @writer.call(@address, val)
        end
    end
end