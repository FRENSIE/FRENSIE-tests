import numpy
import time
import math as m
#import matplotlib.pyplot as plt
import PyFrensie.Utility as Utility
import PyFrensie.MonteCarlo.Photon as Photon

def sampleAngle( native_data,
                 model_type,
                 sampling_type,
                 num_samples,
                 incoming_energy,
                 max_energy,
                 evaluate_pdf = False,
                 num_rate_trials = 3 ):

    # Create the distribution
    dist = Photon.IncoherentAdjointPhotonScatteringDistributionNativeFactory.createDistribution(
                                                             native_data,
                                                             model_type,
                                                             sampling_type,
                                                             max_energy )

    ave_eff_value = 0.0
    ave_rate_value = 0.0

    sampled_energies = [0]*num_samples
    sampled_mus = [0]*num_samples

    for i in range(0,num_rate_trials):
        trials = 0

        start = time.time()
        for j in range(0,num_samples):
            sampled_energies[j],sampled_mus[j],trials = dist.sampleAndRecordTrials( incoming_energy, trials )
        end = time.time()

        ave_eff_value += num_samples/float(trials)
        ave_rate_value += num_samples/(end-start)

    return_values = [ave_eff_value/float(num_rate_trials), ave_rate_value/float(num_rate_trials)]

    if evaluate_pdf:
        pdf = [0]*1001
        mu = [0]*1001
        mu_min = Photon.calculateMinScatteringAngleCosine( incoming_energy, max_energy )
        mu_step = (1.0 - mu_min)/(len(pdf)-1)

        for i in range(0,len(pdf)):
            mu[i] = mu_min + mu_step*i
            pdf[i] = dist.evaluatePDF( incoming_energy, mu[i] )

        return_values.append( sampled_energies )
        return_values.append( sampled_mus )
        return_values.append( mu )
        return_values.append( pdf )

    return return_values

def sampleAngleAndPlot( native_data,
                        model_type,
                        sampling_type,
                        num_samples,
                        incoming_energy,
                        max_energy,
                        legend_pos = [1.0,1.0]):

    efficiency,samples_per_sec,sampled_energies,sampled_mus,mu,pdf = \
        sampleAngle( native_data,
                     model_type,
                     sampling_type,
                     num_samples,
                     incoming_energy,
                     max_energy,
                     True )

    print "samples per second:", samples_per_sec
    print "efficiency:", efficiency
        
    # line1, = plt.plot( mu, pdf, label="Exact PDF" )
    # line1.set_color( "blue" )
    # line1.set_linewidth( 1 )
    
    # plt.hist( sampled_mus, bins=150, normed=True, color=[0.59, 0.98, 0.59], label="Sampled PDF" )
    # plt.legend( frameon=False, bbox_to_anchor=legend_pos )
    # plt.xlabel( "Scattering Angle Cosine (Mu)")
    # plt.ylabel( "WH Incoherent PDF" )
    # plt.savefig("incoh_sampling_pdf.eps")
    # plt.show()
