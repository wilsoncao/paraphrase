function [ cost,grad ] = Recursive_autoencoder_cost( params, info,training,wd )

cost = J(params,info,training,wd);
[params, info] = Jgrad( params,info,training,wd );
grad = params;

end

