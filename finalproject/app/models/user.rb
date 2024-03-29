class User < ActiveRecord::Base
  has_many :breaches
  has_many :targets, :through => :breaches
  has_many :inverse_breaches, :class_name => "Breaches", :foreign_key => "target_id"
  has_many :inverse_targets, :through => :inverse_breaches, :source => :user

  has_many :operatives

  has_secure_password
  validates_confirmation_of :password
  validates :name, uniqueness: true

  validates :firewall, numericality: { :greater_than_or_equal_to => 0 }
  validates :zeroday, numericality: { :greater_than_or_equal_to => 0 }
  validates :honeypot, numericality: { :greater_than_or_equal_to => 0 }
  validates :o_contract, numericality: { :greater_than_or_equal_to => 0 }

  def check_for_breaches
    breaches_by_user = Breach.where(user_id: self.id)

    breaches_by_user.each do |breach|
      #check for new breaches where payout is true
      if breach.reward_collected != true && breach.breached != false
        breacher = User.find(breach.user_id) 
        cash_taken = User.find(breach.target_id).cash - breach.cash_stolen
        cash_earned = breacher.cash + breach.cash_stolen

        #transact cash
        User.find(breach.target_id).update(cash: cash_taken)
        breacher.update(cash: cash_earned)

        #flag this breach as paid out
        update_zeroday = breacher.zeroday - 1
        breacher.update(zeroday: update_zeroday)
        breach.update(reward_collected: true)
      end
    end
    #find where cur_user was target of breaches
=begin
    breaches_by_enemies = Breach.where(target_id: self.id)
  
    breaches_by_enemies.each do |breach|
      #check for new breaches where payout is true
      if breach.reward_collected != true && breach.breached != false
        enemy_breacher = User.find(breach.user_id) 
        cash_taken = User.find(breach.target_id).cash - breach.cash_stolen
        cash_earned = enemy_breacher.cash + breach.cash_stolen

        #transact cash
        self.update(cash: cash_taken)
        enemy_breacher.update(cash: cash_earned)

        #flag this breach as paid out
        enemy_breacher.update(zeroday: update_zeroday)
        breach.update(reward_collected: true)
      end
    end
=end
  end

  end
