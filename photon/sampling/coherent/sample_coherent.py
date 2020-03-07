import sys, os
import numpy
import time
import math as m
import matplotlib.pyplot as plt
import PyFrensie.Utility as Utility
import PyFrensie.MonteCarlo.Photon as Photon

def sampleAngle( native_data,
                 model_type,
                 num_samples,
                 incoming_energy,
                 evaluate_pdf = False ):

    # Create the distribution
    if model_type == "thompson":
        dist = Photon.CoherentScatteringDistributionNativeFactory.createThompsonDistribution()
    elif model_type == "basic":
        dist = Photon.CoherentScatteringDistributionNativeFactory.createBasicCoherentDistribution( native_data )
    elif model_type == "eff":
        dist = Photon.CoherentScatteringDistributionNativeFactory.createEfficientCoherentDistribution( native_data )
    else:
        print "The model type is not valid (must be thompson, basic or eff)!"
        sys.exit(1)

    sampled_mus = [0]*num_samples
    trials = 0

    start = time.time()
    for i in range(0,num_samples):
        energy,sampled_mus[i],trials = dist.sampleAndRecordTrials( incoming_energy, trials )
    end = time.time()

    return_values = [num_samples/float(trials), num_samples/(end-start)]

    if evaluate_pdf:
        pdf = [0]*1001
        mu = [0]*1001
        mu_step = 2.0/(len(pdf)-1)

        for i in range(0,len(pdf)):
            mu[i] = -1.0 + mu_step*i
            pdf[i] = dist.evaluatePDF( incoming_energy, mu[i] )

        return_values.append( sampled_mus )
        return_values.append( mu )
        return_values.append( pdf )

    return return_values

def sampleAngleAndPlot( native_data,
                        model_type,
                        num_samples,
                        incoming_energy,
                        legend_pos = [1.0,1.0] ):

    efficiency,samples_per_sec,sampled_mus,mu,pdf = \
        sampleAngle( native_data,
                     model_type,
                     num_samples,
                     incoming_energy,
                     True )

    print "samples per second:", samples_per_sec
    print "efficiency:", efficiency

    line1, = plt.plot( mu, pdf, label="Exact PDF" )
    line1.set_color( "blue" )
    line1.set_linewidth( 1 )
    
    plt.hist( sampled_mus, bins=150, normed=True, color=[0.59, 0.98, 0.59], label="Sampled PDF" )
    plt.legend( frameon=False, bbox_to_anchor=legend_pos )
    plt.xlabel( "Scattering Angle Cosine (Mu)")
    plt.ylabel( "WH Coherent PDF" )
    plt.savefig("coh_sampling_pdf.eps")
    plt.show()
