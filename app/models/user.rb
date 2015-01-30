class User < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true
    has_secure_password
    after_destroy :ensure_root_remains

    def ensure_root_remains
      if self.name == 'root'
        raise "Can't delete root user"
      end
    end
end
