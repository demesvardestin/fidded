module ResourceUtils
    module RandomToken
        def self.random(len=28, character_set = ["A".."Z", "a".."z", "0".."9"])
            chars = character_set.map{|x| x.is_a?(Range) ? x.to_a : x }.flatten
            Array.new(len){ chars.sample }.join
        end
    end
    
    module Profile
        def url_name
            [first_name, last_name, id].join('-')
        end
        
        def location_snapshot
            [town, state].join(', ')
        end
    end
end