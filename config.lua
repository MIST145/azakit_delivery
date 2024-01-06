LANGUAGE = 'en'

Webhook = "https://discord.com/api/webhooks/1192513762561904670/z2zRXu28XCZWpxNd0qmIqBBAhEZ6OQv-tnnqfL_SPIQPWwNvqnoJ9UwZ-CfLGOmcf_zO"

blipscale = 1.0
blipcolour = 2
blipsprite = 501

---SELL 1---
------------
SELLITEM = "weed"  -- sales item to sell
TICKETITEM_REQ = true -- if true, you need an extra ticket item
TICKETITEM = "sellticket" -- ticket item
TICKETITEM_AMOUNT = 1 -- the number of tickets remove
SELLITEM_AMOUNT = 50  -- amount of sellitem required start / no sellitem check SELLITEM_AMOUNT = 0 

START_NPC = {
    ped = {
        model = "s_m_m_highsec_01",
        coords = vector3(837.8412, -2292.6572, 29.5127),
        heading = 290.8636
    }
}

rewarditem = 'black_money' -- money
price = 100  -- price of one piece
Duration = 20000

Minamsell = 35 -- minimum number of pieces that can be sold in one round
Maxamsell = 50 -- maximum number of pieces that can be sold in one round

Animdict = 'timetable@jimmy@doorknock@'
Animclip = 'knockdoor_idle'

Delilocations = {
    {x = 2634.3911,  y = 3292.0486,  z = 55.7284},
    {x = 636.7974,  y = 2785.6919,  z = 42.0084},
    {x = -2520.7954,   y = 2310.1492, z = 33.2158},
    {x = -215.0232,  y = 6444.3027, z = 31.3135},
    {x = 1662.1915, y = 4776.0391,  z = 41.9981},
	{x = -1100.3009,  y = 2722.2095,  z = 18.8004},
	{x = -20.6984,  y = 3030.1462,  z = 41.6841},
	{x = 917.4759,   y = 3654.9873,  z = 32.4844},
	{x = 1586.1454,  y = 2906.6528,   z = 57.8327},
	{x = 2639.4644,   y = 4246.0547,   z = 44.7480},
}


---SELL 2---
------------
SELLITEM2 = "coke"  -- sales item to sell
TICKETITEM2_REQ = true -- if true, you need an extra ticket item
TICKETITEM2 = "sellticket" -- ticket item
TICKETITEM2_AMOUNT = 1 -- the number of tickets remove
SELLITEM2_AMOUNT = 20  -- amount of sellitem required start / no sellitem check SELLITEM_AMOUNT = 0 

START_NPC2 = {
    ped = {
        model = "s_m_m_highsec_01",
        coords = vector3(839.0519, -2290.6431, 29.5126),
        heading = 261.3356
    }
}

rewarditem2 = 'black_money' -- money
price2 = 200  -- price of one piece
Duration2 = 20000

Minamsell2 = 10 -- minimum number of pieces that can be sold in one round
Maxamsell2 = 20 -- maximum number of pieces that can be sold in one round

Animdict2 = 'timetable@jimmy@doorknock@'
Animclip2 = 'knockdoor_idle'

Delilocations2 = {
    {x = 2634.3911,  y = 3292.0486,  z = 55.7284},
    {x = 636.7974,  y = 2785.6919,  z = 42.0084},
    {x = -2520.7954,   y = 2310.1492, z = 33.2158},
    {x = -215.0232,  y = 6444.3027, z = 31.3135},
    {x = 1662.1915, y = 4776.0391,  z = 41.9981},
	{x = -1100.3009,  y = 2722.2095,  z = 18.8004},
	{x = -20.6984,  y = 3030.1462,  z = 41.6841},
	{x = 917.4759,   y = 3654.9873,  z = 32.4844},
	{x = 1586.1454,  y = 2906.6528,   z = 57.8327},
	{x = 2639.4644,   y = 4246.0547,   z = 44.7480},
}


---SELL 3---
------------
SELLITEM3 = "medikit"  -- sales item to sell
TICKETITEM3_REQ = false -- if true, you need an extra ticket item
TICKETITEM3 = "sellticket" -- ticket item
TICKETITEM3_AMOUNT = 0 -- the number of tickets remove
SELLITEM3_AMOUNT = 0  -- amount of sellitem required start / no sellitem check SELLITEM_AMOUNT = 0 

START_NPC3 = {
    ped = {
        model = "s_m_m_doctor_01",
        coords = vector3(839.5576, -2293.7441, 29.5128),
        heading = 328.1299
    }
}

rewarditem3 = 'money' -- money
price3 = 100  -- price of one piece
Duration3 = 20000

Minamsell3 = 1 -- minimum number of pieces that can be sold in one round
Maxamsell3 = 2 -- maximum number of pieces that can be sold in one round

Animdict3 = 'timetable@jimmy@doorknock@'
Animclip3 = 'knockdoor_idle'

Delilocations3 = {
    {x = 2634.3911,  y = 3292.0486,  z = 55.7284},
    {x = 636.7974,  y = 2785.6919,  z = 42.0084},
    {x = -2520.7954,   y = 2310.1492, z = 33.2158},
    {x = -215.0232,  y = 6444.3027, z = 31.3135},
    {x = 1662.1915, y = 4776.0391,  z = 41.9981},
	{x = -1100.3009,  y = 2722.2095,  z = 18.8004},
	{x = -20.6984,  y = 3030.1462,  z = 41.6841},
	{x = 917.4759,   y = 3654.9873,  z = 32.4844},
	{x = 1586.1454,  y = 2906.6528,   z = 57.8327},
	{x = 2639.4644,   y = 4246.0547,   z = 44.7480},
}
