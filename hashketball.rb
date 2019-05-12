 require "pry"
 
 def game_hash  
     {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {"Alan Anderson" => {:number => 0,                                                              :shoe => 16,
                                       :points => 22,
                                       :rebounds => 12,
                                       :assists => 12,
                                       :steals => 3,
                                       :blocks => 1,
                                       :slam_dunks => 1 
                   },
                   "Reggie Evans" => {:number => 30,
                                      :shoe => 14,
                                      :points => 12,
                                      :rebounds => 12,
                                      :assists => 12,
                                      :steals => 12,
                                      :blocks => 12,
                                      :slam_dunks => 7
                   },
                   "Brook Lopez" => {:number => 11,
                                     :shoe => 17,
                                     :points => 17,
                                     :rebounds => 19,
                                     :assists => 10,
                                     :steals => 3,
                                     :blocks => 1,
                                     :slam_dunks => 15
                   },
                   "Mason Plumlee" => {:number => 1,
                                       :shoe => 19,
                                       :points => 26,
                                       :rebounds => 12,
                                       :assists => 6,
                                       :steals => 3,
                                       :blocks => 8,
                                       :slam_dunks => 5 
                   },
                   "Jason Terry" => {:number => 31,
                                     :shoe => 15,
                                     :points => 19,
                                     :rebounds => 2,
                                     :assists => 2,
                                     :steals => 4,
                                     :blocks => 11,
                                     :slam_dunks => 1
                   }
      }
  },
    :away => {
      :team_name => "Charlotte Hornets ",
      :colors => ["Turquoise", "Purple"],
      :players => {"Jeff Adrien" => {:number => 4,
                                     :shoe => 18,
                                     :points => 10,
                                     :rebounds => 1,
                                     :assists => 1,
                                     :steals => 2,
                                     :blocks => 7,
                                     :slam_dunks => 2
                   },
                   "Bismak Biyombo" => {:number => 0,
                                        :shoe => 16,
                                        :points => 12,
                                        :rebounds => 4,
                                        :assists => 7,
                                        :steals => 7,
                                        :blocks => 15,
                                        :slam_dunks => 10
                   },
                   "DeSagna Diop" => {:number => 2,
                                      :shoe => 14,
                                      :points => 24,
                                      :rebounds => 12,
                                      :assists => 12,
                                      :steals => 4,
                                      :blocks => 5,
                                      :slam_dunks => 5
                   },
                   "Ben Gordon" => {:number => 8,
                                    :shoe => 15,
                                    :points => 33,
                                    :rebounds => 3,
                                    :assists => 2,
                                    :steals => 1,
                                    :blocks => 1,
                                    :slam_dunks => 0
                   },
                   "Brendan Haywood" => {:number => 33,
                                         :shoe => 15,
                                         :points => 6,
                                         :rebounds => 12,
                                         :assists => 12,
                                         :steals => 22,
                                         :blocks => 5,
                                         :slam_dunks => 12
                   }
        }
     }
   }
 
 end


def num_points_scored(name)
  game_hash.each do |location, info| 
    info.each do |attribute, data| 
      if data.include?(name) 
       return game_hash[location][attribute][name][:points]
      end
    end
  end
end


def shoe_size(size)
  game_hash.each do |location, info|
    info.each do |attribute, data|
      if data.include?(size)
        return game_hash[location][attribute][size][:shoe]
      end
    end
  end
end


# def team_colors(team_name)
#   array = []
#   game_hash.each do |location, attributes|
#     if game_hash[location].values.include?(team_name)
#       attributes.each do |attribute, info|
#         if attribute == :colors
#           return info
#         end
#       end
#     end
#   end
# end
# def team_colors(team)
#   new_array = []
#   game_hash.each do |keys, values|
#     values.each do |data_labels, data|
#       if data == team
#         new_array << game_hash[keys][:colors]
#       end
#     end
#   end
#   new_array.flatten
# end
# def team_colors (team_name)
#     colors = nil
#     game_hash.each do |team, team_details_hash|
#         if team_details_hash[:name] == team_name
#             colors = team_details_hash[:colors].flatten
#         end
#     end
#     colors
# end


# def team_names
#   array = []
#   game_hash.each do |location, attributes|
#     attributes.each do |attribute, info|
#       if attribute == :team_name
#         array << info
#       end
#     end
#   end
#   return array
# end
def team_names
  game_hash.map do |team, team_details_hash|
    team_details_hash[:name] 
  end
end

# def player_numbers(team_name)
#   array = []
#   game_hash.each do |location, attributes|
#     if game_hash[location].values.include?(team_name)
#       attributes.each do |attribute, info|
#         if info.class == game_hash
#           info.each do |player, stats|
#             stats.each do |stat, int|
#               if stat == :number
#                 array << int.to_i
#               end
#             end
#           end
#         end
#       end
#     end
#   end
#   return array
# end
def player_numbers (team_name)
  player_numbers_list = []
  game_hash.each do |team, team_details_hash|
    if team_details_hash[:name] == team_name
      team_details_hash[:players].each do |player|
        player.each do |key, value|
          if key == :number 
            player_numbers_list << value
          end
        end
      end
    end
  end
  player_numbers_list
end

def player_stats(name)
  game_hash.each do |location, attributes| 
    attributes.each do |attribute, info| 
      if info.include?(name) 
       return game_hash[location][attribute][name]
      end
    end
  end
end


def big_shoe_rebounds
  player_name = ""
  shoe_size = 0
  game_hash.each do |location, attributes|
    attributes.each do |attribute, info|
      if info.class == Hash
        info.each do |player, stats|
            stats.each do |stat, int|
              if stat == :shoe
                if int > shoe_size
                  shoe_size = int
                  player_name = player
                end
              end
            end
          end
        return game_hash[location][attribute][player_name][:rebounds]
      end
    end
  end
end

