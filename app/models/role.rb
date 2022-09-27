class Role <ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map { |audition| audition.actor }
    end

    def locations
        self.auditions.map { |audition| audition.location }
    end

    def lead
       l = self.auditions.find { |audition| audition.hired == true }
       if l == nil
            return 'no actor has been hired for this role'
       else
            return l
       end
    end

    def understudy
        u = self.auditions.filter do |audition| 
            audition.hired == true
        end.second
        # or
        # u = self.auditions.filter { |audition| audition.hired == true }.second
        if u == nil
            return 'no actor has been hired for understudy for this role'
        else
            return u
        end
    end

end