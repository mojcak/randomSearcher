import numpy as np
import pickle
import scipy.stats
import sys
import scipy.sparse as sp
import preprocess_data as prepro
from random import randint, random
import math


def out_degrees(A):
    if (sp.issparse(A)):
        out = np.ravel(sp.csr_matrix.sum(A, axis=0)).flatten()
    else:
        out = np.sum(A, axis=0)
    out[out == 0] = 1
    return np.ravel(out).flatten()

def deg_matrix_inv(A):
    d = out_degrees(A)
    di = [1/float(a) for a in d]
    Di = np.diag(di)
    return Di

def rwalk_matrix(A, alpha):
    m, n = A.shape
    Di = deg_matrix_inv(A)
    if (sp.issparse(A)):
        P = sp.csr_matrix(A.dot(Di))
        dangling = np.ravel(sp.csr_matrix.sum(P, axis=0)).flatten()
        P = P.toarray()
    else:
        P = np.dot(A, Di)
        dangling = np.sum(P, axis=0)
        dangling = np.asarray(dangling).ravel()
    index_dangling = np.ix_(dangling == 0)
    P[:, index_dangling] = 1.0 / n

    if (sp.issparse(A)):
        P = alpha*sp.csr_matrix(P)+(float(1 - alpha) / n) * np.ones([n, n])
    else:
        P = alpha * P + (float(1 - alpha) / n) * np.ones([n, n])
    return P # sum of the columns == 1

def stationary_eig(P):
    # compute stationary distribution for matrix P as normalized right eigenvector with eigenvalue 1
    eigenValues, eigenVectors = np.linalg.eig(P)

    j=0
    for eigenValue in eigenValues:
        if (np.allclose(eigenValue.real,1)):
            return eigenVectors[:,j].real/np.sum(eigenVectors[:,j].real)
        j = j+1

    print("Error, eigenvalue: ", eigenValues[0])
    return -1

def calculate_mc_matrix(A, P, alphas):
    # calculate time inhomogenous transition matrix from adjacency matrix A and layer matrix P
    vec = np.sum(A, axis=0) # take care of nodes that have more than one outgoing link
    zero_idx, = np.where(vec == 0)
    if (zero_idx.size>0):
        for i in zero_idx:
            A[:, i] = 1
        vec = np.sum(A, axis = 0)
    A = (A/vec)
    T = np.kron(A, P) # kronecker product of both matrices

    num_states, _ = A.shape
    num_of_alphas, _ = P.shape

    m, n = T.shape

    t = np.zeros(m)
    for j in range(m):
        t[j] = (1-alphas[j%num_of_alphas])/num_states
    for j in range(m):
        if j%num_of_alphas==0:
            T[j,:]=t # overwrite the rows that contain only teleportations


    pi = (stationary_eig(T)) # stationary of T
    sum_layer_P_merged = np.zeros(num_states)
    k=0
    for i in range(num_states):
        for j in range(len(Ptemp)):
            sum_layer_P_merged[i]+=pi[k]
            k+=1

    sum_layer_hier = np.zeros(len(Ptemp))
    for i in range(len(pi)):
        sum_layer_hier[i%len(Ptemp)]+=pi[i]


    return T, sum_layer_P_merged, sum_layer_hier

def make_alpha_matrix(alphas):
    P_alphas = np.zeros((len(alphas), len(alphas)))
    P_alphas[0,:] = 1.-alphas
    for i in range(0, len(alphas)-1):
        P_alphas[i+1, i] = alphas[i]
    return P_alphas


