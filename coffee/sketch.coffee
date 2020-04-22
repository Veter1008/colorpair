balls = []
radie = 100
range = _.range
COLORS = "#f008 #00f8 #0f08 #ff08".split " " 
clicked=[]
level=0


reset = (delta)->
	console.log delta
	level+=delta
	if level==0 then level=1
	balls = []
	clicked = []
	for i in range level
		x = int random width
		y = int random height
		balls.push {x:x,y:y,rgb:COLORS[i],active:true}
		x = int random width
		y = int random height
		balls.push {x:x,y:y,rgb:COLORS[i],active:true}


setup = ->
	createCanvas windowWidth, windowHeight
	radie = windowHeight/4
	reset 1


draw = ->
	background 255
	for ball in balls
		if ball.active
			fill ball.rgb 
			ellipse ball.x,ball.y,radie*2
			fill 0
			textSize radie/5
			textAlign CENTER,CENTER
			text "#{ball.x} #{ball.y}\n#{ball.rgb}\n#{ball.active}",ball.x,ball.y


mousePressed = ->
	console.log mouseX, mouseY
	ballCount=0
	active=0
	for ball in balls 
		if dist(ball.x,ball.y, mouseX, mouseY)<radie and ball.active==true
			active++
			ballCount++
			b=ball
	if ballCount==1
		console.log "inside"
		clicked.push b 
		console.log clicked.length
		b.active=false
		if clicked.length==1
			if b.rgb==clicked[0].rgb
				if active==balls.length
					reset 1
			else 
				reset -1
		else 
			reset -1
	else 
		reset -1