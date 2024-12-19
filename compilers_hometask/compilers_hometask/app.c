#include "sim.h"
#include "SDL2/SDL.h"
#include <stdlib.h>
#include <stdbool.h>

#undef main

#define SIM_X_SIZE 512
#define SIM_Y_SIZE 256



void cell_process(bool prev[SIM_X_SIZE][SIM_Y_SIZE], bool current[SIM_X_SIZE][SIM_Y_SIZE]) 
{
    for (int i = 0; i < SIM_Y_SIZE; i++) 
    {
        for (int j = 0; j < SIM_X_SIZE; j++) 
        {
            int neighbors = 0;

            if (i != 0 & j != 0 & prev[j-1][i-1])
            {
                neighbors++;
            }
            if (i != 0 & prev[j][i-1])
            {
                neighbors++;
            }
            if (i != 0 & j != SIM_X_SIZE - 1 & prev[j+1][i-1])
            {
                neighbors++;
            }


            if (j != 0 & prev[j-1][i])
            {
                neighbors++;
            }
            if (j != SIM_X_SIZE - 1 & prev[j+1][i])
            {
                neighbors++;
            }



            if (i != SIM_Y_SIZE & j != 0 & prev[j-1][i+1])
            {
                neighbors++;
            }
            if (i != SIM_Y_SIZE & prev[j][i+1])
            {
                neighbors++;
            }
            if (i != SIM_Y_SIZE & j != SIM_X_SIZE - 1 & prev[j+1][i+1])
            {
                neighbors++;
            }

            if (neighbors == 2 & prev[j][i] == true)
                current[j][i] = true;
            else if (neighbors == 3)
                current[j][i] = true;
            else
                current[j][i] = false;
        }
    }
}


void gen_initial_frame(bool frame[SIM_X_SIZE][SIM_Y_SIZE]) 
{
    for (int i = 0; i < SIM_Y_SIZE; i++)
    {
        for (int j = 0; j < SIM_X_SIZE; j++) 
        {
            int empty = simRand() % 4;
            if (empty)
            {
                frame[j][i] = true;                         // true == alive
            }
            else
            {
                frame[j][i] = false;                        // false == dead
            }
        }
    }
}


void app() 
{
    bool current_data[SIM_X_SIZE][SIM_Y_SIZE] = {};
    bool prev_data[SIM_X_SIZE][SIM_Y_SIZE] = {};

    gen_initial_frame(prev_data);
    for (;;) 
    {
        for (int i = 0; i < SIM_Y_SIZE; i++) 
        {
            for (int j = 0; j < SIM_X_SIZE; j++) 
            {
                if (prev_data[j][i])
                    simPutPixel(j, i, 0xFF00AAFF);          // blue == alive
                else
                    simPutPixel(j, i, 0x00000000);          // black == dead
            }
        }

        cell_process(prev_data, current_data);
        
        for (int i = 0; i != SIM_Y_SIZE; ++i) 
        {
            for (int j = 0; j != SIM_X_SIZE; ++j) 
            {
               prev_data[j][i] = current_data[j][i];
            }
        }

        simFlush();

    }
}




int main(int argc, char *argv[])
{
    simInit();
    app();

    return 0;
}