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