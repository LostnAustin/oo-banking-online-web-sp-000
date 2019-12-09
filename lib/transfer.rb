class Transfer
  attr_accessor :transfer, :sender, :receiver, :status, :amount
  transfers =[]

  def initialize(sender, receiver, transfer)
    @sender = sender
    @receiver = receiver
    @transfer = transfer
    self.status = "pending"
    #self.amount = transfer
    #self.transfer = "amount"
    self.amount = transfer
#    binding.pry
  end
  #valid?
  #  calls on the sender and receiver's #valid? methods (FAILED - 1)
  def valid?
  #  binding.pry
  #  if (self.status == "pending") && (self.amount > 0)
  #    true
  #  elsif (self.status != "pending") || (self.amount = 0)
  #    false
  #  end
  if (receiver.valid? == true) && (sender.valid? == true)
      true
    end
  end

  def execute_transaction
  #binding.pry
  if (sender.valid? == false) || (sender.balance < transfer)
    self.status = "rejected"
    return  "Transaction rejected. Please check your account balance."
  elsif self.status == "complete"
     "Transaction already occurred."

  else (sender.valid? == true)
      sender.balance -= transfer
      receiver.balance += transfer
      self.status = "complete"
    end
end


  def reverse_transfer
    while self.status == "complete"

    receiver.balance -= transfer
    sender.balance += transfer
    self.status = "reversed"
    end
  end

end
