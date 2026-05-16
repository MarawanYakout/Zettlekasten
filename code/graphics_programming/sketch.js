var ball; //We need to create a var ball to ...

function setup()
{
    createCanvas(900,600);
    currentActive = new Ball();
}




function draw()
{
    background(255);

    if(currentActive)
    {
        currentActive.run();
    }
}

function runBall()
{
    currentActive = new Ball();
}

function runVecMag()
{
    currentActive = new magVector();
}

class Ball
{
    constructor()
    {
        this.velocity = new createVector(random(-2,2), random(-2,2));
        this.location = new createVector(random(width), random(height));
    }

    run()
    {
        this.draw();
        this.move();
        this.bounce();

    }

    draw()
    {
        fill(125);
        ellipse(this.location.x, this.location.y, 40,40);
    }

    move()
    {
        this.location.add(this.velocity);
    }

    bounce()
    {
        if (this.location.x < 0 || this.location.x > width) this.velocity.x *= -1;
        if (this.location.y < 0 || this.location.y > height) this.velocity.y  *= -1;
    }
}



class magVector
{
    constructor()
    {
        this.center = createVector(width/2, height/2);
    }

    run()
    {
        let mouse = createVector(mouseX, mouseY);

        mouse.sub(this.center);
        push();
        translate(width/2, height/2);
        strokeWeight(3);
        text("magnitude: " + int(mouse.mag()), 10, 10);
        line(0,0,mouse.x,mouse.y);
        pop();
    }

}
