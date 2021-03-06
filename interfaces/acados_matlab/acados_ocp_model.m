classdef acados_ocp_model < handle
	


	properties
		name
		% dims
		T
		nx
		nu
		nz
		ny
		ny_e
		nbx
		nbu
		ng
		ng_e
		nh
		nh_e
		% symbolics
		sym_x
		sym_u
		sym_xdot
		sym_z
		% cost
		cost_type
		cost_e_type
		expr_y
		expr_y_e
		Vu
		Vx
		Vx_e
		W
		W_e
		yr
		yr_e
		% dynamics
		dyn_type
		expr_f
		% constraints
		constr_type
		x0
		Jbx
		lbx
		ubx
		Jbu
		lbu
		ubu
		C
		D
		lg
		ug
		C_e
		lg_e
		ug_e
		expr_h
		lh
		uh
		expr_h_e
		lh_e
		uh_e
		% structure
		model_struct
	end %properties



	methods
		

		function obj = acados_ocp_model()
			% default values
			obj.name = 'ocp_model';
			obj.cost_type = 'linear_ls';
			obj.cost_e_type = 'linear_ls';
			obj.dyn_type = 'implicit';
			obj.constr_type = 'bgh';
			% model structure
			obj.model_struct = struct;
			% initialize model struct
			obj.model_struct.name = obj.name;
			obj.model_struct.cost_type = obj.cost_type;
			obj.model_struct.cost_e_type = obj.cost_type;
			obj.model_struct.dyn_type = obj.dyn_type;
			obj.model_struct.constr_type = obj.constr_type;
		end


		function obj = set(obj, field, value)
			% dims
			if (strcmp(field, 'T'))
				obj.T = value;
				obj.model_struct.T = value;
			elseif (strcmp(field, 'nx'))
				obj.nx = value;
				obj.model_struct.nx = value;
			elseif (strcmp(field, 'nu'))
				obj.nu = value;
				obj.model_struct.nu = value;
			elseif (strcmp(field, 'nz'))
				obj.nz = value;
				obj.model_struct.nz = value;
			elseif (strcmp(field, 'ny'))
				obj.ny = value;
				obj.model_struct.ny = value;
			elseif (strcmp(field, 'ny_e'))
				obj.ny_e = value;
				obj.model_struct.ny_e = value;
			elseif (strcmp(field, 'nbx'))
				obj.nbx = value;
				obj.model_struct.nbx = value;
			elseif (strcmp(field, 'nbu'))
				obj.nbu = value;
				obj.model_struct.nbu = value;
			elseif (strcmp(field, 'ng'))
				obj.ng = value;
				obj.model_struct.ng = value;
			elseif (strcmp(field, 'ng_e'))
				obj.ng_e = value;
				obj.model_struct.ng_e = value;
			elseif (strcmp(field, 'nh'))
				obj.nh = value;
				obj.model_struct.nh = value;
			elseif (strcmp(field, 'nh_e'))
				obj.nh_e = value;
				obj.model_struct.nh_e = value;
			% symbolics
			elseif (strcmp(field, 'sym_x'))
				obj.sym_x = value;
				obj.model_struct.sym_x = value;
			elseif (strcmp(field, 'sym_xdot'))
				obj.sym_xdot = value;
				obj.model_struct.sym_xdot = value;
			elseif (strcmp(field, 'sym_u'))
				obj.sym_u = value;
				obj.model_struct.sym_u = value;
			elseif (strcmp(field, 'sym_z'))
				obj.sym_z = value;
				obj.model_struct.sym_z = value;
			% cost
			elseif (strcmp(field, 'cost_type'))
				obj.cost_type = value;
				obj.model_struct.cost_type = value;
			elseif (strcmp(field, 'cost_e_type'))
				obj.cost_e_type = value;
				obj.model_struct.cost_e_type = value;
			elseif (strcmp(field, 'expr_y'))
				obj.expr_y = value;
				obj.model_struct.expr_y = value;
			elseif (strcmp(field, 'expr_y_e'))
				obj.expr_y_e = value;
				obj.model_struct.expr_y_e = value;
			elseif (strcmp(field, 'Vu'))
				obj.Vu = value;
				obj.model_struct.Vu = value;
			elseif (strcmp(field, 'Vx'))
				obj.Vx = value;
				obj.model_struct.Vx = value;
			elseif (strcmp(field, 'Vx_e'))
				obj.Vx_e = value;
				obj.model_struct.Vx_e = value;
			elseif (strcmp(field, 'W'))
				obj.W = value;
				obj.model_struct.W = value;
			elseif (strcmp(field, 'W_e'))
				obj.W_e = value;
				obj.model_struct.W_e = value;
			elseif (strcmp(field, 'yr'))
				obj.yr = value;
				obj.model_struct.yr = value;
			elseif (strcmp(field, 'yr_e'))
				obj.yr_e = value;
				obj.model_struct.yr_e = value;
			% dynamics
			elseif (strcmp(field, 'dyn_type'))
				obj.dyn_type = value;
				obj.model_struct.dyn_type = value;
			elseif (strcmp(field, 'expr_f'))
				obj.expr_f = value;
				obj.model_struct.expr_f = value;
			% constraints
			elseif (strcmp(field, 'constr_type'))
				obj.constr_type = value;
				obj.model_struct.constr_type = value;
			elseif (strcmp(field, 'x0'))
				obj.x0 = value;
				obj.model_struct.x0 = value;
			elseif (strcmp(field, 'Jbx'))
				obj.Jbx = value;
				obj.model_struct.Jbx = value;
			elseif (strcmp(field, 'lbx'))
				obj.lbx = value;
				obj.model_struct.lbx = value;
			elseif (strcmp(field, 'ubx'))
				obj.ubx = value;
				obj.model_struct.ubx = value;
			elseif (strcmp(field, 'Jbu'))
				obj.Jbu = value;
				obj.model_struct.Jbu = value;
			elseif (strcmp(field, 'lbu'))
				obj.lbu = value;
				obj.model_struct.lbu = value;
			elseif (strcmp(field, 'ubu'))
				obj.ubu = value;
				obj.model_struct.ubu = value;
			elseif (strcmp(field, 'C'))
				obj.C = value;
				obj.model_struct.C = value;
			elseif (strcmp(field, 'D'))
				obj.D = value;
				obj.model_struct.D = value;
			elseif (strcmp(field, 'lg'))
				obj.lg = value;
				obj.model_struct.lg = value;
			elseif (strcmp(field, 'ug'))
				obj.ug = value;
				obj.model_struct.ug = value;
			elseif (strcmp(field, 'C_e'))
				obj.C_e = value;
				obj.model_struct.C_e = value;
			elseif (strcmp(field, 'lg_e'))
				obj.lg_e = value;
				obj.model_struct.lg_e = value;
			elseif (strcmp(field, 'ug_e'))
				obj.ug_e = value;
				obj.model_struct.ug_e = value;
			elseif (strcmp(field, 'expr_h'))
				obj.expr_h = value;
				obj.model_struct.expr_h = value;
			elseif (strcmp(field, 'lh'))
				obj.lh = value;
				obj.model_struct.lh = value;
			elseif (strcmp(field, 'uh'))
				obj.uh = value;
				obj.model_struct.uh = value;
			elseif (strcmp(field, 'expr_h_e'))
				obj.expr_h_e = value;
				obj.model_struct.expr_h_e = value;
			elseif (strcmp(field, 'lh_e'))
				obj.lh_e = value;
				obj.model_struct.lh_e = value;
			elseif (strcmp(field, 'uh_e'))
				obj.uh_e = value;
				obj.model_struct.uh_e = value;
			else
				disp(['acados_integrator_model: set: wrong field: ', field]);
			end
		end

	end % methods



end % class


