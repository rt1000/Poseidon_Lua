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


-- MALLOC:

print("\n**** MALLOC: ****\n")

local z = 0

print( "========== z : ==========" )
print( "z = CS_malloc(4)" )
z = CS_malloc(4)
print( "CS_storeInt(z,0,104)" )
CS_storeInt(z,0,104)
print( "=========================" )

print( "-------------------------" )
print( "--> CS_loadInt(z,0) == " .. CS_loadInt(z,0) )
print( "--> CS_loadInt(z,4) == " .. CS_loadInt(z,4) )

print( "\n--> type(CS_loadInt(z,8)): " .. type(CS_loadInt(z,8)) )
print( "--> type(z): " .. type(z) )
print( "-------------------------\n" )

local x, y

print( "========== x : ==========" )
print( "x = CS_malloc( 100 )" )
x = CS_malloc( 100 )
print( "CS_storeInt( x, 0, 120 )" )
CS_storeInt( x, 0, 120 )
print( "CS_storeDouble( x, 10, 45.70 )" )
CS_storeDouble( x, 10, 45.70 )
print( "CS_storeBool( x, 30, false )" )
CS_storeBool( x, 30, false )
print( "CS_storeNull( x, 50 )" )
CS_storeNull( x, 50 )
print( "=========================" )

print( "-------------------------" )
print( "--> CS_loadInt( x, 0 ) == " .. CS_loadInt( x, 0 ) )
print( "--> CS_loadDouble( x, 10 ) == " .. CS_loadDouble( x, 10 ) )
print( "--> CS_loadBool( x, 30 ) == " .. tostring(CS_loadBool( x, 30 )) )
print( "-------------------------\n" )


print( "========== y : ==========" )
print( "y = CS_malloc( 100 )" )
y = CS_malloc( 100 )
print( "CS_storeInt( y, 0, 180 )" )
CS_storeInt( y, 0, 180 )
print( "CS_storeDouble( y, 10, 34.30 )" )
CS_storeDouble( y, 10, 34.30 )
print( "CS_storeBool( y, 30, true )" )
CS_storeBool( y, 30, true )
print( "CS_storeNull( y, 50 )" )
CS_storeNull( y, 50 )
print( "=========================" )

print( "-------------------------" )
print( "--> CS_loadInt( y, 0 ) == " .. CS_loadInt( y, 0 ) )
print( "--> CS_loadDouble( y, 10 ) == " .. CS_loadDouble( y, 10 ) )
print( "--> CS_loadBool( y, 30 ) == " .. tostring(CS_loadBool( y, 30 )) )
print( "-------------------------\n" )


print( "========== x + y : ======" )
print( "CS_storeInt( x, 0, (CS_loadInt( x, 0 ) + CS_loadInt( y, 0 )) )" )
CS_storeInt( x, 0, (CS_loadInt( x, 0 ) + CS_loadInt( y, 0 )) )
print( "CS_storeDouble( x, 10, (CS_loadDouble( x, 10 ) + CS_loadDouble( y, 10 )) )" )
CS_storeDouble( x, 10, (CS_loadDouble( x, 10 ) + CS_loadDouble( y, 10 )) )
print( "CS_storeBool( x, 30, (CS_loadBool( x, 30 ) or CS_loadBool( y, 30 )) )" )
CS_storeBool( x, 30, (CS_loadBool( x, 30 ) or CS_loadBool( y, 30 )) )
print( "CS_storePointer( x, 60, y )" )
CS_storePointer( x, 60, y )
print( "=========================" )

print( "-------------------------" )
print( "--> CS_loadInt( x, 0 ) == " .. CS_loadInt( x, 0 ) )
print( "--> CS_loadDouble( x, 10 ) == " .. CS_loadDouble( x, 10 ) )
print( "--> CS_loadBool( x, 30 ) == " .. tostring(CS_loadBool( x, 30 )) )
print( "--> CS_loadInt( CS_loadPointer( x, 60 ), 0 ) == " .. CS_loadInt( CS_loadPointer( x, 60 ), 0 )  )
print( "-------------------------\n" )

print( "====== free : x, y ======" )
print( "CS_free( x )" )
CS_free( x )
print( "CS_free( y )" )
CS_free( y )
print( "=========================" )

print( "-------------------------" )
print( "--> CS_loadInt( x, 0 ) == " .. CS_loadInt( x, 0 ) )
print( "--> CS_loadInt( y, 0 ) == " .. CS_loadInt( y, 0 ) )
print( "-------------------------\n" )

print("********** done **********")
