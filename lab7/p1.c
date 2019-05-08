#include <stdio.h>
#include <stdbool.h>

volatile int pixel_buffer_start; // global variable
void plot_pixel(int x, int y, short int line_color);
void swap(int *xp, int *yp);
void draw_line( int x0, int x1, int y0, int y1, short int line_color);
void clear_screen();

int main(void)
{
    volatile int * pixel_ctrl_ptr = (int *)0xFF203020;
    /* Read location of the pixel buffer from the pixel buffer controller */
    pixel_buffer_start = *pixel_ctrl_ptr;

    clear_screen();
    draw_line(0, 0, 150, 150, 0x001F);   // this line is blue
    draw_line(150, 150, 319, 0, 0x07E0); // this line is green
    draw_line(0, 319, 239, 239, 0xF800); // this line is red
    draw_line(319, 0, 0, 239, 0xF81F);   // this line is a pink color
}
// code not shown for clear_screen() and draw_line() subroutines

void plot_pixel(int x, int y, short int line_color)
{
    *(short int *)(pixel_buffer_start + (y << 10) + (x << 1)) = line_color;
}

void swap(int *xp, int *yp) 
{ 
    int temp = *xp; 
    *xp = *yp; 
    *yp = temp; 
} 

void draw_line(int x0, int x1, int y0, int y1, short int line_color){
	bool steep = abs(y1-y0)>abs(x1-x0);
	if(steep){
		swap(&x0,&y0);
		swap(&x1,&y1);
	}

	if(x0>x1){
		swap(&x0,&x1);
		swap(&y0,&y1);
	}

	int del_x = x1 - x0;
	int del_y = abs(y1 -y0);
	int error = -(del_x /2);
	
	int y = y0;
	int x;

	int y_step;

	if(y0 < y1){
		y_step = 1;
	}

	else{
		y_step = -1;
	}

	for(x=x0; x<= x1; x++){
		if(steep){ plot_pixel(y,x,line_color);}
		else{ plot_pixel(x,y,line_color);}
		error = error + del_y;

		if(error > 0){
			y = y + y_step;
			error = error - del_x;
		}
    }
    return;

}
void clear_screen(){
	int x, y;
	for( x = 0 ; x < 320; ++x){
		for(y = 0; y < 240; ++y){
			plot_pixel(x,y,0);
		}
	}
}
		
	