-- PRINT ARG SIZE :

print("===================================")

print("ARG SIZE: " .. #arg)

print("===================================")




-- PRINT ARG:

print( "ARG:" )

for key, value in pairs(arg) do
   if (type(value) == "string" or type(value) == "number" ) then
      print( key .. " : " .. value )
   else
      print( key .. " : " .. "--" )
   end
end




-- CALCULATE SUM:

structIndex = arg[1]

sum = 0

for i = 2, #arg do
   sum = sum + tonumber(arg[i])   
end



-- PRINT SUM:

print("===================================")

print("SUM : " .. sum)

print("===================================")
