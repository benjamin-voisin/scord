local discordia = require('discordia')
local client = discordia.Client()

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
  local response = di(message.content)
  if response and (response ~= '') and (math.random() < 0.5) then
		-- message.channel:send('<@'..message.author.id..'> '..response)
		message.channel:send(response)
	end
end)

client:run('Bot ***REMOVED***')
