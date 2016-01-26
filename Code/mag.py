import numpy as np
import preprocess_data as preprocess
import matplotlib.pyplot as plt
import pickle

def out_degrees(A):
    out = np.sum(A, axis=0)
    out[out == 0] = 1
    return out

def deg_matrix_inv(A):
    d = out_degrees(A)
    d =  np.asarray(d).ravel()
    di = [1/float(a) for a in d]
    Di = np.diag(di)
    return Di

def rwalk_matrix(A, alpha):
    m, n = A.shape
    Di = deg_matrix_inv(A)
    P = np.dot(A, Di)
    dangling = np.sum(P, axis=0)
    dangling = np.asarray(dangling).ravel()
    index_dangling = np.ix_(dangling == 0)
    P[:, index_dangling] = 1.0 / n
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

# A is adjacency matrix of our mini network
#A = np.array([[0, 0, 1], [1, 0, 0], [0, 1, 0]]) # one loop, T0
#A = np.array([[0,1, 1], [1, 0, 0], [0, 1, 0]]) # corresponds to T1
#A = np.array([[0,0,0], [1,0,0], [1,1,0]]) # corresponds to T2, one dangling
#A = np.array([[0, 0, 0, 1], [1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0]]) #loop of 4 nodes
#A = np.array([[0,1,0,1], [1, 0, 0, 1], [0, 1, 0, 0], [0, 0, 1, 1]])
#A = np.array([[1,1,0,1], [1, 0, 1, 1], [0, 1, 0, 0], [1, 0, 1, 1]])
#A = np.array([[0,0,0], [0,0,0], [1, 0, 1]])
#A = np.array([[0,0,0], [0,0,0], [0,0,0]])

#A, view_counts = preprocess.preprocess()

A = pickle.load(open("A.p", "rb"))


P_page_rank = rwalk_matrix(A, 0.15)
pi_page_rank = stationary_eig(P_page_rank)

view_counts  = pickle.load(open("view_counts.p", "rb"))

alphas = np.array([0.1, 0.5, 0]) #alphas that we will be using


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

print("Approximation of time inhomogenous MC: ")
print("Stationary distr of P hier: ", pi)
#print("Stationary of P (=pi_1*P1+pi_2*P2+...) merged:", stationary_eig(P))

print()

#plt.plot(range(0, len(view_counts)), view_counts[:,1], 'r-', label="View counts")
plt.plot(range(0, len(view_counts)), stationary_eig(P), 'b-', label = "Our method alphas = "+str(alphas))
plt.plot(range(0, len(view_counts)), pi_page_rank, 'g-', label = "Page Rank alpha = 0.15")
plt.title("Stationary distributions for different methods")
plt.xlabel("Nodes ")
plt.ylabel("Stationary distribution")
plt.legend()
plt.show()


'''
## T0
T = np.array([
    [(1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3, (1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3, (1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3],
    [0, 0, 0, 0, 0, 0, alphas[0], 0, 0],
    [0, 0, 0, 0, 0, 0, 0, alphas[1], 0],
    [(1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3, (1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3, (1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3],
    [alphas[0], 0, 0, 0, 0, 0, 0, 0, 0],
    [0, alphas[1], 0, 0, 0, 0, 0, 0, 0],
    [(1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3, (1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3, (1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3],
    [0, 0, 0, alphas[0], 0, 0, 0, 0, 0],
    [0, 0, 0, 0, alphas[1], 0, 0, 0, 0]
])
'''

'''
### T1
T = np.array([
    [(1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3, (1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3, (1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3],
    [0, 0, 0, alphas[0]/2, 0, 0, alphas[0], 0, 0],
    [0, 0, 0, 0, alphas[1]/2, 0, 0, alphas[1], 0],
    [(1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3, (1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3, (1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3],
    [alphas[0], 0, 0, 0, 0, 0, 0, 0, 0],
    [0, alphas[1], 0, 0, 0, 0, 0, 0, 0],
    [(1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3, (1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3, (1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3],
    [0, 0, 0, alphas[0]/2, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, alphas[1]/2, 0, 0, 0, 0]
])

'''

'''
## T2
T = np.array([
    [(1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3, (1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3, (1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3],
    [0, 0, 0, 0, 0, 0, alphas[0]/3, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, alphas[1]/3, 0],
    [(1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3, (1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3, (1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3],
    [alphas[0]/2, 0, 0, 0, 0, 0, alphas[0]/3, 0, 0],
    [0, alphas[1]/2, 0, 0, 0, 0, 0, alphas[1]/3, 0],
    [(1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3, (1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3, (1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3],
    [alphas[0]/2, 0, 0, alphas[0], 0, 0, alphas[0]/3, 0, 0],
    [0, alphas[1]/2, 0, 0, alphas[1], 0, 0, alphas[1]/3, 0]
])
'''

#T, sum_layer_P_merged, sum_layer_hier = calculate_mc_matrix(A, Ptemp, alphas)

#print("Time inhomogenous MC:")
#print("Stationary of P* hier (summing up by layers (A+B+C..)1, (A+B+C..)2.. )", sum_layer_hier)
#print("Stationary of P* merged (summing up nodes A(1+2+..), B(), C()...)", sum_layer_P_merged)


