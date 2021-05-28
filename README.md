# Signal-processing-experiment-of-HFUT-2021
  It is composed of four programs running on matlab, which demonstrates some common transformations of signals. Two additional programs were added to demonstrate with two more intuitive functions. Mainly demonstrates how to use matlab to superimpose, convolve, and Fourier transform the signal.Also demonstrated how to do simulated sampling and filter on matlab.

EXP1:
1. Use the sine wave sequence to construct periodic rectangular pulses and observe the Gibbs phenomenon;
2. Observe and understand amplitude distortion and phase distortion
3. Calculate the waveform of the periodic rectangular pulse after passing through the RC low-pass filter.

EXP2:

Program to calculate the convolution of two signals.

EXP3:
1. Define a ramp function and use it to describe a pulse signal;
2. Use the fft() function to Fourier transform the pulse signal, and draw its amplitude spectrum and phase spectrum after adjustment by fftshift();
3. Process the phase spectrum to produce an undistorted time shift, then use ifft() to restore the signal and compare it with the original signal;
4. Through time-shifting and adding, the single pulse signal is transformed into a multi-pulse signal, and the frequency spectrum of single pulse, 5-pulse, 11-pulse, 101-pulse is compared, and the Fourier transform of periodic signal is understood.

EXP4:
1. Use the fft() function to calculate the Fourier transform spectrum of a pulse signal;
2. Perform ideal shock sampling on the signal and calculate the sampled frequency spectrum;
3. Use ideal low-pass filtering to recover the signal from the sampled spectrum.

Additional EXP：

The two cosine signals and their sum signals are sampled, first in the time domain, then in the frequency domain, and then through the filter.
In the second additional experiment, the cosine wave was replaced with single rectangular pulse.
