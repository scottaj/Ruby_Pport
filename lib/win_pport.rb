# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Class for interacting with a parallel port in microsoft windows using the
# inpout32 DLL.
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