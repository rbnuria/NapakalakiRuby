# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require "singleton"


module Model
class Dice

include Singleton

  def nextNumber
    return 1 + rand(6)
  end
end
end