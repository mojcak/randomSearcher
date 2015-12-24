import numpy as np

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
    if (np.allclose(eigenValues[0],1)):
        return eigenVectors[:,0].real/np.sum(eigenVectors[:,0].real)
    else:
        print("Error, eigenvalue: ", eigenValues[0])
        return -1

def calculate_mc_matrix(A, P):
    # calculate time inhomogenous transition matrix from adjacency matrix A and layer matrix P
    vec = np.sum(A, axis=0) # take care of nodes that have more than one outgoing link
    A = (A/vec)
    T = np.kron(A, P) # kronecker product of both matrices

    num_states, _ = A.shape

    m, n = T.shape

    t = np.zeros(m)
    for j in range(m):
        t[j] = (1-alphas[j%len(alphas)])/num_states
    for j in range(m):
        if j%len(alphas)==0:
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
# A is adjacency matrix of our mini network
A = np.array([[0, 0, 1], [1, 0, 0], [0, 1, 0]]) # one loop, T0
#A = np.array([[0,1, 1], [1, 0, 0], [0, 1, 0]]) # corresponds to T1
#A = np.array([[0,0,0], [1,0,0], [1,1,0]]) # corresponds to T2, one dangling
#A = np.array([[0, 0, 0, 1], [1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0]]) #loop of 4 nodes
#A = np.array([[0,1,0,1], [1, 0, 0, 1], [0, 1, 0, 0], [0, 0, 1, 1]])
#A = np.array([[1,1,0,1], [1, 0, 1, 1], [0, 1, 0, 0], [1, 0, 1, 1]])

alphas = [0.8, 0.4, 0.1, 0] #alphas that we will be using

# transition matrix
Ptemp = np.array([[1-alphas[0], 1-alphas[1], 1-alphas[2], 1-alphas[3]],
                  [alphas[0], 0, 0, 0],
                  [0, alphas[1], 0, 0],
                  [0, 0, alphas[2], 0]])

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
print("Stationary of P (=pi_1*P1+pi_2*P2+...) merged:", stationary_eig(P))

print()

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
    [(1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3, (1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3, (1-alphas[2])/3, (1-alphas[1])/3, (1-alphas[2])/3],
    [0, 0, 0, 0, 0, 0, 0, alphas[1]/3, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [(1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3, (1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3, (1-alphas[2])/3, (1-alphas[1])/3, (1-alphas[2])/3],
    [alphas[0]/2, 0, 0, 0, 0, 0, 0, alphas[1]/3, 0],
    [0, alphas[1]/2, 0, 0, 0, 0, 0, 0, 0],
    [(1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3, (1-alphas[0])/3, (1-alphas[1])/3, (1-alphas[2])/3, (1-alphas[2])/3, (1-alphas[1])/3, (1-alphas[2])/3],
    [alphas[0]/2, 0, 0, alphas[0], 0, 0, 0, alphas[1]/3, 0],
    [0, alphas[1]/2, 0, 0, alphas[1], 0, 0, 0, 0]
])
'''

T, sum_layer_P_merged, sum_layer_hier = calculate_mc_matrix(A, Ptemp)

print("Time inhomogenous MC:")
print("Stationary of P* hier (summing up by layers (A+B+C..)1, (A+B+C..)2.. )", sum_layer_hier)
print("Stationary of P* merged (summing up nodes A(1+2+..), B(), C()...)", sum_layer_P_merged)


