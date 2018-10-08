def hosvd(X):
    U = [None for _ in range(X.ndims())]
    dims = X.ndims()
    S = X
    for d in range(dims):
        C = base.unfold(X,d) #mode n分解
        U1,S1,V1 = np.linalg.svd(C)  #SVD分解
        S = base.tensor_times_mat(S, U1.T,d) #迭代求解核心张量
        U[d] = U1
    core  = S
    return U,core #返回伴随矩阵和核心张量