local discordia = require('discordia')
local client = discordia.Client()

local function cehavl_word(word)
    local word_table = {}
    _ = word:gsub(".",function(c) table.insert(word_table,c) end)
    for k = 1, #word_table-1 do
        if (math.random() > 0.5) then
            local c1 = word_table[k]
            local c2 = word_table[k+1]
            word_table[k] = c2
            word_table[k+1] = c1
        end
    end
    for k = #word_table-1, 2, -1 do
        if (math.random() > 0.8) then
            local c1 = word_table[k]
            local c2 = word_table[k-1]
            word_table[k] = c2
            word_table[k-1] = c1
        end
    end
    local result = ""
    for k = 1, #word_table, 1 do
        result = result..word_table[k]
    end
    return result
end

local function cri(message)
  local prefix = {"cri", "cry", "Cri", "Cry", "CRI", "CRY", "kri", "kry", "Kri", "Kry", "KRI", "KRY"}
  local j = nil
  for k=1, #prefix do
    local _, new_j = string.find(message, prefix[k])
    if new_j then
      if j then
        if new_j < j then
          j = new_j
        end
      else
        j = new_j
      end
    end
  end
  if j then
    return string.upper(string.sub(message, j + 1, #message))
  else
    return nil
  end
end

local function di(message)
  local message_cri = cri(message)
  if (message_cri) then
    return message_cri
  end
  local prefix = {"di", "dy", "d i", "d y", "dhi", "dhy", "Di", "Dy", "DI", "DY"}
  local j = nil
  for k=1, #prefix do
    local _, new_j = string.find(message, prefix[k])
    if new_j then
      if j then
        if new_j < j then
          j = new_j
        end
      else
        j = new_j
      end
    end
  end
  if j then
    return string.sub(message, j + 1, #message)
  else
    return nil
  end
end

client:on('ready', function()
	print('Logged in as '.. client.user.username)
end)

client:on('messageCreate', function(message)
  print(message.content)
  local i, _ = string.find(message.content, "!c")
  if (i == 1) then
    message.channel:send(cehavl_word(string.sub(message.content, 4, #message.content)))
    return
  end
  local response = di(message.content)
  if response and (response ~= '') and (math.random() < 0.5) then
		-- message.channel:send('<@'..message.author.id..'> '..response)
		message.channel:send(response)
	end
end)

client:run('Bot ***REMOVED***')