def make_final_calculation(wiki):
    A = pickle.load(open("Data/"+wiki+"/A.p", "rb"))
    view_counts  = pickle.load(open("Data/"+wiki+"/view_counts.p", "rb"))

    P_page_rank = rwalk_matrix(A, 0.15)
    pi_page_rank = np.asarray(stationary_eig(P_page_rank)).flatten()

    alphas = np.array([0.1, 0.2, 0.5, 0.9, 0.4, 0.1, 0]) #alphas that we will be using

    print(str(alphas))
    # transition matrix
    Ptemp = make_alpha_matrix(alphas)

    Ps = [] # contains transition matrices P_i for alpha[i]
    for alpha in alphas:
        # for every alpha we can contruct different transititon matrix P
        # we will store it in  Ps
        Ps.append(rwalk_matrix(A, alpha))

    pi = stationary_eig(Ptemp)

    P = np.zeros(Ps[0].shape) # final matrix P = pi_1*P_1 + pi_2*P_2 + pi_3*P_3
    for i in range(0, len(Ps)):
        P = P + pi[i]*Ps[i]

    #print("Approximation of time inhomogenous MC: ")
    #print("Stationary distr of P hier: ", pi)

    pi_our_method = np.asarray(stationary_eig(P)).flatten()
    #print("Stationary of P (=pi_1*P1+pi_2*P2+...) merged:", stationary_eig(P))

    print("View counts vs our method")
    print("pearson correlation: ",scipy.stats.pearsonr(view_counts[:,1], pi_our_method)[0])
    print("spearman correlation: ", scipy.stats.spearmanr(view_counts[:,1], pi_our_method)[0])
    print()

    print("View counts vs page rank")
    print("pearson correlation: ", scipy.stats.pearsonr(view_counts[:,1], pi_page_rank)[0])
    print("spearman correlation: ", scipy.stats.spearmanr(view_counts[:,1], pi_page_rank)[0])
    print()

    print("Our vs page rank")
    print("pearson correlation: ",scipy.stats.pearsonr(pi_our_method, pi_page_rank)[0])
    print("spearman correlation: ", scipy.stats.spearmanr(pi_our_method, pi_page_rank)[0])

    '''
    plt.figure(0)
    plt.plot(view_counts[:,1],pi_our_method, 'ro')
    plt.xlabel("View counts")
    plt.ylabel("Our method")
    print("View counts vs our method")
    print(scipy.stats.pearsonr(view_counts[:,1], pi_our_method)[0])
    print(scipy.stats.spearmanr(view_counts[:,1], pi_our_method)[0])
    plt.title("Correlation (pearson) "+str(scipy.stats.pearsonr(view_counts[:,1], pi_our_method)[0])+" Spearman: "+str(scipy.stats.spearmanr(view_counts[:,1], pi_our_method)[0]))

    plt.figure(1)
    plt.plot(view_counts[:,1],pi_page_rank, 'ro')
    plt.xlabel("View counts")
    plt.ylabel("Page rank")
    print("View counts vs page rank")
    print(scipy.stats.pearsonr(view_counts[:,1], pi_page_rank)[0])
    print(scipy.stats.spearmanr(view_counts[:,1], pi_page_rank)[0])
    plt.title("Correlation (Pearson): "+ str(scipy.stats.pearsonr(view_counts[:,1], pi_page_rank)[0])+" Spearman: "+str(scipy.stats.spearmanr(view_counts[:,1], pi_page_rank)[0]))


    plt.figure(2)
    plt.plot(pi_our_method,pi_page_rank, 'ro')
    plt.xlabel("Our method")
    plt.ylabel("Page rank")
    print("Our vs page rank")
    print(scipy.stats.pearsonr(pi_our_method, pi_page_rank)[0])
    print(scipy.stats.spearmanr(pi_our_method, pi_page_rank)[0])
    plt.title("Correlation (Pearson: "+ str(scipy.stats.pearsonr(pi_our_method, pi_page_rank)[0])+" Spearman: "+str(scipy.stats.spearmanr(pi_our_method, pi_page_rank)[0]))

    plt.figure(3)
    plt.plot(range(0, len(view_counts)), view_counts[:,1], 'r-', label="View counts")
    plt.plot(range(0, len(view_counts)), stationary_eig(P), 'b-', label = "Our method alphas = "+str(alphas))
    plt.plot(range(0, len(view_counts)), pi_page_rank, 'g-', label = "Page Rank alpha = 0.15")
    plt.title("Stationary distributions for different methods")
    plt.xlabel("Nodes ")
    plt.ylabel("Stationary distribution")
    plt.legend()
    plt.show()

    '''

