-- Подключение библиотек LVGL и dataman
local lvgl = require("lvgl")
local dataman = require("dataman")

-- Загрузка дополнительных модулей
require "image"
require "root"

-- Функция для определения позиций элементов на экране
local function getItemsPosition()
    
	local imgPosition = {
		background = { 265, 318 },  -- Позиция фонового изображения
                img0 = { 30, 60 },       -- Позиция изображения 1
                img1 = { 40, 70 },       -- Позиция изображения 2
		img2 = { 50, 80 },       -- Позиция изображения 3
		img3 = { 60, 90 },       -- Позиция изображения 4
		img4 = { 70, 100 },       -- Позиция изображения 5
		img5 = { 80, 110 },       -- Позиция изображения 6
		img6 = { 90, 120 },       -- Позиция изображения 7
		img7 = { 100, 130 },       -- Позиция изображения 8
		img8 = { 110, 140 },       -- Позиция изображения 9
    }

    return imgPosition
end

local animIndex = 1  -- Индекс текущей анимации

-- Функция инициализации часов
local function entry()
    local root = createRoot()  -- Создание корневого элемента интерфейса
	
	local watchface = {}  -- Создание таблицы для хранения элементов часов
	
    -- Задание позиции фонового изображения
	local pos = getItemsPosition()
	watchface.background = Image(root, "img_01.png", pos.background)
	
   
	
	animIndex = 1  -- Начальное значение индекса анимации
        watchface.img = Image(root, "img00.png", pos.img0)

	
    -- Назначение обработчика события нажатия на фоновое изображение
    -- для смены режима анимации
    watchface.background.widget:add_flag(lvgl.FLAG.CLICKABLE)
    watchface.background.widget:onevent(lvgl.EVENT.PRESSED, function(obj, code)

		animIndex = animIndex + 1  -- Увеличение индекса анимации
   -- Условия для выбора изображения в зависимости от индекса анимации
		if animIndex == 1 then
                        
			watchface.img = Image(root, "img00.png", pos.img0)
                        		end


			watchface.img0 = Image(root, "img01.png", pos.img1)
                        
		end
		if animIndex == 3 then


			watchface.img =  Image(root, "img02.png", pos.img2)
                        
		end
		if animIndex == 4 then


			watchface.img =  Image(root, "img03.png", pos.img3)
                        
		end
		if animIndex == 5 then


			watchface.img =  Image(root, "img04.png", pos.img4)
                       
		end
		if animIndex == 6 then


			watchface.img =  Image(root, "img05.png", pos.img5)
		        
                end	
		if animIndex == 7 then


			watchface.img =  Image(root, "img06.png", pos.img6)
                       
		end
		if animIndex == 8 then


			watchface.img =  Image(root, "img07.png", pos.img7)
                       
		end
		if animIndex == 9 then


			watchface.img =  Image(root, "img08.png", pos.img8)
                
		end

		if animIndex >= 9  then  -- Проверка на превышение максимального значения индекса
			animIndex = 1  -- Возвращение к начальному значению индекса
		end
	end)
end

             
entry()



