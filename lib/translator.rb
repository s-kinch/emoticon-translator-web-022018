require "yaml"

# {
#   "angel"=>["O:)", "☜(⌒▽⌒)☞"],
#   "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
#   "bored"=>[":O", "(ΘεΘ;)"],
#   "confused"=>["%)", "(゜.゜)"]
# }

def load_library(path)
  library = YAML.load_file(path)

  result = {
    "get_emoticon"=> {},
    "get_meaning"=> {}
  }

  library.each do |english, emoticons|
    result["get_emoticon"][emoticons[0]] = emoticons[1]
    result["get_meaning"][emoticons[1]] = english
  end

  result
end

def get_japanese_emoticon(path, emoticon)
  load_library(path)["get_emoticon"][emoticon] ||= "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  load_library(path)["get_meaning"][emoticon] ||= "Sorry, that emoticon was not found"
end
