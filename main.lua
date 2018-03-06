-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Created By Gillian Gonzales
-- Created On Feb 27 2018
--
-- This program will show the cost of pizza by how many inches there are.
-----------------------------------------------------------------------------------------

-- Making varibles 
local inches
local price
local labour
local rent
local HST
local materials
local taxes
local Subtotal


-- Changing Background Colour
display.setDefault( "background", 1, 1, 1 )

-- Displaying Textfield
local inchesOfPizza = native.newTextField( display.contentCenterX, display.contentCenterY, 450, 125 )
inchesOfPizza.id = "The Inches of Pizza"

-- Adding Text 
local Instructions = display.newText( "Type the diameter of the pizza", 1024, 625, native.systemFont, 75 )
Instructions:setFillColor( 0, 0, 0 )
Instructions.id = " Instructions"

local inchesText = display.newText( "Inches", 1400, 768, native.systemFont, 75 )
inchesText:setFillColor( 0, 0, 0 )
inchesText.id = "Inches for Pizza"

local subtotalText = display.newText("Subtotal is", 500, 950, native.systemFont, 75)
subtotalText:setFillColor( 0, 0, 0 )
subtotalText.id = "Price before taxes"

local taxesText = display.newText("The tax is", 1500, 950, native.systemFont, 75)
taxesText:setFillColor( 0, 0, 0 )
taxesText.id = "Taxes"

local pirceText = display.newText("Your total cost is", 1024, 1200, native.systemFont, 75 )
pirceText:setFillColor( 0, 0, 0 )
pirceText.id = "Total Price"

-- Adding Function to button
local PriceButton = display.newImageRect("./Assets/sprites/Button.png", 406, 157 )
PriceButton.x = display.contentCenterX + 700
PriceButton.y = display.contentCenterY
PriceButton.id = "Button"

-- Making Function for button
local function priceButtonTouch( event )
	-- This function will calculate the price of the pizza 
	inches = inchesOfPizza.text
	labour = 0.75
	rent = 1
	materials = 0.5
	taxes = 0.13
	HST = (rent + labour + materials*inches)*taxes
	Subtotal = (rent + labour + materials*inches)
	price = HST + rent + labour + materials*inches
	-- print totalPrice
	pirceText.text = "Your total cost is ".. price .. "$"
	subtotalText.text = "Subtotal is ".. Subtotal .. "$"
	taxesText.text = "The tax is " .. HST .. "$"


	return true
end

PriceButton:addEventListener( "touch", priceButtonTouch)