def cost_function(A, view_counts, state, pear = True):
    Ptemp = make_alpha_matrix(state)

    Ps = [] # contains transition matrices P_i for alpha[i]
    for s in state:
        Ps.append(rwalk_matrix(A, s))

    pi = calculate_stationary(Ptemp)
    #pi = stationary_eig(Ptemp)


    P = np.zeros(Ps[0].shape) # final matrix P = pi_1*P_1 + pi_2*P_2 + pi_3*P_3
    for i in range(0, len(Ps)):
        P = P + pi[i]*Ps[i]

    pi_our_method = calculate_stationary(P)

    if (pear):
        corr = scipy.stats.pearsonr(view_counts[:,1], pi_our_method)[0]
    else:
        corr = scipy.stats.spearmanr(view_counts[:,1], pi_our_method)[0]
    return (corr) # the returned "cost" will be in interval [0 - 2], 0 meaning totally uncorrelated

def calculate_stationary(A):
    A = A.T
    [n,n] = A.shape
    a = -A[0,1:]
    b = (A[1:,1:]-np.eye(n-1))

    x = np.array([1])

    x  = np.append(x,np.array(np.linalg.lstsq(b.T, a.T)[0].T))
    return x/np.sum(x)

def accept_prob(cost, cost_new, T):
    a = math.exp((-cost+cost_new)/T)
    return a

def simulated_annealing(wiki, state, sigma = 0.25, pearsonr=False):
    A = pickle.load(open("Data/"+wiki+"/A.p", "rb"))
    view_counts  = pickle.load(open("Data/"+wiki+"/view_counts.p", "rb"))

    cost = cost_function(A, view_counts, state, pearsonr)

    other_cost = cost_function(A, view_counts, state, not pearsonr)
    print("Initial: ", cost, other_cost, state)

    T = 1.0 # starting temperature
    T_min = 1e-3 # min temperature
    alpha = 0.95 # annealing factor


    while T>T_min:
        i=0
        while i<10:
            idx_to_perturb = (randint(0,len(state)-2)) # the last one has to be always 0!
            add_prob = (np.random.normal(0, sigma, 1))
            if state[idx_to_perturb]+add_prob<=1.0 and state[idx_to_perturb]+add_prob>=0:

                state_new = state
                state_new[idx_to_perturb]+=add_prob
                cost_new = cost_function(A, view_counts, state_new, pearsonr)

                if accept_prob(cost, cost_new, T)>random():
                    state = state_new
                    cost = cost_new
                i+=1

        T = T*alpha

    other_cost = cost_function(A, view_counts, state, not pearsonr)
    print("Final: ",cost, other_cost, state)

state =np.array([ 0.1, 0.4, 0.5,  0.9,  0.4, 0.2, 0.1, 0. ])

#state = np.random.rand(8)
#state[len(state)-1] = 0

import json
jump_prob = pickle.load(open("jump.p", "rb"))
json_acceptable_string = jump_prob.replace("'", "\"")
d = json.loads(json_acceptable_string)

state = np.zeros(len(d)+1)
i=0
for d_ in sorted(d):
    state[i] = d[d_]
    i=i+1

simulated_annealing("vewiki", state, 0.25, pearsonr=False)

#import cProfile
#cProfile.run('simulated_annealing("vewiki", 0.01, pearsonr=True)', sort='cumulative')

#simulated_annealing("vewiki", 0.4)

#make_final_calculation("miwiki")

#prepro.preprocess(['Data/vewiki/vewiki-20160111-pagelinks.sql','Data/vewiki/vewiki-20160111-page.sql', 'Data/vewiki/vewiki-20160111-redirect.sql'], make_txt = False)

#prepro.make_txt_files(['Data/sowiki/sowiki-20160111-pagelinks.sql','Data/sowiki/sowiki-20160111-page.sql', 'Data/sowiki/sowiki-20160111-redirect.sql'])
#prepro.make_txt_files(['Data/muswiki/muswiki-20160111-pagelinks.sql','Data/muswiki/muswiki-20160111-page.sql', 'Data/muswiki/muswiki-20160111-redirect.sql'])