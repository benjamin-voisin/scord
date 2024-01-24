local discordia = require('discordia')
local client = discordia.Client()

local function di(message)
  local prefix = {"di", "dy", "d i", "d y", "dhi", "dhy"}
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
  if response and (response ~= '') then
		-- message.channel:send('<@'..message.author.id..'> '..response)
		message.channel:send(response)
	end
end)

client:run('Bot ***REMOVED***')
