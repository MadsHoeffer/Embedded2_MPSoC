#include "KF_kernel.h"
#include <cmath>
KF_data_t A[N_STATE_VARS*N_STATE_VARS] = {
		1,0,0,DT,0,0,
		0,1,0,0,DT,0,
		0,0,1,0,0,DT,
		0,0,0,1,0,0,
		0,0,0,0,1,0,
		0,0,0,0,0,1
};

KF_data_t B[N_STATE_VARS*N_CTRL_VARS] = {
		0.5*DT*DT,0,0,
		0,0.5*DT*DT,0,
		0,0,0.5*DT*DT,
		DT,0,0,
		0,DT,0,
		0,0,DT
};
KF_data_t H[N_MEAS_VARS*N_STATE_VARS] = {
		1,0,0,0,0,0,
		0,1,0,0,0,0,
		0,0,1,0,0,0
};

KF_data_t I[N_STATE_VARS*N_STATE_VARS] = {
		1,0,0,0,0,0,
		0,1,0,0,0,0,
		0,0,1,0,0,0,
		0,0,0,1,0,0,
		0,0,0,0,1,0,
		0,0,0,0,0,1
};
float dt;
void KalmanFilterKernel(float din[N_STATE_VARS], float dout[N_STATE_VARS], float q, float r, ap_uint<24> countin) {
	#pragma HLS INTERFACE ap_memory storage_type=ram_1p port=din
	#pragma HLS INTERFACE ap_memory storage_type=ram_1p port=dout
	#pragma HLS INTERFACE s_axilite port=q bundle=AXI_CPU
	#pragma HLS INTERFACE s_axilite port=r bundle=AXI_CPU
	#pragma HLS INTERFACE s_axilite port=return bundle=AXI_CPU
	#pragma HLS INTERFACE ap_none register port=countin
	static ap_uint<24> prev_count = 0;
	ap_uint<24> count = countin;
	ap_uint<24> count_max = std::pow(2,24);
	const float freq = 100000000.;
	if(count<prev_count){
		dt = ((float)(count_max-prev_count+count))/freq;
	}
	else{
	 dt = (count-prev_count)/freq;

	}
	prev_count = count;
	A[3] = dt;
	A[10] = dt;
	A[17] = dt;
	B[0] = 0.5*dt*dt;
	B[4] = 0.5*dt*dt;
	B[8] = 0.5*dt*dt;
	B[9] = dt;
	B[13] = dt;
	B[17] = dt;

	KF_data_t din_[N_STATE_VARS];
	KF_data_t dout_[N_STATE_VARS];

	for (int i = 0; i < N_STATE_VARS; i++) {
		din_[i] = (KF_data_t)din[i];
	}

	// Initialization:
	KF_data_t Q[N_STATE_VARS*N_STATE_VARS] = {
			q, 0, 0, 0, 0, 0,
			0, q, 0, 0, 0, 0,
			0, 0, q, 0, 0, 0,
			0, 0, 0, q, 0, 0,
			0, 0, 0, 0, q, 0,
			0, 0, 0, 0, 0, q
	};
	KF_data_t R[N_MEAS_VARS*N_MEAS_VARS] = {
			r, 0, 0,
			0, r, 0,
			0, 0, r
	};

	static KF_data_t x_hat[N_STATE_VARS] = { din_[0], din_[1], din_[2], 0, 0, 0 };
	static KF_data_t P_hat[N_STATE_VARS*N_STATE_VARS] = {
			1, 0, 0, 0, 0, 0,
			0, 1, 0, 0, 0, 0,
			0, 0, 1, 0, 0, 0,
			0, 0, 0, 1, 0, 0,
			0, 0, 0, 0, 1, 0,
			0, 0, 0, 0, 0, 1
	};


	for (int i = 0; i < N_STATE_VARS; i++) dout_[i] = x_hat[i];

	// Processing:
	// Registers
	KF_data_t u[N_CTRL_VARS];
	KF_data_t z[N_MEAS_VARS];
	KF_data_t x[N_STATE_VARS];
	KF_data_t P[N_STATE_VARS*N_STATE_VARS];

	KF_data_t x_minus[N_STATE_VARS];
	KF_data_t P_minus[N_STATE_VARS*N_STATE_VARS];

	KF_data_t x_plus[N_STATE_VARS];
	KF_data_t P_plus[N_STATE_VARS*N_STATE_VARS];

	KF_data_t tmp_mat_1[N_STATE_VARS*N_STATE_VARS];
	KF_data_t tmp_mat_2[N_STATE_VARS*N_STATE_VARS];

	KF_data_t tmp_mat_3[N_STATE_VARS*N_STATE_VARS];

	// Load data step

	for (int j = 0; j < N_MEAS_VARS; j++) z[j] = (din_[j]);
	for (int j = 0; j < N_CTRL_VARS; j++) u[j] = (din_[N_MEAS_VARS+j]);
	for (int j = 0; j < N_STATE_VARS; j++) x[j] = x_hat[j];
	for (int j = 0; j < N_STATE_VARS*N_STATE_VARS; j++) P[j] = P_hat[j];


	// Predict step
	matMultiply<KF_data_t, N_STATE_VARS, N_STATE_VARS, N_STATE_VARS>(A, x, tmp_mat_1, N_STATE_VARS, N_STATE_VARS, 1);
	matMultiply<KF_data_t, N_STATE_VARS, N_STATE_VARS, N_STATE_VARS>(B, u, tmp_mat_2, N_STATE_VARS, N_CTRL_VARS, 1);
	matAdd<KF_data_t, N_STATE_VARS, N_STATE_VARS>(tmp_mat_1, tmp_mat_2, x_minus, N_STATE_VARS, 1);

	matMultiply<KF_data_t, N_STATE_VARS, N_STATE_VARS, N_STATE_VARS>(A, P, tmp_mat_1, N_STATE_VARS, N_STATE_VARS, N_STATE_VARS);
	matTranspose<KF_data_t, N_STATE_VARS, N_STATE_VARS>(A, tmp_mat_2, N_STATE_VARS, N_STATE_VARS);
	matMultiply<KF_data_t, N_STATE_VARS, N_STATE_VARS, N_STATE_VARS>(tmp_mat_1, tmp_mat_2, tmp_mat_3, N_STATE_VARS, N_STATE_VARS, N_STATE_VARS);
	matAdd<KF_data_t, N_STATE_VARS, N_STATE_VARS>(tmp_mat_3, Q, P_minus, N_STATE_VARS, N_STATE_VARS);

	for (int j = 0; j < N_STATE_VARS; j++) x_plus[j] = x_minus[j];
	for (int j = 0; j < N_STATE_VARS*N_STATE_VARS; j++) P_plus[j] = P_minus[j];

	// Update step
	KF_data_t y_bar[N_MEAS_VARS];
	KF_data_t H_T[N_STATE_VARS*N_MEAS_VARS];
	KF_data_t S[N_MEAS_VARS*N_MEAS_VARS];
	KF_data_t S_inv[N_MEAS_VARS*N_MEAS_VARS];
	KF_data_t K[N_STATE_VARS*N_MEAS_VARS];

	matTranspose<KF_data_t, N_STATE_VARS, N_STATE_VARS>(H, H_T, N_MEAS_VARS, N_STATE_VARS);

	matMultiply<KF_data_t, N_STATE_VARS, N_STATE_VARS, N_STATE_VARS>(H, x_minus, tmp_mat_3, N_MEAS_VARS, N_STATE_VARS, 1);
	matSubtract<KF_data_t, N_STATE_VARS, N_STATE_VARS>(z, tmp_mat_3, y_bar, N_MEAS_VARS, 1);

	matMultiply<KF_data_t, N_STATE_VARS, N_STATE_VARS, N_STATE_VARS>(H, P_minus, tmp_mat_3, N_MEAS_VARS, N_STATE_VARS, N_STATE_VARS);
	matMultiply<KF_data_t, N_STATE_VARS, N_STATE_VARS, N_STATE_VARS>(tmp_mat_3, H_T, tmp_mat_2, N_MEAS_VARS, N_STATE_VARS, N_MEAS_VARS);
	matAdd<KF_data_t, N_STATE_VARS, N_STATE_VARS>(tmp_mat_2, R, S, N_MEAS_VARS, N_MEAS_VARS);

	matDiagInverse<KF_data_t, N_MEAS_VARS>(S, S_inv, N_MEAS_VARS);
	matMultiply<KF_data_t, N_STATE_VARS, N_STATE_VARS, N_STATE_VARS>(P_minus, H_T, tmp_mat_3, N_STATE_VARS, N_STATE_VARS, N_MEAS_VARS);
	matMultiply<KF_data_t, N_STATE_VARS, N_STATE_VARS, N_STATE_VARS>(tmp_mat_3, S_inv, K, N_STATE_VARS, N_MEAS_VARS, N_MEAS_VARS);

	matMultiply<KF_data_t, N_STATE_VARS, N_STATE_VARS, N_STATE_VARS>(K, y_bar, tmp_mat_3, N_STATE_VARS, N_MEAS_VARS, 1);
	matAdd<KF_data_t, N_STATE_VARS, N_STATE_VARS>(x_minus, tmp_mat_3, x_plus, N_STATE_VARS, 1);

	matMultiply<KF_data_t, N_STATE_VARS, N_STATE_VARS, N_STATE_VARS>(K, H, tmp_mat_2, N_STATE_VARS, N_MEAS_VARS, N_STATE_VARS);
	matSubtract<KF_data_t, N_STATE_VARS, N_STATE_VARS>(I, tmp_mat_2, tmp_mat_1, N_STATE_VARS, N_STATE_VARS);
	matMultiply<KF_data_t, N_STATE_VARS, N_STATE_VARS, N_STATE_VARS>(tmp_mat_1, P_minus, P_plus, N_STATE_VARS, N_STATE_VARS, N_STATE_VARS);

	// Write data
	for (int j = 0; j < N_STATE_VARS; j++) x_hat[j] = x_plus[j];
	for (int j = 0; j < N_STATE_VARS*N_STATE_VARS; j++) P_hat[j] = P_plus[j];
	for (int j = 0; j < N_STATE_VARS; j++) dout_[N_STATE_VARS+j] = x_plus[j];
	for (int i = 0; i < N_STATE_VARS; i++) {
		dout[i] = (float)dout_[i];
	}
}
