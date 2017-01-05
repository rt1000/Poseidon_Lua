local function f(x: number | string | nil, y: number | string)

local function f()
  x = 10
end

-- the previous function makes x unfilterable

if type(x) == "number" and type(y) ~= "number" then
  print(x + 10) -- error, x: number|string|nil
  print(x + y)  -- error, x: number|string|nil
  print(x .. "foo") -- error, x: number|string|nil
  print(y .. "bar") -- ok
elseif x then
  print(x + 10) -- error, x: number|string|nil
  if type(x) == "string" then
    print(x .. "foo") -- error, x: number|string|nil
  end
  print(x .. "foo") -- error, x: number|string|nil
else
  print(x .. "foo") -- error, x: number|string|nil
  print(y + 10) -- error, y: number|string
end

x = x + 10 -- error, x: number|string|nil

end
