class Sale < ActiveRecord::Base
    belongs_to :ratgrade
    belongs_to :user
    belongs_to :customer
    belongs_to :warehouse
    belongs_to :board
    
    after_create :push_create
    before_save :bad_sale
    validates_presence_of :ratgrade, :on => :create, :message => "can't be blank"
    validates_presence_of :amount, :on => :create, :message => "can't be blank"
    validates_presence_of :user, :on => :create, :message => "can't be blank"
    validates_presence_of :customer, :on => :create, :message => "can't be blank"
    validates_presence_of :warehouse, :on => :create, :message => "can't be blank"
    validates_presence_of :board, :on => :create, :message => "can't be blank"
    
    
    scope :printed, where("printed=?", true)
    scope :unprinted, where("printed=?", false)
    
    
    
    
    def bad_sale
      ratgrade = self.ratgrade
      if self.amount > ratgrade.availableamt
        self.oversale = true
      end
    end

    protected

    def push_create
    	push_event('create')
    end



    def push_event(event_type)
    Pusher["BBRatboard-#{Rails.env}"].trigger(event_type, 
                                   {:amount => self.amount, 
                                    :price=>self.price,
                                    :user_login => self.user.login,
                                    :customer=>self.customer.name,
                                    :ratgrade=>self.ratgrade.name,
                                    :average=>self.ratgrade.average_price
                                    
                                    
                                    
                                    })
    end

end
