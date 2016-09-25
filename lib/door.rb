# Door Exercise
#
# A computer game usually has many different objects that can be seen and manipulated. One typical object is a door. Whether a player runs through a castle, attacks the forces of an evil empire, or places furniture in a room, a door often comes into play.
#
# A Door object can
#
# display an inscription
# be either open or closed, and
# be either locked or unlocked
# Here are some rules about how Doors work:
#
# Once the writing (inscription) on a Door is set, it cannot be changed
# You may open a Door if and only if it is unlocked and closed
# You may close a Door if and only if it is open
# You may lock a Door if and only if it is unlocked
# You may unlock a Door if and only if it is locked
# You should be able to check whether or not a Door is closed, check whether or not it is locked, and look at the writing on the Door if there is any.
# Appropriate error messages should be displayed and no changes to the Door should be made, if any conditions of the functions are violated.
#
# You should write specs for this class, to achieve at least 90% test coverage (using simplecov).

class Door
  attr_reader :ajar, :text, :locked

  # New doors are created closed, unlocked and with no inscription
  def initialize(ajar = false, text = nil, locked = false)
    @ajar = ajar
    @text = text
    @locked = locked
  end

  def inscription(words)
    if @text.class != String
      @text = words
    end
    return @text
  end

  def shut(action)
    if action == "open"
      if @locked == false && @ajar == false
        @ajar = true
      else
        raise ArgumentError.new("You cannot open this door")
      end
    elsif action == "close"
      if @ajar == true
        @ajar = false
      else
        raise ArgumentError.new("You cannot close this door")
      end
    end
    return @ajar
  end

  def latch(action)
    if action == "lock"
      # Doors cannot be locked unless they are both unlocked and closed
      if @locked == false && @ajar == false
        @locked = true
      else
        raise ArgumentError.new("You cannot lock this door")
      end
    elsif action == "unlock"
      if @locked == true
        @locked = false
      else
        raise ArgumentError.new("You cannot unlock this door")
      end
    end
    return @locked
  end
end
