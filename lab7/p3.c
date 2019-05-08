#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

volatile int pixel_buffer_start; // global variable

void wait_for_vsync();
void plot_pixel(int x, int y, short int line_color);
void swap(int *xp, int *yp) ;
void draw_box( int x, int y, int color);
void draw_line(int x0, int x1, int y0, int y1, short int line_color);
void clear_screen();

int main(void)
{
    volatile int * pixel_ctrl_ptr = (int *)0xFF203020;
    // declare other variables
	int x[8], y[8],dx[8], dy[8],color[8]; 

    // initialize location and direction of rectangles(not shown)
	int i;
	for( i = 0; i < 8; i++){
		x[i] = rand()%320;
		y[i] = rand()%240;
		dx[i] = rand()%2*2-1;
		dy[i] = rand()%2*2-1;
		color[i] = rand()%0xFFFFF; //IN RANGE
	}
    /* set front pixel buffer to start of FPGA On-chip memory */
    *(pixel_ctrl_ptr + 1) = 0xC8000000; // first store the address in the 
                                        // back buffer
    /* now, swap the front/back buffers, to set the front buffer location */
    wait_for_vsync();
    /* initialize a pointer to the pixel buffer, used by drawing functions */
    pixel_buffer_start = *pixel_ctrl_ptr;
    clear_screen(); // pixel_buffer_start points to the pixel buffer
    /* set back pixel buffer to start of SDRAM memory */
    *(pixel_ctrl_ptr + 1) = 0xC0000000;
    pixel_buffer_start = *(pixel_ctrl_ptr + 1); // we draw on the back buffer

    while (1)
    {
        /* Erase any boxes and lines that were drawn in the last iteration */
        clear_screen(); 

        // code for drawing the boxes and lines (not shown)
		
		for( i = 0 ; i < 8 ; i++){
			draw_line(x[i], x[(i+1)%8], y[i], y[(i+1)%8], color[i]);
			draw_box(x[i],y[i],color[i]);
		}
        // code for updating the locations of boxes (not shown)
		for( i = 0 ; i < 8 ; i++){
			x[i]+= dx[i];
			y[i]+= dy[i];
			if( x[i] == 0 || x[i] == 319 ){
				dx[i] = -dx[i];
			}
			else if ( y[i] == 0 || y[i] == 239 ){
				dy[i] = -dy[i];
			}
		}
        wait_for_vsync(); // swap front and back buffers on VGA vertical sync
        pixel_buffer_start = *(pixel_ctrl_ptr + 1); // new back buffer
    }
}

// code for subroutines (not shown)
void wait_for_vsync(){
	volatile int * pixel_ctrl_ptr = (int *)0xFF203020;
	register int status;
	*pixel_ctrl_ptr = 1; //start the synchronization process
	status = *(pixel_ctrl_ptr + 3);
	while((status & 0x01 ) != 0){
		status = *(pixel_ctrl_ptr + 3);
	}
}

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

void draw_box( int x, int y, int color){
	plot_pixel(x,y,color);
	plot_pixel(x+1, y, color);
	plot_pixel(x,y+1,color);
	plot_pixel(x+1, y+1, color); 
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

	for(x = x0; x <= x1; ++x){
		if(steep){ 
			plot_pixel(y,x,line_color);
		}
		else { 
			plot_pixel(x,y,line_color);
		}
		error = error + del_y;

		if(error > 0){
			y = y + y_step;
			error = error - del_x;
		}
    	}
    return;

}

void clear_screen(){
	int x,y;
	for( x = 0 ; x < 320; ++x){
		for( y = 0; y < 240; ++y){
			plot_pixel(x,y,0);
		}
	}
}
