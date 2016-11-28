module DevTools
  module Utils
    def self.die(message)
      puts message
      exit 1
    end

    def self.yon(bool)
      bool ? "Yes" : "No"
    end
  end
end
