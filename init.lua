led = 1
state = gpio.LOW

for i = 1, 5 do
   gpio.mode(i, gpio.OUTPUT)
end



t = tmr.create()
t:register(1500, tmr.ALARM_AUTO, function() executa() end)
t:start()


function executa()
    gpio.write(led, state)
    print("Led "..led.." "..state)
    led = led + 1
    if led > 5 then
        led = 1
        if state == gpio.LOW then
            state = gpio.HIGH
        elseif state == gpio.HIGH then
            state = gpio.LOW
        end
    end
end

